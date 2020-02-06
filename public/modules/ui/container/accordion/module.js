class UIContainerAccordionCtrl {
  constructor() {}
  ShowCount(){
    return this.count !== undefined;
  }
}

app.directive('uiContainerAccordion', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/container/accordion/template.html',
    scope: true,
    controller: UIContainerAccordionCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      title: '<',
      open: '<?',
      count: '<?'
    },
    transclude: {
      content: '?content'
    }
  };
});