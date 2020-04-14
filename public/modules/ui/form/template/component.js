class UIFormTemplateCtrl {
  constructor(formsrv, scope, element, compile) {
    this.formsrv = formsrv;
    this.sections = formsrv.CurrentSubform().forms;
    this.scrollContainer = angular.element(document.getElementById('formPage'));
    this.scope = scope;
    this.element = element;
    this.compile = compile;
    this.currSection = undefined;
    this.prevSection = undefined;
    this.nextSection = undefined;
    this.compiledForms = [];
  }

  EnabledSections() {
    return this.sections.filter(x => x.active);
  }
  DisabledSections() {
    return this.sections.filter(x => !x.active);
  }

  Submit() {
    let self = this;
    this.formsrv.Submit().then(function (data) {
      self.formdata = data;
    });
  }

  Clear() {
    this.scope.$broadcast('form-clear');
    this.formdata = this.formsrv.ClearCurrentFormData();
  }

  ScrollToSection(section) {
    this.ScrollTo(section);
  }

  ScrollTo(section) {
    let scrolltime = 500;
    let anchor = angular.element(document.getElementById(section.title));
    if (anchor != undefined) {
      let offset = 0;
      this.scrollContainer.scrollTo(anchor, offset, scrolltime);
    }
  }

  CompileForms() {
    let self = this;
    let currentform = this.formsrv.CurrentSubform();
    let formroot = angular.element(document.getElementById('formPage'));
    let index = 0;
    for (let form of currentform.forms) {
      let comp = form.component;

      let cstr = '<' + comp;
      cstr += ' ng-show="$ctrl.sections[' + index + '].active"';
      let entrypoint = ['$ctrl', 'formdata', form.entrypoint].filter(x => x != undefined && x != '').join('.');
      cstr += ' data="' + entrypoint + '"';
      cstr += ' section="$ctrl.sections[' + index + ']"';

      cstr += '></' + comp + '>';
      //cstr += '<div>data: {{ ' + entrypoint + '}}</div>'; // shows current data in the sectional form
      let newscope = this.scope.$new();
      let newelement = this.compile(cstr)(newscope);

      formroot.append(newelement);
      index++;
    }
  }

  GetFormData() {
    this.formdata = this.formsrv.CurrentFormData();
  }

  $onInit() {
    this.CompileForms();
  }

  $onDestroy() {
    if (this.compiledForms !== undefined) {
      this.compiledForms.forEach(x => x.remove());
    }
  }
}

app.directive('uiFormTemp', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/form/template/template.html',
    scope: true,
    controller: ['FormService', '$scope', '$element', '$compile', UIFormTemplateCtrl],
    controllerAs: '$ctrl',
    transclude: {
      bodyContent: '?bodyContent'
    },
    bindToController: {
      formdata: '=?'
    }
  };
});