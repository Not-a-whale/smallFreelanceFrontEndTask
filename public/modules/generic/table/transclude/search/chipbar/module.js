class UITableSearchChipbarCtrl {
  constructor(chipsrv) {
    this.chipsrv = chipsrv;
  }
}

app.component('uiTableSearchChipbar', {
  templateUrl: 'modules/generic/table/transclude/search/chipbar/template.html',
  controller: ['TableSortChips', UITableSearchChipbarCtrl]
});