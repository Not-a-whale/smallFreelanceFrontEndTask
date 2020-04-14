class TableCoreCtrl {
  constructor(scope, state, chipsrv, apisrv, timeout) {
    this.scope = scope;
    this.timeout = timeout;
    // used to focus the input fields, need to delay after search expands
    this.focuscall = undefined;
    this.chipsrv = chipsrv;
    this.apisrv = apisrv;
    this.state = state;
    this.page = 1;
    this.rows = undefined;

    // This needs to be set in concrete class
    this.fields = [];
    // This needs to be set in concrete class
    this.map = {};

    // holds ErrorObjs
    this.errors = [];

    this.searchurl = undefined; // the endpoint to use to get the table list
    this.profilestate = undefined; // the state to go to for profile view, id will be passed in
    this.tableList = []; //holds the list to display in the table
  }

  Search(query) {
    if (this.searchurl != undefined) {
      let self = this;
      return this.apisrv.Table(this.searchurl, query).then(function (data) {
        self.tableList = data;
      });
    }
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
    if (this.profilestate != undefined) {

      let params = CloneObj(this.stateparams);
      params.id = this.GetId(item);
      this.state.go(this.profilestate, params);
    }

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
    this.scope.$on('TableSearchInit', function (res) {
      self.PrepSearch();
    });
  }
}