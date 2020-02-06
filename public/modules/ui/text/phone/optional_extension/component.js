class UIPhoneTextDisplayCtrl {
  constructor(){
    this.type = 'phone';
  }
}

app.component('uiPhoneExt', {
  templateUrl: 'modules/ui/text/phone/optional_extension/template.html',
  bindings: {
    phone: '<',
    type: '@?'
  }
});