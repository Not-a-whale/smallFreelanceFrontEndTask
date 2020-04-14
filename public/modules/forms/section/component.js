class UIFormSectionCtrl {
  constructor(getid) {
    this.formid = getid();
    this.dependency = undefined;
    this.adjustment_functions = [];
  }
  AdjustData() {

  }

  CheckDependency() {
    if (this.dependency != undefined && Array.isArray(this.dependency)) {
      for (let dep of this.dependency) {
        console.log(dep); // this is probably going to be form section forms
      }
    }
  }

  Submit() {
    //check dependencies
    this.CheckDependency();
    //apply correct data (maybe need to move id from dependency to this data)
    this.AdjustData();
  }
}

app.component('uiFormSection', {
  templateUrl: function ($element, $attrs) {
    let template = undefined;
    if ('type' in $attrs) {
      template = 'modules/forms/section/' + $attrs.type + '.section.template.html';
    }
    return template;
  },
  controller: UIFormSectionCtrl,
  bindings: {
    data: '=?',
    section: '=?',
    dependency: '=?',
    endpoint: '=?',
  }
});

app.directive('uiFormSectionTemplate', function () {
  return {
    scope: true,
    restrict: 'E',
    templateUrl: 'modules/forms/section/template.template.html',
    transclude: {
      'section-content': '?sectionContent'
    },
    bindToController: {
      section: '='
    },
    controller: function () {},
    controllerAs: '$ctrl'
  };
});