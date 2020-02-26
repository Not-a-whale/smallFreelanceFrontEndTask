class TableCoreCtrl {
  constructor(scope, state, chipsrv, timeout) {
    this.scope = scope;
    this.timeout = timeout;
    // used to focus the input fields, need to delay after search expands
    this.focuscall = undefined;
    this.chipsrv = chipsrv;
    this.state = state;
    this.page = 1;
    this.rows = undefined;

    // This needs to be set in concrete class
    this.fields = [];
    // This needs to be set in concrete class
    this.map = {};

    // holds ErrorObjs
    this.errors = [];
  }

  Search(query) {
    console.log('TableCore search, needs overriding');
  }

  PageChange(page, rows) {
    this.page = page;
    this.rows = rows;
    this.PrepSearch();
  }

  PrepSearch() {
    let args = {};

    if (this.page != undefined) {
      if (Number.isInteger(this.page)) {
        args.page = this.page;
      }
    }
    if (this.rows != undefined) {
      if (Number.isInteger(this.rows)) {
        args.rows = this.rows;
      }
    }

    args.fields = this.chipsrv.GetChips();
    args.sort = this.chipsrv.GetSort();
    console.log('broadcasting TableSearch with args');
    this.scope.$broadcast('TableSearch', args);
  }

  UpdateSort(field, value) {
    this.chipsrv.SetSort(field, value);
    this.chipsrv.SetOrder(field);
    this.PrepSearch();
  }

  UpdateField(field, value) {
    this.chipsrv.AddChip(field, value);
    this.PrepSearch();
  }

  Select(item) {
    console.log('TableCore select, needs overriding');
  }

  FocusMe(index) {
    let self = this;
    let args = {
      index: index
    };
    this.scope.$broadcast('SearchOpen');
    this.timeout(function () {
      self.scope.$broadcast('SearchFocus', args);
    }, 100);
  }

  $onInit() {
    this.chipsrv.Reset();
    this.chipsrv.SetMap(this.map);
    this.UpdateSort(this.fields[0].name, 'up');
    let self = this;
    let handle = this.scope.$on('TableSearchInit', function (res) {
      self.PrepSearch();
    });
    this.scope.$on('$destroy', handle);
  }
}