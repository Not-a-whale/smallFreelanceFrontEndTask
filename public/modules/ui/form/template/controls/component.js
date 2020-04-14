class UIFormControlsCtrl {
  constructor(formsrv) {
    this.formsrv = formsrv;
  }
}

app.component('uiFormControls', {
  templateUrl: 'modules/ui/form/template/controls/template.html',
  controller: ['FormService', UIFormControlsCtrl]
});

app.component('uiFormControlsOptional', {
  templateUrl: 'modules/ui/form/template/controls/optional.template.html',
  controller: ['FormService', UIFormControlsCtrl]
});