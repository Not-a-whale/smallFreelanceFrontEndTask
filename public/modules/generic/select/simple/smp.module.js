class SimpleSelectCtrl extends SimpleInputCtrl {
  constructor() {
    super();
    this.options = [];
    this.valname = 'val';
    this.keyname = 'key';
    this.groupname = 'group';
    this.disablename = 'disabled';
  }

  Validate(value){
    return true;
  }

  FindSelected(val) {
    if (val == undefined) {
      this.showValue = undefined;
      return;
    }
    var self = this;
    for (let option of this.options){
      if (val == option[self.valname]) {
        self.showValue = option;
        return;
      }
    }
  }

  SetDefault(){
    if (this.default != undefined) {
      this.FindSelected(this.default);
    }
  }

  $onInit() {
    //this.SetDefault();
  }
}

var smp_select_bindings = {
  value: '=?',
  options: '<?', // list of options to bind when needed
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?',
  keyname: '@?', // the attribute/key to use to display the options in the select
  valname: '@?', // the attribute/key to use to select the option
  disablename: '@?', // the attribute/key to use to determine if option is disabled
  groupname: '@?', // the attribute/key to use to group options
  onUpdate: '&?'
};

app.component('simpleSelect', {
  templateUrl: 'modules/generic/select/simple/smp.template.html',
  controller: SimpleSelectCtrl,
  bindings: smp_select_bindings
});