class UIFormSectionResidencesCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}

app.component('uiFormSectionResidences', {
  templateUrl: 'modules/ui/form/section/residences/template.html',
  controller: UIFormSectionResidencesCtrl,
  bindings: {
    data: '=?', // must be an array
    section: '<?'
  }
});