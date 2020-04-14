class UIFormPartialAddressCtrl {
  constructor() {
    this.default_country = 'USA';
  }

  $onInit() {
    if (this.data == undefined) {
      this.data = {};
    }
    if (this.data.Country == undefined || this.data.Country == '') {
      this.data.Country = this.default_country;
    }

  }
}

app.component('uiFormPartialAddress', {
  templateUrl: 'modules/ui/form/partial/contact/address/template.html',
  controller: UIFormPartialAddressCtrl,
  bindings: {
    data: '=?'
  }
});

app.component('uiFormPartialAddressOneliner', {
  templateUrl: 'modules/ui/form/partial/contact/address/oneliner.template.html',
  controller: UIFormPartialAddressCtrl,
  bindings: {
    data: '=?'
  }
});