class UICardSimpleButtonCtrl {
  constructor() {}
}

app.directive('uiCardSimpleButton', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/card/simple/button/template.html',
    scope: true,
    controller: UICardSimpleButtonCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      title: '@',
      goto: '&?',
      label: '@'
    },
    transclude: {
      content: '?content'
    }
  };
});