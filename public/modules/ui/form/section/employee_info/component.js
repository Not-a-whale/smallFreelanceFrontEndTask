class UIFormSectionEmployeeInfoCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv
  }
}

app.component('uiFormSectionEmployeeInfo', {
  templateUrl: 'modules/ui/form/section/employee_info/template.html',
  controller: ['FormService', UIFormSectionEmployeeInfoCtrl],
  bindings: {
    data: '=?',
    section: '<?'
  }
});