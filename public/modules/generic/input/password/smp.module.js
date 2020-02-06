class PasswordInputCtrl {
  constructor() {
  }
};

var password_input_bindings = {
  value: '=?', // this is the input but showValue is the one being changed
  label: '@?', // indicates to user what the field is for
  title: '@?', // mouseover hover, displays extra information
  errmsg: '<?', // error message to display
  required: '@?', // if the this input field is required
  pattern: '@?', // externally control the html pattern validation
  disabled: '@?', // if this input is disabled
  placeholder: '@?' // what do you want to display
};

app.controller('PasswordInputCtrl', PasswordInputCtrl);
app.component('passwordInput', {
  templateUrl: 'modules/generic/input/password/smp.template.html',
  controller: 'PasswordInputCtrl',
  bindings: password_input_bindings
});