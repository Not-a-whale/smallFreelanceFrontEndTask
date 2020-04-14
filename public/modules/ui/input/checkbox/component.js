class UICheckboxCtrl {
  constructor(getid, apisrv) {
    this.id = getid();
    this.apisrv = apisrv;

    this.trueVal = 1;
    this.falseVal = 0;

    this.value = undefined;
    this.checked = this.falseVal;
    this.valid = true;
  }

  SetValue() {
    if (this.checked) {
      this.value = this.trueVal;
    } else {
      this.value = this.falseVal;
    }
  }

  isChecked() {
    if (this.value == this.trueVal) {
      this.checked = true;
    }
    if (this.value == undefined) {
      this.value = this.falseVal;
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
    value: '=?',
    checked: '<?',
    label: '@?',
    errmsg: '@?',
    required: '@?',
    disabled: '<?'
  }
});