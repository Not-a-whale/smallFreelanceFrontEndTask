class UIFormSectionCtrl {
  constructor() {

  }
  Show() {
    if (this.section != undefined) {
      return this.section.active;
    }
    return true;
  }

  Toggle() {
    if (this.section != undefined) {
      this.section.active = !this.section.active;
    }
  }
}

app.directive('uiFormSection', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/form/template/section/template.html',
    scope: true,
    controller: UIFormSectionCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      section: '<?'
    },
    transclude: {
      formSectionContent: '?formSectionContent',
    }
  };
});