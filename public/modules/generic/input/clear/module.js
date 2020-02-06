class UIInputClearCtrl extends SimpleInputCtrl {
  constructor(timeout) {
    super();
    this.timeout = timeout;
    this.donetypecall = undefined;
    this.donetype_delay = 250; // in ms
  }

  CheckKeyPress(event) {
    let saved = this.value;
    this.timeout.cancel(this.donetypecall);
    if (event.key == 'Enter' || event.code == 'Enter') {
      this.value = undefined;
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
};

var ui_input_clear_bindings = CloneObj(smp_input_bindings);
ui_input_clear_bindings['onUpdate'] = '&?';
ui_input_clear_bindings['doneType'] = '&?';

app.controller('UIInputClearCtrl', ['$timeout', UIInputClearCtrl]);
app.component('uiInputClear', {
  templateUrl: 'modules/generic/input/clear/template.html',
  controller: 'UIInputClearCtrl',
  bindings: ui_input_clear_bindings
});