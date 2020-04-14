class UIFormSectionUserAccountCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionUserAccount', {
  templateUrl: 'modules/ui/form/section/user_account/template.html',
  controller: ['FormService', UIFormSectionUserAccountCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});