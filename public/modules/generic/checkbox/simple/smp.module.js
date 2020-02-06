class SimpleCheckboxCtrl extends SimpleInputCtrl {
  constructor() {
    super();
    this.checked = false;
    this.onValue = true;
    this.offValue = false;
  }

  Toggle() {
    if (!this.disabled) {
      this.checked = !this.checked;
    }
    this.SetValue();
  }

  SetChecked(val) {
    if (val == undefined) {
      this.checked = (this.value == this.onValue);
    } else {
      this.checked = (val == this.onValue);
    }
  }

  SetValue() {
    this.value = this.checked ? this.onValue : this.offValue;
  }

  $onInit() {
    this.SetChecked();
  }
};

var smp_checkbox_bindings = {
  value: '=?',
  onValue: '<?', // custom "on" value
  offValue: '<?', // custom "off" value
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?'
};

app.controller('SimpleCheckboxCtrl', ['getid', '$scope', SimpleCheckboxCtrl]);

app.component('simpleCheckbox', {
  templateUrl: 'modules/generic/checkbox/simple/smp.template.html',
  controller: 'SimpleCheckboxCtrl',
  bindings: smp_checkbox_bindings
});

app.component('simpleTernaryCheckbox', {
  templateUrl: 'modules/generic/checkbox/simple/smp.ternary.html',
  controller: 'SimpleCheckboxCtrl',
  bindings: smp_checkbox_bindings
});