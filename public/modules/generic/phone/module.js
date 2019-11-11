class GenericPhoneInputCtrl extends GenericInputCtrl {
  constructor(getid, scope) {
    super(getid, scope);
    this.pattern = "^(?:\\d{3}|\\(\\d{3}\\))?[\\s-]?\\d{3}[\\s-]?\\d{4}$";
    this.errmsg = "Not a valid phone format"
  }
}

class GenericPhoneCtrl {
  constructor(getid, phoneService){
    this.id = getid();
    this.phoneService = phoneService;
    this.number;
    this.extension;
  }

  Dial(){
    this.phoneService.Dial(undefined, this, undefined);
  }

  DisplayNumber() {
    return this.number + ' ext ' + this.extension;
  }
}

app.controller('GenericPhoneCtrl', ['getid', 'PhoneService', GenericPhoneCtrl]);

app.controller('GenericPhoneInputCtrl', ['getid', '$scope', GenericPhoneInputCtrl]);

app.component('genericPhone', {
  templateUrl: 'modules/generic/input/default.html',
  controller: 'GenericPhoneInputCtrl',
  bindings: {
    value: '<?', //this is the input but showValue is the one being changed
    label: '@?',
    type: '@?',
    errmsg: '@?',
    required: '@?',
    pattern: '@?',
    disabled: '@?',
    placeholder: '@?',
    onUpdate: '&?'
  }
});
