/* dummy controller */
class MetaFormSectionHeaderCtrl {
  constructor() {}
}

app.component('metaFormSectionHeader', {
  templateUrl: 'modules/generic/form/section/header/meta.template.html',
  controller: MetaFormSectionHeaderCtrl,
  bindings: {
    form: '<?',
    onDisable: '&?'
  }
});