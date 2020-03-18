app.component('uiTableSortArrowHoriz', {
  templateUrl: 'modules/generic/table/transclude/search/sort/arrows/horiz/template.html',
  controller: 'UITableSortArrowCtrl',
  bindings: {
    updateField: '&?',
    field: '<?',
    upDir: '<?',
    downDir: '<?',
    direction: '<?'
  }
});