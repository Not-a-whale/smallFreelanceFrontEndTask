app.directive('uiFormMediator', function () {
  return {
    templateUrl: 'modules/forms/mediator/mediator.template.html',
    transclude: {
      subform: 'subform',
      list: 'list'
    }
  };
});