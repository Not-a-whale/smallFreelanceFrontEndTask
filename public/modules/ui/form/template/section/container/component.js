class UIFormSectionContainerCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv;
    this.sections = undefined;
  }

  $onInit() {
    this.sections = this.formsrv.CurrentSubform().forms;
  }

  Sections() {
    return this.sections;
  }

  EnabledSections() {
    if (this.sections != undefined) {
      return this.sections.filter(x => x.active);
    }

  }

  DisabledSections() {
    if (this.sections != undefined) {
      return this.sections.filter(x => !x.active);
    }
  }

  ScrollToSection(section) {
    if (this.toScroll instanceof Function) {
      this.toScroll({
        section: section
      });
    }
  }
}


app.component('uiFormSectionContainer', {
  templateUrl: 'modules/ui/form/template/section/container/template.html',
  controller: ['FormService', UIFormSectionContainerCtrl],
  bindings: {
    toScroll: '&?'
  }
});