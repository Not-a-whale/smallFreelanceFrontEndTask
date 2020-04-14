class UIFormSectionCarrierInfoCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionCarrierInfo', {
  templateUrl: 'modules/ui/form/section/carrier_company_info/template.html',
  controller: ['FormService', UIFormSectionCarrierInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});