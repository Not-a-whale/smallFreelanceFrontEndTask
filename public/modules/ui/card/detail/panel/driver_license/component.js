class UIPanelDetailDriverLicenseCtrl {
  constructor() {
    this.title = 'driver license';
    this.fields = [{
      name: 'number',
      path: 'data'
    }, {
      name: 'state',
      path: 'data'
    }, {
      name: 'class',
      path: 'data'
    }, {
      name: 'expiration',
      path: 'data'
    }, {
      name: 'certifications',
      path: 'data'
    }];
  }
}

app.component('uiPanelDetailDriverLicense', {
  templateUrl: 'modules/ui/card/detail/panel/concrete.template.html',
  controller: UIPanelDetailDriverLicenseCtrl,
  bindings: {
    data: '<?'
  }
});