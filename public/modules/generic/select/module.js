class GenericSelectCtrl extends GenericInputCtrl {
  constructor(getid, scope, http) {
    super(getid, scope);

    this.http = http;
    this.options = [];
    this.optionsname = 'list';
    this.valname = 'id';
    this.keyname = 'name';
    this.groupname = 'group';
    this.disablename = 'disabled';
  }

  Reset() {
    this.FindSelected(this.value);
  }

  Update() {
    if (this.showValue != this.value && this.onUpdate instanceof Function) {
      this.onUpdate({
        value: this.showValue,
        id: this.showValue[this.valname]
      });
    }
  }

  FindSelected(val) {
    if (val == undefined) {
      this.showValue = undefined;
      return;
    }
    var self = this;
    this.options.forEach((x) => {
      if (val == x[self.valname]) {
        self.showValue = x;
        return;
      }
    });
  }

  FetchOptions() {
    var self = this;
    if (this.url) {
      this.http.get(this.url).then(
        function (res) {
          if (!('DATA' in res.data)) {
            console.error("Malformed response for select " + self.id);
            return;
          }
          if (!(self.optionsname in res.data.DATA)) {
            console.error("Malformed response for select " + self.id +
              "\nNo " + self.optionsname + " in response");
            return;
          }
          // checks if data has supplied valname inside
          if (res.data.DATA[self.optionsname].length > 0) {
            if (!(self.valname in res.data.DATA[self.optionsname][0])) {
              console.error("Malformed response data for select " + self.id +
                "\nNo " + self.valname + " in repsonse data");
              return;
            }
            if (!(self.keyname in res.data.DATA[self.optionsname][0])) {
              console.error("Malformed response data for select " + self.id +
                "\nNo " + self.keyname + " in repsonse data");
              return;
            }
          }
          self.options = res.data.DATA[self.optionsname];
          if (self.default != undefined) {
            self.FindSelected(self.default);
          }

        },
        function (res) {
          console.error("Failed to fetch data for select " + self.id);
        });
    } else {
      if (this.options == undefined) {
        console.error("No url provided for select " + self.id);
      }
    }
  }

  $onInit() {
    super.$onInit();
    this.FetchOptions();
  }
}

var select_bindings = {
  value: '<?',
  options: '<?', // list of options to bind when needed
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?',
  url: '@?',
  optionsname: '@?', // the attribute/key to use to grab the list of options from response
  keyname: '@?', // the attribute/key to use to display the options in the select
  valname: '@?', // the attribute/key to use to select the option
  disablename: '@?', // the attribute/key to use to determine if option is disabled
  groupname: '@?', // the attribute/key to use to group options
  onUpdate: '&?'
};



app.component('genericSelect', {
  templateUrl: '/modules/generic/select/default.html',
  controller: ['getid', '$scope', '$http', GenericSelectCtrl],
  bindings: select_bindings
});