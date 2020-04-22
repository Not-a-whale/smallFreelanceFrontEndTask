class ListInsertItem {
  static index = 0;
  constructor(data) {
    this.data = data;
    this.selected = false;
    this.index = ListInsertItem.index++;
    this.clean = false;
  }
  isSelected() {
    return this.selected;
  }

  Toggle() {
    return this.selected = !this.selected;
  }

  SetSelected(value) {
    return this.selected = (value && true);
  }
  isClean() {
    return this.clean;
  }
  SetClean() {
    return this.clean = true;
  }
}


class UIListInsertCtrl {
  constructor($scope, $element) {
    this.element = $element;
    this.scope = $scope;
    this.item = undefined;
  }
  SetActive(value) {
    this.item.SetSelected(value);

    if (this.item.isSelected()) {
      this.element.addClass('active');
    } else {
      this.element.removeClass('active');
    }
  }

  Delete(state) {
    this.scope.$emit('list-item-delete', this.item, state);
  }

  $onInit() {
    let self = this;
    this.scope.$on('list-select', function (event, args) {
      self.SetActive(self.item.index == args.index);
    });
  }
}

app.component('uiListInsert', {
  require: {
    listCtrl: '^uiList'
  },
  templateUrl: function ($element, $attrs) {
    let template = 'modules/ui/list/insert.template.html';
    if ('type' in $attrs && $attrs.type != undefined && $attrs.type != '') {
      template = 'modules/ui/list/types/' + $attrs.type + '.insert.template.html';
    }
    return template;
  },
  controller: UIListInsertCtrl,
  bindings: {
    item: '<',
    onSelect: '&?',
    onDelete: '&?'
  }
});

class UIListCtrl {
  constructor(APIService, $scope, $state) {
    this.apisrv = APIService;
    this.scope = $scope;
    this.state = $state;
    this.items = [];
    this.endpoint = undefined;
    this.query = undefined;

    this.search_query = undefined; // this is for searchable lists only 1 entry
  }

  $onChanges(changes) {
    console.log(changes);
    if ('list' in changes) {
      this.MapDataToItems(this.list);
    }
  }
  SetQuery() {
    if (this.query == undefined) {
      this.query = {
        "search": [{}],
        "orderby": []
      };
    }


    for (let search in this.search_query) {
      let searchobj = this.query.search.find(x => search in x);
      if (searchobj != undefined) {
        searchobj[search] = this.search_query[search];
      } else {
        let searchobj = {};
        searchobj[search] = this.search_query[search];
        this.query.search.push(searchobj);
      }
    }
  }

  Select(item) {

    if (this.onSelect instanceof Function) {

      this.onSelect({
        item: item
      });
    }
    this.scope.$broadcast('list-select', {
      'index': item.index
    });
  }

  GetData() {
    if (this.endpoint != undefined) {
      let self = this;
      this.SetQuery();
      this.apisrv.List(this.endpoint, this.query).then(function (res) {
        if (res instanceof ErrorObj) {
          console.log(res.ErrorMessage());
        } else {
          self.MapDataToItems(res);
        }
      });
    } else {
      console.error('missing endpoint');
    }
  }

  MapDataToItems(data) {
    if (data == undefined) {
      return undefined;
    }
    this.items = [];
    let clean = undefined;
    let todelete = [];
    for (let x of data) {
      if (x instanceof ListInsertItem) {
        this.items.push(x);
      } else if (angular.equals({}, x)) {
        if (clean == undefined) {
          clean = new ListInsertItem(x);
          clean.SetClean();
        } else {
          todelete.push(x);
        }
      } else {
        this.items.push(new ListInsertItem(x));
      }
    }
    if (clean != undefined) {
      this.items.unshift(clean);
    }
    for (let x of todelete) {
      let index = data.indexOf(x);
      data.splice(index, 1);
    }
    return this.items;
  }

  DeleteItem(item, state) {
    if (item instanceof ListInsertItem) {
      if (!item.isClean()) {
        let self = this;
        this.apisrv.Delete(this.endpoint, item.data).then(function (res) {
          if (res instanceof ErrorObj) {
            console.log(res.ErrorMessage());
          } else {
            self.GetData();
            if (state != undefined) {
              self.state.go(state);
            }
          }
        });
      }
    } else {
      this.state.go(state);
    }
  }

  $onInit() {
    let self = this;
    if (this.list != undefined) {
      this.MapDataToItems(this.list);
    } else {
      this.GetData();
    }

    this.scope.$on('list-refresh', function (event) {
      self.GetData();
    });

    this.scope.$on('list-reload', function (event) {
      self.GetData();
    });
    this.scope.$on('list-item-delete', function (event, item, state) {
      self.DeleteItem(item, state);
    });
  }
}

app.component('uiList', {
  templateUrl: function ($element, $attrs) {
    let template = 'modules/ui/list/list.template.html';
    if ('type' in $attrs && $attrs.type != undefined && $attrs.type != '') {
      template = 'modules/ui/list/types/' + $attrs.type + '.list.template.html';
    }
    return template;
  },
  controller: UIListCtrl,
  bindings: {
    onSelect: '&',
    endpoint: '<',
    query: '<',
    list: '=' // this will be converted to required data type
  }
});