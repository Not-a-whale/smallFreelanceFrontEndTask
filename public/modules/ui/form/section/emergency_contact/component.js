class UIFormSectionEmergencyContactCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}
app.component('uiFormSectionEmergencyContact', {
  templateUrl: 'modules/ui/form/section/emergency_contact/template.html',
  controller: UIFormSectionEmergencyContactCtrl,
  bindings: {
    data: '=?',
    section: '<?'
  }
});