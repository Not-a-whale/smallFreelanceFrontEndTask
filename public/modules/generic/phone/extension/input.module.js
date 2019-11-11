app.component('inputPhoneExt', {
  templateUrl: 'modules/generic/phone/extension/input.template.html',
  controller: 'GenericPhoneInputCtrl',
  bindings: {
    value: '=?', //this is the input but showValue is the one being changed
    label: '@?',
    errmsg: '@?',
    required: '@?',
    disabled: '@?'
  }
});