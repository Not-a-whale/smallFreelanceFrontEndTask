class UISubformListResidenceCtrl {
  constructor() {
    this.header = [{
        size: 'c8',
        name: 'address'
      },
      {
        size: 'c4',
        name: 'house phone'
      },
      {
        size: 'c4',
        name: 'date'
      }
    ];
  }
}

app.component('uiSubformListResidence', {
  templateUrl: 'modules/ui/form/subforms/residence/subformlist.template.html',
  controller: UISubformListResidenceCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});