app.component('uiTableColheader', {
  templateUrl: 'modules/ui/table/colheader/template.html',
  bindings: {
    index: '<?',
    data: '<?',
    focusMe: '&?',
    sortDirection: '&?',
    updateField: '&?'
  }
});