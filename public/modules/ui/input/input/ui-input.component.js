/* place holder constructor for now*/
class UIInputCtrl {
  constructor($timeout) {
    this.timeout = $timeout;
    this.timeout_fun = undefined;
  }

  OnChange() {
    console.log('OnChange called');
    if (this.onChange instanceof Function) {

      let self = this;
      this.timeout.cancel(this.timeout_fun);
      this.timeout_fun = this.timeout(function () {
        console.log('onChange called');
        self.onChange({
          data: self.data
        });
      }, 300);
    }
  }
};

app.component('uiInput', {
  templateUrl: function ($element, $attrs) {
    let template = 'modules/ui/input/input/ui-input.template.html';
    if ('template' in $attrs) {
      template = 'modules/ui/input/input/ui-input.' + $attrs.template + '.template.html';
    }
    return template;
  },
  controller: UIInputCtrl,
  bindings: {
    data: '=?', // this is the input
    label: '@?', // indicates to user what the field is for
    title: '@?', // mouseover hover, displays extra information
    errmsg: '@?', // error message to display
    required: '@?', // if the this input field is required
    pattern: '@?', // externally control the html pattern validation
    disabled: '@?', // if this input is disabled
    onChange: '&?' // when input is changed, call this function
  }
});