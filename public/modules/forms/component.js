class UIFormCtrl {
  constructor($scope) {
    this.scope = $scope;
  }
}

app.component('uiForm', {
  templateUrl: function ($element, $attrs) {
    let template = 'modules/forms/template.html';
    if ('type' in $attrs) {
      template = 'modules/forms/types/' + $attrs.type + '.template.html';
    }
    return template;
  },
  controller: UIFormCtrl,
  controllerAs: '$formctrl',
  bindings: {
    data: '=?',
  }

});