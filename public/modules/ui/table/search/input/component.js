class UITableSearchInputCtrl extends UIInputClearCtrl {
  constructor($scope, $element, $timeout) {
    super($scope, $timeout);
    this.scope = $scope;
    this.element = $element;
    this.index = -1; //this must be bound otherwise autofocus will not work
    this.input = undefined;
  }

  Focus(index) {
    if (this.index == index) {
      this.input.focus();
    }
  }

  $onInit() {
    this.input = this.element.find('input')[0]; // for autofocus
    super.$onInit();
    var self = this;
    this.scope.$on("SearchFocus", function (event, data) {
      self.Focus(data.index);
    });
  }
}

app.component('uiTableSearchInput', {
  templateUrl: 'modules/ui/table/search/input/template.html',
  controller: UITableSearchInputCtrl,
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
    doneType: '&?',
    index: '<'
  }
});