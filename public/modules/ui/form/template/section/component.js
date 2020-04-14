class UIFormSectionCtrl2 {
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

app.directive('uiFormSection2', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/form/template/section/template.html',
    scope: true,
    controller: UIFormSectionCtrl2,
    controllerAs: '$ctrl',
    bindToController: {
      section: '<?'
    },
    transclude: {
      formSectionContent: '?formSectionContent',
    }
  };
});