class ListInsertItem {
  static index = 0;
  constructor(data) {
    this.data = data;
    this.selected = false;
    this.index = ListInsertItem.index++;
    this.clean = false;
  }
  IsSelected() {
    return this.selected;
  }

  Toggle() {
    return this.selected = !this.selected;
  }

  SetSelected(value) {
    return this.selected = (value && true);
  }
  IsClean() {
    return this.clean;
  }
  SetClean() {
    return this.clean = true;
  }
}


// class UIListInsertCtrl {
//   constructor($scope, $element) {
//     this.element = $element;
//     this.scope = $scope;
//     this.item = undefined;
//   }
//   SetActive(value) {
//     this.item.SetSelected(value);

//     if (this.item.isSelected()) {
//       this.element.addClass('active');
//     } else {
//       this.element.removeClass('active');
//     }
//   }

//   Delete(state) {
//     this.scope.$emit('list-item-delete', this.item, state);
//   }

//   $onInit() {
//     let self = this;
//     this.scope.$on('list-select', function (event, args) {
//       self.SetActive(self.item.index == args.index);
//     });
//   }
// }

// use item for this directive
app.directive('uiListInsert', function () {
  return {
    templateUrl: function ($element, $attrs) {
      let template = 'modules/ui/list/insert.template.html';
      if ('type' in $attrs && $attrs.type != undefined && $attrs.type != '') {
        template = 'modules/ui/list/types/' + $attrs.type + '.insert.template.html';
      }
      return template;
    }
  }
});

class UIListCtrl {
  constructor(APIService, $scope, $state, ErrorService) {
    this.apisrv = APIService;
    this.errorsrv = ErrorService;
    this.scope = $scope;
    this.state = $state;
    this.items = [];
    this.endpoint = undefined;
    this.query = undefined;

    this.user_query = undefined;
  }

  $onChanges(changes) {
    if ('list' in changes) {
      this.MapDataToItems(this.list);
    }
  }
  SetQuery() {
    if (this.query == undefined) {
      this.query = {};
    }
    if (!('search' in this.query)) {
      this.query.search = [];
    }
    if (!('strict' in this.query)) {
      this.query.strict = [];
    }
    if (!('orderby' in this.query)) {
      this.query.order_by = [];
    }

    for (let search in this.user_query) {
      let searchobj = this.query.search.find(x => search in x);
      if (searchobj != undefined) {
        searchobj[search] = this.user_query[search];
      } else {
        let searchobj = {};
        searchobj[search] = this.user_query[search];
        this.query.search.push(searchobj);
      }
    }
  }

  Select(item) {
    if (item != undefined) {
      for (let i of this.items) {
        i.SetSelected(false);
      }
      item.SetSelected(true);

    }
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
          console.log(self.errorsrv.ReadError(res));
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
    console.log(item);
    let item_data = null;
    if (item != undefined) {
      if (item instanceof ListInsertItem) {
        if (!item.IsClean()) {
          item_data = item.data;
        }
      } else {
        item_data = item; //this is probably an id or something
      }
    }

    if (item_data != null) {
      let self = this;
      this.apisrv.Delete(this.endpoint, item_data).then(function (res) {
        if (res instanceof ErrorObj) {
          alert(self.errorsrv.ReadError(res));
        } else {
          self.GetData();
          if (state != undefined) {
            self.state.go(state);
          }
        }
      });
    } else {
      this.state.go(state);
    }
  }

  PickOne(generated, defaultval) {
    if (generated == undefined || generated == '' || generated == ' ') {
      return defaultval;
    }
    return generated;
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
  controllerAs: '$listctrl',
  bindings: {
    onSelect: '&',
    endpoint: '<',
    query: '<',
    list: '=' // this will be converted to required data type
  }
});