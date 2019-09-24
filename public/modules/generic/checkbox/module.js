class GenericCheckboxCtrl extends GenericInputCtrl {
  constructor(getid, scope) {
    super(getid, scope);

    this.onValue = true;
    this.offValue = false;
    this.checked = false;
  }

  Reset() {
    super.Reset();
    this.SetChecked();
  }

  Toggle() {
    this.checked = !this.checked;
    this.showValue = this.checked ? this.onValue : this.offValue;
  }

  SetChecked(val){
    if (val == undefined){
      this.checked = this.showValue == this.onValue;
    } else {
      this.checked = val == this.onValue;
    }
  }

  $onInit(){
    super.$onInit();
    this.SetChecked();
  }
};

var checkbox_bindings = {
  value: '<?',
  onValue: '<?', // custom "on" value
  offValue: '<?', // custom "off" value
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?',
  onUpdate: '&?',
};

app.component('genericCheckbox', {
  templateUrl: '/modules/generic/checkbox/default.html',
  controller: ['getid', '$scope', GenericCheckboxCtrl],
  bindings: checkbox_bindings
});