class UISubformListDriverMedcardCtrl {
  constructor() {
    this.header = [{
        size: 'c4',
        name: 'thumbnail'
      },
      {
        size: 'c8',
        name: 'filename'
      },
      {
        size: 'c4',
        name: 'expiration date'
      }
    ];
  }
}

app.component('uiSubformListDriverMedcard', {
  templateUrl: 'modules/ui/form/subforms/driver_medcard/subformlist.template.html',
  controller: UISubformListDriverMedcardCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});