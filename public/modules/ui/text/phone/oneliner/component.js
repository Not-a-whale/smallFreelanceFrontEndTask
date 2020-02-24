app.component('uiPhoneOneliner', {
  templateUrl: 'modules/ui/text/phone/oneliner/template.html',
  controller: UIPhoneTextDisplayCtrl,
  bindings: {
    phone: '<',
    type: '@?'
  }
});