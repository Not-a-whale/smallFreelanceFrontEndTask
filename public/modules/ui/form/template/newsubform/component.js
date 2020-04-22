app.directive('uiSubformMediator', function () {
  return {
    templateUrl: 'modules/ui/form/template/newsubform/mediator.template.html',
    transclude: {
      subform: 'subform',
      list: 'list'
    }
  };
});