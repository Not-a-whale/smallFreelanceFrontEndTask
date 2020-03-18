class UITableSearchChipbarCtrl {
  constructor(scope, chipsrv) {
    this.scope = scope;
    this.chipsrv = chipsrv;
  }

  HasChips() {
    return this.chipsrv.HasChips();
  }

  Chips() {
    return this.chipsrv.GetChips();
  }

  RemoveChip(chip) {
    this.chipsrv.RemoveChip(chip);
  }

  ClearFilters() {
    this.chipsrv.ClearChips();
    this.scope.$emit('SearchClear');
  }
}

app.component('uiTableSearchChipbar', {
  templateUrl: 'modules/ui/table/search/chipbar/template.html',
  controller: ['$scope', 'TableSortChips', UITableSearchChipbarCtrl]
});