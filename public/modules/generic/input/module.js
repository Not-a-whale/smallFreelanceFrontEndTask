class GenericInputCtrl {
  constructor(getid, scope) {
    this.id = getid();
    this.scope = scope;
    this.showValue = this.value; // this is redundant because $onChanges will fire
  }

  // make a copy of the new binding value
  // showValue will be the ng-model to be updated and displayed
  $onChanges(changes) {
    if ('value' in changes) {
      this.Reset();
    }
  }

  // to clear the field, the form has to be cleared
  // and bindings should take care of the rest
  // reset the input to the initial value int he form
  Reset() {
    this.showValue = this.value;
  }

  // update the form's value for this field
  Update() {
    if (this.showValue != this.value && this.onUpdate instanceof Function) {
      this.onUpdate({
        value: this.showValue
      });
    }
  }

  $onInit() {
    var self = this;
    //this.showValue = this.value;
    // the form needs to communicate with the inputs
    this.scope.$on("Reset", function (event, data) {
      self.Reset();
    });

    this.scope.$on("Update", function (event, data) {
      self.Update();
    });
  }

};

var input_bindings = {
  value: '<?', // this is the input but showValue is the one being changed
  label: '@?', // indicates to user what the field is for
  title: '@?', // mouseover hover, displays extra information
  type: '@?', // externally control the html type attr
  errmsg: '@?', // error message to display
  required: '@?', // if the this input field is required
  pattern: '@?', // externally control the html pattern validation
  disabled: '@?', // if this input is disabled
  placeholder: '@?', // what do you want to display
  onUpdate: '&?' // Update the external form value
};

app.component('genericInput', {
  templateUrl: '/modules/generic/input/default.html',
  controller: ['getid', '$scope', GenericInputCtrl],
  bindings: input_bindings
});