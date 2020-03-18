app.component('uiTableSortArrowVert', {
  templateUrl: 'modules/ui/table/search/sort/arrows/vert/template.html',
  controller: 'UITableSortArrowCtrl',
  bindings: {
    updateField: '&?',
    field: '<?',
    upDir: '<?',
    downDir: '<?',
    direction: '<?'
  }
});