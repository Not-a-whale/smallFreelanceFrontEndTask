class UITableSearchInputCtrl extends UIInputClearCtrl {
  constructor(scope, element, timeout) {
    super(scope, timeout);
    this.scope = scope;
    this.element = element;
    this.index = -1; //this must be bound otherwise autofocus will not work
    this.input = element.find('input')[0]; // for autofocus
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

app.controller('UITableSearchInputCtrl', ['$scope', '$element', '$timeout', UITableSearchInputCtrl]);

var ui_table_search_input_bindings = CloneObj(ui_input_clear_bindings);
ui_table_search_input_bindings['index'] = '<';

app.component('uiTableSearchInput', {
  templateUrl: 'modules/generic/table/transclude/search/input/template.html',
  controller: 'UITableSearchInputCtrl',
  bindings: ui_table_search_input_bindings
});