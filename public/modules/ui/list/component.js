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

  setSelected(value) {
    return this.selected = (value && true);
  }
  isClean() {
    return this.clean;
  }
  setClean() {
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
    this.item.setSelected(value);

    if (this.item.isSelected()) {
      this.element.addClass('active');
    } else {
      this.element.removeClass('active');
    }
  }

  Delete() {
    this.scope.$emit('list-item-delete', this.item);
  }

  $onInit() {
    let self = this;
    this.scope.$on('list-select', function (event, args) {
      self.SetActive(self.item.index == args.index);
    });
  }
}

app.component('uiListInsert', {
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
  constructor(APIService, $scope) {
    this.apisrv = APIService;
    this.scope = $scope;
    this.items = [];
    this.endpoint = undefined;
    this.query = undefined;

    this.search_query = undefined; // this is for searchable lists only 1 entry
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
    console.log('called select for item ');
    if (this.onSelect instanceof Function) {
      console.log('called onSelect for item ');
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
          self.items = res.map(x => new ListInsertItem(x));
        }
      });
    }

  }

  DeleteItem(item) {

    if (!item.isClean()) {
      let self = this;
      this.apisrv.Delete(this.endpoint, item.data).then(function (res) {
        if (res instanceof ErrorObj) {
          console.log(res.ErrorMessage());
        } else {
          self.GetData();
        }
      });
    } else {
      let index = this.items.indexOf(item);
      this.items.splice(index, 1);
    }

  }

  AddNewEmpty() {
    if (!(this.items[this.items.length - 1].isClean())) {
      console.log('adding new item');
      let cleanitem = new ListInsertItem();
      cleanitem.setClean();
      this.items.push(cleanitem);
    }
  }

  $onInit() {
    let self = this;
    this.GetData();
    this.scope.$on('list-refresh', function (event) {
      self.GetData();
    });

    this.scope.$on('list-item-delete', function (event, item) {
      self.DeleteItem(item);
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
    query: '<'
  }
});