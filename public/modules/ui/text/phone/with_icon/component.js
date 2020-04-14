app.component('uiPhoneWithIcon', {
  templateUrl: 'modules/ui/text/phone/with_icon/template.html',
  controller: UIPhoneTextDisplayCtrl,
  bindings: {
    phone: '<'
  }
});

app.component('uiFaxWithIcon', {
  templateUrl: 'modules/ui/text/phone/with_icon/fax.template.html',
  controller: UIPhoneTextDisplayCtrl,
  bindings: {
    fax: '<'
  }
});