class UIFormSectionCompanyInfoCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionCompanyInfo', {
  templateUrl: 'modules/ui/form/section/company_info/template.html',
  controller: ['FormService', UIFormSectionCompanyInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});