class UISubformListDriverLicenseCtrl {
  constructor() {
    this.header = [{
        size: 'c4',
        name: 'thumbnail'
      },
      {
        size: 'c4',
        name: 'DL Number'
      },
      {
        size: 'c4',
        name: 'State'
      },
      {
        size: 'c4',
        name: 'Endorsement'
      },
      {
        size: 'c4',
        name: 'Date Exp.'
      }
    ];
  }
}

app.component('uiSubformListDriverLicense', {
  templateUrl: 'modules/ui/form/subforms/driver_license/subformlist.template.html',
  controller: UISubformListDriverLicenseCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});