class GenericInputCtrl {
  constructor(getid, scope) {
    this.id = getid();
    this.scope = scope;
    this.showValue = this.value; // this is redundant because $onChanges will fire
    this.valid = true;
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
    if (this.onUpdate instanceof Function) {
      this.onUpdate({
        value: this.showValue
      });
    }
  }

  AutoUpdate() {
    if (this.autoUpdate) {
      this.Update();
    }
  }

  $onInit() {
    var self = this;
    //this.showValue = this.value;
    // the form needs to communicate with the inputs


    // Potential issue for memory leak
    this.scope.$on("Reset", function (event, data) {
      self.Reset();
    });

    // Potential issue for memory leak
    this.scope.$on("Update", function (event, data) {
      self.Update();
    });
  }
};


class GenericTableSearchInput extends GenericInputCtrl {
  constructor(getid, scope, element) {
    super(getid, scope);
    this.element = element;
    this.index = -1;
    this.input = element.find('input')[0];
    this.autoUpdate = 1;
  }

  Focus(index) {
    if (this.index == index) {
      this.input.focus();
    }
  }

  $onInit() {
    super.$onInit();
    var self = this;
    this.scope.$on("SearchFocus", function (event, data) {
      self.Focus(data.index);
    });
  }
}

var input_bindings = {
  value: '<?', // this is the input but showValue is the one being changed
  autoUpdate: '<?', // this allows you to auto update the value as you type/select
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


var search_input_bindings = JSON.parse(JSON.stringify(input_bindings));
search_input_bindings.index = '<?';

app.controller('GenericInputCtrl', ['getid', '$scope', GenericInputCtrl]);

app.component('boundInput', {
  templateUrl: 'modules/generic/input/default.html',
  bindings: {
    value: '=', // this is the input but showValue is the one being changed
    label: '@?', // indicates to user what the field is for
    title: '@?', // mouseover hover, displays extra information
    type: '@?', // externally control the html type attr
    errmsg: '@?', // error message to display
    required: '@?', // if the this input field is required
    pattern: '@?', // externally control the html pattern validation
    disabled: '@?', // if this input is disabled
    placeholder: '@?', // what do you want to display
  }
});

app.component('genericInput', {
  templateUrl: 'modules/generic/input/default.html',
  controller: 'GenericInputCtrl',
  bindings: input_bindings
});

app.component('genericTableSearchInput', {
  templateUrl: 'modules/generic/input/search.html',
  controller: ['getid', '$scope', '$element', GenericTableSearchInput],
  bindings: search_input_bindings
});