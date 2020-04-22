app.component('uiForm', {
  templateUrl: function ($element, $attrs) {
    let template = 'modules/forms/template.html';
    if ('type' in $attrs) {
      template = 'modules/forms/types/' + $attrs.type + '.template.html';
    }
    return template;
  },
  controllerAs: '$formctrl',
  bindings: {
    data: '=?',
    onSubmit: '&?',
    formid: '<'
  }

});