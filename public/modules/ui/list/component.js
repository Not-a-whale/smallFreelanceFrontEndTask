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
    this.api = APIService;
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
    //TODO remove if deprecated
    this.scope.$broadcast('ui-list-select', {
      'index': item.index
    });
  }

  GetData(func, params) {
    let self = this;
    let apiFunc = func || this.apiCall;
    let apiParams = this.apiParams || {};

    if (this.user_query != undefined) {
      apiParams.user_query = this.user_query;
    } else {
      apiParams.user_query = null;
    }




    if (apiFunc != undefined) {
      if (params != undefined) {
        for (let qparam in params) {
          apiParams[qparam] = params[qparam];
        }
      }
      this.api.CallFunction(apiFunc, apiParams).then(function (result) {
        if (result instanceof ErrorObj) {
          console.log(self.errorsrv.ReadError(result));
        } else {
          self.MapDataToItems(result);
        }
      });
    } else {
      console.error('Unknown api call');
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

  DeleteItem(func, params, state) {
    let self = this;
    this.api.CallFunction(func, params).then(function (res) {
      if (res instanceof ErrorObj) {
        alert(self.errorsrv.ReadError(res));
      } else {
        self.GetData();
        if (state != undefined) {
          self.state.go(state, {}, {
            reload: true
          });
        }
      }
    });
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

    let reload_listener = function (event, params) {
      let getdata = true;
      if (params != undefined) {
        if ('id' in params) {
          if (params.id != self.listId) {
            getdata = false;
          }
        }
      }

      if (getdata) {
        self.GetData();
      }
    }

    this.scope.$on('ui-list-refresh', reload_listener);
    this.scope.$on('ui-list-reload', reload_listener);
    this.scope.$on('ui-list-item-delete', function (event, item, state) {
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
    apiCall: '<?', // string name of api function
    apiParams: '<?', // object of api's function param to value
    listId: '<?', // used to identify which list needs to be reloaded
    onSelect: '&',
    list: '=' // this will be converted to required data type
  }
});