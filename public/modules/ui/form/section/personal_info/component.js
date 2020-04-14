class UIFormSectionPersonalInfoCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }

  $onChanges(values) {
    if (this.data != undefined) {
      //this.data.hr_residences = [{}];
      //this.data.hr_residences[0].DateMovedIn = '01/01/1999';
    }
  }
}

app.component('uiFormSectionPersonalInfo', {
  templateUrl: 'modules/ui/form/section/personal_info/template.html',
  controller: ['FormService', UIFormSectionPersonalInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});


app.component('uiFormSectionPersonalInfoSimple', {
  templateUrl: 'modules/ui/form/section/personal_info/simple.template.html',
  controller: ['FormService', UIFormSectionPersonalInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});