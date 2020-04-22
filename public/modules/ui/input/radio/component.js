class UIRadioCtrl {
  constructor(getid, apisrv) {
    this.id = getid();
    this.apisrv = apisrv;

    this.trueValue = 1;

    this.data = undefined;
    this.checked = this.falseVal;
    this.valid = true;
  }

  SetValue() {
    console.log(this.checked);
    console.log(this.trueValue);
    if (this.checked) {
      this.data = this.trueValue;
    }
  }

  isChecked() {
    if (this.data == this.trueValue) {
      this.checked = true;
    }
    return this.checked;
  }

  $onInit() {}
}

app.component('uiRadio', {
  templateUrl: 'modules/ui/input/radio/template.html',
  controller: ['getid', 'APIService', UIRadioCtrl],
  bindings: {
    data: '=?',
    label: '@?',
    errmsg: '@?',
    required: '@?',
    disabled: '@?',
    trueValue: '@?'
  }
});