class UISubformListEmergencyContactCtrl {
  constructor() {
    this.header = [{
        size: 'c6',
        name: 'Name'
      },
      {
        size: 'c6',
        name: 'phone'
      },
      {
        size: 'c4',
        name: 'relationship'
      }
    ];
  }
}

app.component('uiSubformListEmergencyContact', {
  templateUrl: 'modules/ui/form/subforms/emergency_contact/subformlist.template.html',
  controller: UISubformListEmergencyContactCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});