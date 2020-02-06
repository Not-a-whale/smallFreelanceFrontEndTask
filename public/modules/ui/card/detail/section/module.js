class UICardDetailSectionCtrl {
  constructor() {}
}

app.directive('uiCardDetailSection', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/card/detail/section/template.html',
    scope: true,
    controller: UICardDetailSectionCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      title: '@',
    },
    transclude: {
      content: '?content'
    }
  };
});