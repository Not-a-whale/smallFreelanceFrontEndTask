app.component('uiTableColheader', {
  templateUrl: 'modules/generic/table/transclude/colheader/template.html',
  bindings: {
    index: '<?',
    data: '<?',
    focusMe: '&?',
    sortDirection: '&?',
    updateField: '&?'
  }
});