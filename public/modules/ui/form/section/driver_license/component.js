class UIFormSectionDriverLicenseCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}

app.component('uiFormSectionDriverLicense', {
  templateUrl: 'modules/ui/form/section/driver_license/template.html',
  controller: UIFormSectionDriverLicenseCtrl,
  bindings: {
    data: '=?',
    section: '<?'
  }
});