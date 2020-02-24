/* provides control logic for any generic table */
class UIFlowoutTableCtrl {
  constructor(scope, element, timeout, errsrv) {

    this.scope = scope;
    this.element = element;
    this.timeout = timeout;
    this.errsrv = errsrv;
    this.timeoutCall = {};
    this.search_delay = 300; //in ms

    // mapping of field names to data names expected by API
    this.mapping = {};
    // fields associated with table
    // contained inside of outer component
    this.fields = [];

    this.expanded = false;
    this.selectCount = 0;

    this.page = 1;
    this.rows = 25;
  }
  _CanIterate(obj) {
    return obj !== undefined && typeof obj[Symbol.iterator] === 'function';
  }

  _SelectMulti(item) {
    item.selected = !item.selected;
  }

  _SelectSingle(item) {
    if (item.selected) {
      item.selected = false;
    } else {
      if (this._CanIterate(this.gate)) {
        for (let l of this.gate) {
          l.selected = false;
        }
      }
      item.selected = true;
    }
  }

  /* override this method */
  Select(item) {
    this._SelectMulti(item);
  }

  SelectCount() {
    let totalselected = 0;
    if (this._CanIterate(this.gate)) {
      for (let el of this.gate) {
        if (el.selected) {
          totalselected++;
        }
      }
      this.selectCount = totalselected;
    }
    return totalselected;
  }

  SelectAll() {
    if (this._CanIterate(this.gate)) {
      for (let el of this.gate) {
        el.selected = true;
      }
    }
    this.SelectCount();
  }

  SelectClear() {
    if (this._CanIterate(this.gate)) {
      for (let el of this.gate) {
        el.selected = false;
      }
    }
    this.selectCount = 0;
  }

  SelectToggle() {
    let selected = this.SelectCount();
    if (selected > 0) {
      this.SelectClear();
    } else {
      this.SelectAll();
    }
  }

  /* Function that puts the search query and order together */
  SearchPrep(args) {
    if (this.onSearch instanceof Function) {
      console.log("generic table search function prepping timeout call");
      let self = this;
      this.timeout.cancel(this.timeoutCall['search']);
      this.timeoutCall['search'] = this.timeout(
        function () {
          let query = {
            rows: self.rows,
            page: self.page
          };

          if (args != undefined) {
            if ('sort' in args) {
              let orderby = self.MapOrderFields(args.sort, self.mapping);
              if (orderby.length > 0) {
                query.orderby = orderby;
              }
            }

            if ('fields' in args) {
              let search = self.MapSearchFields(args.fields, self.mapping);
              if (search.length > 0){
                query.search = search;
              }
            }
          }
          console.log(args);
          console.log(query);
          self.onSearch({
            query: query
          });
        }, this.search_delay);
    } else {
      console.error("table onSearch is not bound");
    }
  }

  // Fields is supposed to be a list of Chip Obj
  MapSearchFields(fields, mapping) {
    if (mapping == undefined) {
      console.error("Table missing mapping for MapSearchFields");
      return;
    }
    let search = [];
    for (let f of fields) {
      if (f.Valid()) {
        if (f.name in mapping) {
          let searchcol = {};
          for (let mapname of mapping[f.name]) {
            searchcol[mapname] = f.value;
          }
          search.push(searchcol);
        }
      }
    }
    return search;
  }

  // Fields is supposed to be an object of objects
  MapOrderFields(fields, mapping) {
    if (mapping == undefined) {
      console.error("Table missing mapping for MapOrderFields");
      return;
    }
    let orderby = [];
    //prep array because will receive out of order
    for (let f in fields) {
      orderby.push([]);
    }

    for (let f in fields) {
      // capture current field object
      let fobj = fields[f];
      if (fobj.order != null && fobj.sort != null) {
        if (f in mapping) {
          for (let mapname of mapping[f]) {
            let sortobj = {};
            if (fobj.sort == 'up') {
              sortobj[mapname] = 'asc';
            } else {
              sortobj[mapname] = 'desc';
            }
            let stack = orderby[fobj.order];
            if (stack != undefined) {
              stack.push(sortobj);
            } else {
              console.error('Mapping order fields bucket undefined');
            }
          }
        }
      }
    }
    return orderby.flat();
  }

  RemoveError(error){
    let index = this.errors.indexOf(error);
    this.errors.splice(index, 1);
  }

  $onInit() {
    this.SelectCount();
    let self = this;
    let handle = this.scope.$on('TableSearch', function (event, data) {
      console.log("table caught search emit/broadcast");
      if (event.stopPropagation instanceof Function) {
        event.stopPropagation();
      }
      self.SearchPrep(data);
    });
    this.scope.$on('$destroy', handle);
  }
}

var meta_table_bindings = CloneObj(meta_bindings);
meta_table_bindings.searchView = '@?'; // name of the view that the search bar goes into
meta_table_bindings.selectView = '@?'; // name of the view that the extra options for selected
meta_table_bindings.contentView = '@?'; // name of view that the row template goes into, this can include options
meta_table_bindings.onSearch = '&'; // when the user searches, this function is called table just passes it the search data object

app.controller("UIFlowoutTableCtrl", ['$scope', '$element', '$timeout', 'ErrorService', UIFlowoutTableCtrl]);
app.directive('uiTableFlowout', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/generic/table/transclude/skeleton/template.html',
    scope: true,
    controller: 'UIFlowoutTableCtrl',
    controllerAs: '$ctrl',
    bindToController: {
      onSelect: '&?',
      onSearch: '&?',
      mapping: '=?',
      fields: '=?',
      errors: '<?'
    },
    transclude: {
      header: 'headerBanner',
      fields: '?searchFields',
      body: 'bodyContent'
    }
  };
});


app.directive('uiTableDefault', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/generic/table/transclude/skeleton/template.html',
    scope: true,
    controller: 'UIFlowoutTableCtrl',
    controllerAs: '$ctrl',
    bindToController: {
      onSelect: '&?',
      onSearch: '&?',
      mapping: '=?',
      fields: '=?',
      errors: '<?'
    },
    transclude: {
      header: 'headerBanner',
      fields: '?searchFields',
      body: 'bodyContent'
    }
  };
});