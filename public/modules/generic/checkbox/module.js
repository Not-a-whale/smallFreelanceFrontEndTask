class GenericCheckboxCtrl extends GenericInputCtrl {
  constructor(getid, scope) {
    super(getid, scope);
    this.checked = false;
    this.onValue = 1;
    this.offValue = 0;
    this.autoupdate = false;
  }

  Reset() {
    super.Reset();
    this.SetChecked();
    this.SetShowValue();
  }

  Toggle() {
    if (!this.disabled) {
      this.checked = !this.checked;
    }
    this.SetShowValue();
    if (this.autoupdate){
      this.Update();
    }
  }


  Update() {
    if (this.onUpdate instanceof Function) {
      this.onUpdate({
        value: this.checked ? this.onValue : this.offValue
      });
    }
  }

  SetChecked(val) {
    if (val == undefined) {
      this.checked = (this.showValue == this.onValue);
    } else {
      this.checked = (val == this.onValue);
    }
  }

  SetShowValue() {
    this.showValue = this.checked ? this.onValue : this.offValue;
  }

  $onInit() {
    super.$onInit();
    this.SetChecked();
  }
};

var checkbox_bindings = {
  value: '<?',
  onValue: '<?', // custom "on" value
  offValue: '<?', // custom "off" value
  autoupdate: '<?',
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?',
  onUpdate: '&?',
};

app.controller('GenericCheckboxCtrl', ['getid', '$scope', GenericCheckboxCtrl]);

app.component('genericCheckbox', {
  templateUrl: 'modules/generic/checkbox/default.html',
  controller: 'GenericCheckboxCtrl',
  bindings: checkbox_bindings
});

app.component('ternaryCheckbox', {
  templateUrl: 'modules/generic/checkbox/ternary.html',
  controller: 'GenericCheckboxCtrl',
  bindings: checkbox_bindings
});