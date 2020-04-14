class UIFormSectionDriverMedcardsCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}
app.component('uiFormSectionDriverMedcards', {
  templateUrl: 'modules/ui/form/section/driver_medcards/template.html',
  controller: UIFormSectionDriverMedcardsCtrl,
  bindings: {
    data: '=?',
    section: '<?'
  }
});