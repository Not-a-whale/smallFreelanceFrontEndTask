class UIFormSectionItemCtrl {
  constructor(formsrv) {
    // all control variables are inside of data
    this.formsrv = formsrv;
  }

  Toggle() {
    this.section.active = !this.section.active;
  }

  Enabled() {
    return this.section.active;
  }

  Optional() {
    return this.section.optional;
  }

  Title() {
    return this.section.title;
  }
}

app.component('uiFormSectionItem', {
  templateUrl: 'modules/ui/form/template/section/item/template.html',
  controller: ['FormService', UIFormSectionItemCtrl],
  bindings: {
    section: '<?'
  }
});