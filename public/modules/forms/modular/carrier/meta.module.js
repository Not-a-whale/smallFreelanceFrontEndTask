class MetaCarrierFormCtrl extends MetaModularFormCtrl {
  constructor(scope, element, compile, formservice, apiservice) {
    super(scope, element, compile, formservice);
    this.apiservice = apiservice;
  }

  SubmitForm() {
    return this.apiservice.SubmitForm(this.gate);
  }
}

app.component('metaNewCarrierForm', {
  templateUrl: 'modules/forms/modular/carrier/meta.template.html',
  controller: ['$scope', '$element', '$compile', 'MetaFormService', 'CarrierFormService', MetaCarrierFormCtrl],
  bindings: meta_modular_form_bindings
});