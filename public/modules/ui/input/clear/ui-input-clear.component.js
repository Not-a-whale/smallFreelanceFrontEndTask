class UIInputClearCtrl {
  constructor($scope, $timeout) {
    this.valid = true;
    this.scope = $scope;
    this.timeout = $timeout;
    this.donetypecall = undefined;
    this.donetype_delay = 250; // in ms
  }

  CheckKeyPress(event) {
    let saved = this.data;
    this.timeout.cancel(this.donetypecall);
    if (event.key == 'Enter' || event.code == 'Enter') {
      this.data = undefined;
      if (this.onUpdate instanceof Function) {
        this.onUpdate({
          value: saved
        });
      } else {
        console.error('UIInputClear onUpdate not bound');
      }
    } else {
      if (this.doneType instanceof Function) {
        let self = this;
        this.donetypecall = this.timeout(function () {
          self.doneType({
            value: saved
          });
        }, this.donetype_delay);
      } else {
        console.error('UIInputClearCtrl doneType not bound');
      }
    }
  }

  $onInit() {
    let self = this;
    this.scope.$on("InputClear", function (event, data) {
      self.data = undefined;
    });
  }
};

app.component('uiInputClear', {
  templateUrl: 'modules/ui/input/clear/ui-input-clear.template.html',
  controller: UIInputClearCtrl,
  bindings: {
    data: '=?', // this is the input
    label: '@?', // indicates to user what the field is for
    title: '@?', // mouseover hover, displays extra information
    type: '@?', // externally control the html type attr
    errmsg: '@?', // error message to display
    required: '@?', // if the this input field is required
    pattern: '@?', // externally control the html pattern validation
    disabled: '@?', // if this input is disabled
    onUpdate: '&?',
    doneType: '&?'
  }
});