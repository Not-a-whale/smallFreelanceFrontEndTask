class UIContainerAccordionOpenCtrl {
  constructor() {
    this.icon = "imgs/icons.svg#user";
  }
  ShowCount() {
    return this.count !== undefined;
  }

  ShowIcon() {
    return this.icon != undefined;
  }

  AddNew() {
    if (this.CanAddNew()) {
      this.onAddNew();
    }
  }

  CanAddNew() {
    return this.onAddNew instanceof Function || true;
  }

}

app.directive('uiContainerAccordionOpen', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/container/accordion/open.template.html',
    scope: true,
    controller: UIContainerAccordionOpenCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      title: '<',
      icon: '<?',
      open: '<?',
      count: '<?',
      onAddNew: '&?'
    },
    transclude: {
      bodyContent: '?bodyContent',
      rowHeader: '?rowHeader'
    }
  };
});