class GenericTableCtrl {
  constructor(getid, scope, element, timeout) {
    this.id = getid();
    this.scope = scope;
    this.element = element;
    this.timeout = timeout;
    this.timeoutCall = {};
    this.list = []; // the contents to display
    this.headers = []; // display the headers
    this.search = []; // the search fields
    this.searchVal = {};
    this.expanded = false;
    this.selectCount = 0;
    this.rows = 10;
    this.page = 1;
    this.rowHeight = '50px';
    // tables will have a maximum of 12 columns
    // the numbers must add up to at most 12.
    // the headers object attribute will be the determining factor
    // for how many columns there are.
    this.colsize = [
      'c1', 'c1', 'c1',
      'c1', 'c1', 'c1',
      'c1', 'c1', 'c1',
      'c1', 'c1', 'c1'
    ];

    this.searchView = "table_search";
    this.selectView = "table_select";
    this.contentView = "table_content";
    this.editView = "table_edit";
    this.bannerView = "table_banner";

  }

  _SelectMulti(item) {
    item.selected = !item.selected;
  }

  _SelectSingle(item) {
    if (item.selected) {
      item.selected = false;
    } else {
      for (let l of this.list) {
        l.selected = false;
      }

      item.selected = true;
    }
  }

  Select(item) {
    this._SelectMulti(item);
  }

  SelectCount() {
    let totalselected = 0;
    for (let el of this.list) {
      if (el.selected) {
        totalselected++;
      }
    }
    this.selectCount = totalselected;
    return totalselected;
  }

  SelectAll() {
    for (let el of this.list) {
      el.selected = true;
    }
    this.SelectCount();
  }

  SelectClear() {
    for (let el of this.list) {
      el.selected = false;
    }
    this.selectCount = 0;
  }

  SelectToggle() {
    let selected = this.SelectCount();
    if (selected < this.list.length) {
      this.SelectAll();
    } else {
      this.SelectClear();
    }
  }

  SearchExpand() {
    this.expanded = true;
  }

  SearchToggle() {
    this.expanded = !this.expanded;
  }

  SearchField(field, value) {
    this.searchVal[field] = value;
    this.Search();
  }

  Search() {
    if (this.onSearch instanceof Function) {
      this.timeout.cancel(this.timeoutCall['search']);
      var self = this;
      this.timeoutCall['search'] = this.timeout(
        function () {
          self.onSearch({
            data: self.searchVal
          });
        }, 500);
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

  BuildSearchQuery() {
    return '';
  }

  BuildQuery() {
    let query = this.url;
    query += "?rc=" + this.rows + "&pg=" + this.page;
    query += this.BuildSearchQuery();
    return query;
  }

  $onInit() {
    this.SelectCount();
  }
}


class GenericTableSearchCtrl {
  constructor(getid) {
    this.id = getid();
    this.search = [];
    this.colsize = [];
  }

  $onInit() {
    if (this.search == undefined) {
      let id = this.id;
      console.error("No search list provided for table search " + id);
    }
  }
}

app.controller("GenericTableSearchCtrl", ['getid', GenericTableSearchCtrl]);

app.controller("GenericTableCtrl", ['getid', '$scope', '$element', '$timeout', GenericTableCtrl]);

var table_bindings = {
  list: '<?', // items to display inside of the row
  headers: '<?', // the header names in list order
  search: '<?', // the search names for the headers, this dictates no. of cols
  colsize: '<?', // the sizes of the columns
  rowHeight: '@?', // the min-height of the rows
  searchView: '@?', // name of the view that the search bar goes into
  selectView: '@?', // name of the view that the extra options for selected
  contentView: '@?', // name of view that the row template goes into, this can include options
  onSearch: '&' // when the user searches, this function is called table just passes it the search data object
};

app.component("genericTable", {
  controller: "GenericTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/selector/default.html",
  bindings: table_bindings
});

app.component("genericTableSearch", {
  controller: "GenericTableSearchCtrl",
  bindings: {
    search: '<?', // the search fields
    colsize: '<?', // used to align the content
    onSearch: '&' // what to do when user clicks search / types data
  },
  templateUrl: "modules/generic/table/search.template.html"
});

var table_row_bindings = {
  item: '<',
  colsize: '<',
  edit: '<?',
  onUpdate: '&'
};

app.component("transactionTableRow", {
  bindings: table_row_bindings,
  templateUrl: "modules/generic/table/row_template.html"
});

app.component("transactionTableRow2", {
  bindings: table_row_bindings,
  templateUrl: "modules/generic/table/row_template2.html"
});

// app.component("tableBanner", {
//   templateUrl: "modules/generic/table/banner_template.html"
// });