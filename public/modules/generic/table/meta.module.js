/* provides control logic for any generic table */
class MetaTableCtrl extends MetaGateCtrl {
  constructor(getid, scope, element, timeout) {
    super();
    this.id = getid();
    this.scope = scope;
    this.element = element;
    this.timeout = timeout;
    this.timeoutCall = {};

    this.searchVal = {};
    this.searchOrd = {};
    this.expanded = false;
    this.selectCount = 0;

    this.searchView = "table_search";
    this.selectView = "table_select";
    this.contentView = "table_content";
    this.editView = "table_edit";
    this.bannerView = "table_banner";
  }

  _ListofAttrs(obj) {
    let list = [];
    for (let i in obj) {
      if (obj[i] !== '' && obj[i] !== undefined) {
        let newobj = {}
        newobj[i] = obj[i];
        list.push(newobj);
      }
    }
    return list;
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

  SearchExpand() {
    this.expanded = true;
  }

  SearchToggle() {
    this.expanded = !this.expanded;
  }

  /* Function that puts the search query and order together */

  Search() {

    if (this.onSearch instanceof Function) {
      this.timeout.cancel(this.timeoutCall['search']);
      var self = this;
      this.timeoutCall['search'] = this.timeout(
        function () {

          let fields = self._ListofAttrs(self.searchVal);
          let order = self._ListofAttrs(self.searchOrd);

          self.onSearch({
            query: {
              search: {
                fields: fields,
                orderby: order
              }
            }
          });
        }, 500);
    } else {
      console.error("table onSearch is not bound");
    }
  }

  SearchFocus(index) {
    var self = this;
    var focusfun = function () {
      self.scope.$broadcast('SearchFocus', {
        'index': index
      });
    };
    if (this.expanded) {
      focusfun();
    } else {
      this.timeout(focusfun, 150);
    }
  }

  SearchOrder(key, dir) {
    dir = this._SearchOrderDir(dir);

    if (key in this.searchOrd && this.searchOrd[key] == dir) {
      delete this.searchOrd[key];
    } else {
      this.searchOrd[key] = dir;
    }
  }

  SearchOrderActive(key, dir){
    dir = this._SearchOrderDir(dir);
    if (key in this.searchOrd){
      return this.searchOrd[key] === dir;
    }
    return false;
  }

  _SearchOrderDir(dir){
    if (dir == 'up') {
      return 1;
    }
    return 0;
  }

  $onInit() {
    super.$onInit();
    this.SelectCount();
    let self = this;
    this.scope.$on('TableSearch', function (event, data) {
      self.Search();
    });
  }
}

var meta_table_bindings = CloneObj(meta_bindings);
meta_table_bindings.searchView = '@?'; // name of the view that the search bar goes into
meta_table_bindings.selectView = '@?'; // name of the view that the extra options for selected
meta_table_bindings.contentView = '@?'; // name of view that the row template goes into, this can include options
meta_table_bindings.onSearch = '&'; // when the user searches, this function is called table just passes it the search data object

app.controller("MetaTableCtrl", ['getid', '$scope', '$element', '$timeout', MetaTableCtrl]);