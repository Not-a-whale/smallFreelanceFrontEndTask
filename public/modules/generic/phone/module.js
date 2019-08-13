class GenericPhoneCtrl extends GenericInputCtrl {
  constructor(getid) {
    super(getid);
    this.placeholder = '000-000-0000';
    this.pattern = "^(?:\\d{3}|\\(\\d{3}\\))?[\\s-]?\\d{3}[\\s-]?\\d{4}$";
    this.errmsg = "Not a valid phone format"
  }
}

app.component('genericPhone', {
  templateUrl: '/modules/generic/input/default.html',
  controller: ['getid', GenericPhoneCtrl],
  bindings: input_bindings
});