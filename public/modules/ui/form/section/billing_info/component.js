class UIFormSectionBillingInfoCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}

app.component('uiFormSectionBillingInfo', {
  templateUrl: 'modules/ui/form/section/billing_info/template.html',
  controller: UIFormSectionBillingInfoCtrl,
  bindings: {
    data: '=?',
    section: '<?'
  }
});