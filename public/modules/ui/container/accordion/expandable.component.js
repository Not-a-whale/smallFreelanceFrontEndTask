class UIContainerAccordionCtrl {
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

app.directive('uiContainerAccordion', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/container/accordion/expandable.template.html',
    scope: true,
    controller: UIContainerAccordionCtrl,
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