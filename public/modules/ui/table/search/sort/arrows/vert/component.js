app.component('uiTableSortArrowVert', {
  templateUrl: 'modules/generic/table/transclude/search/sort/arrows/vert/template.html',
  controller: 'UITableSortArrowCtrl',
  bindings: {
    updateField: '&?',
    field: '<?',
    upDir: '<?',
    downDir: '<?',
    direction: '<?'
  }
});