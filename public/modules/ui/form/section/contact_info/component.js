class UIFormSectionContactInfoCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionContactInfo', {
  templateUrl: 'modules/ui/form/section/contact_info/template.html',
  controller: ['FormService', UIFormSectionContactInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});