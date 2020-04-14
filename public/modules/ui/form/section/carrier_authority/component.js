class UIFormSectionCarrierAuthorityCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionCarrierAuthority', {
  templateUrl: 'modules/ui/form/section/carrier_authority/template.html',
  controller: ['FormService', UIFormSectionCarrierAuthorityCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});