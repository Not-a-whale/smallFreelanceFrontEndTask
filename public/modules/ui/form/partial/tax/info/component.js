class UIFormPartialTaxInfoCtrl {
  constructor() {

  }
  $onInit() {
    if (this.data == undefined) {
      this.data = {};
    }
    if (!('ID_Type' in this.data)) {
      if (this.data.ID_Type == undefined) {
        this.data.ID_Type = 'SSN';
      }
    }
  }
}

app.component('uiFormPartialTaxInfo', {
  templateUrl: 'modules/ui/form/partial/tax/info/template.html',
  controller: UIFormPartialTaxInfoCtrl,
  bindings: {
    data: '=?'
  }

});