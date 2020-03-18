app.component('uiTableSortArrowHoriz', {
  templateUrl: 'modules/ui/table/search/sort/arrows/horiz/template.html',
  controller: 'UITableSortArrowCtrl',
  bindings: {
    updateField: '&?',
    field: '<?',
    upDir: '<?',
    downDir: '<?',
    direction: '<?'
  }
});