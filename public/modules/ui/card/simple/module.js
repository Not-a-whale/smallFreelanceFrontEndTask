class UICardSimpleCtrl {
  constructor() {}
}

app.directive('uiCardSimple', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/card/simple/template.html',
    scope: true,
    controller: UICardSimpleCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      title: '@'
    },
    transclude: {
      content: '?content'
    }
  };
});