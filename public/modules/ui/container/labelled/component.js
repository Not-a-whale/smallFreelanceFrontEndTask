class UIContainerLabelledCtrl {
  constructor() {}
}

app.directive('uiContainerLabelled', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/container/labelled/template.html',
    scope: true,
    controller: UIContainerLabelledCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      label: '@',
    },
    transclude: true
  };
});