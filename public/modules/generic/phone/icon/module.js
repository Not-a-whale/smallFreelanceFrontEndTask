app.component('phoneIcon', {
  controller: 'GenericPhoneCtrl',
  templateUrl: 'modules/generic/phone/icon/template.html',
  bindings: {
    number: '<',
    extension: '<'
  }
});
