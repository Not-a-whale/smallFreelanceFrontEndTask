app.component('uiFormSectionNotes', {
  templateUrl: 'modules/ui/form/section/notes/template.html',
  bindings: {
    data: '=?', // must be an array
    section: '<?'
  }
});