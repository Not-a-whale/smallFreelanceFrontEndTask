class UICheckboxCtrl {
  constructor(getid, apisrv) {
    this.id = getid();
    this.apisrv = apisrv;

    this.trueVal = 1;
    this.falseVal = 0;
    this.default = this.falseVal;
    this.data = undefined;
    this.checked = undefined;
    this.valid = true;
  }

  SetValue() {
    if (this.checked) {
      this.data = this.trueVal;
    } else {
      this.data = this.falseVal;
    }
  }

  isChecked() {
    if (this.checked == undefined) {
      this.checked = this.default;
    }
    if (this.data == this.trueVal) {
      this.checked = true;
    }
    if (this.data == undefined) {
      this.data = this.falseVal;
      this.checked = false;
    }
    return this.checked;
  }

  $onInit() {
    this.isChecked();
  }
}

app.component('uiCheckbox', {
  templateUrl: 'modules/ui/input/checkbox/template.html',
  controller: ['getid', 'APIService', UICheckboxCtrl],
  bindings: {
    data: '=?',
    checked: '<?',
    label: '@?',
    errmsg: '@?',
    required: '@?',
    disabled: '<?',
    default: '<?',
    trueVal: '<?',
    falseVal: '<?'
  }
});