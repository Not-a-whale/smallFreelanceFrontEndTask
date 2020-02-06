class SimpleInputCtrl {
  constructor() {
    this.valid = true;
  }
};

var smp_input_bindings = {
  value: '=?', // this is the input but showValue is the one being changed
  label: '@?', // indicates to user what the field is for
  title: '@?', // mouseover hover, displays extra information
  type: '@?', // externally control the html type attr
  errmsg: '@?', // error message to display
  required: '@?', // if the this input field is required
  pattern: '@?', // externally control the html pattern validation
  disabled: '@?', // if this input is disabled
  placeholder: '@?', // what do you want to display
};

app.controller('SimpleInputCtrl', SimpleInputCtrl);
app.component('simpleInput', {
  templateUrl: 'modules/generic/input/simple/smp.template.html',
  controller: 'SimpleInputCtrl',
  bindings: smp_input_bindings
});
