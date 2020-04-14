class UISubformListAgentCtrl {
  constructor() {
    this.header = [{
        size: 'c4',
        name: 'name'
      },
      {
        size: 'c4',
        name: 'phone'
      },
      {
        size: 'c4',
        name: 'email'
      },
      {
        size: 'c4',
        name: 'primary'
      }
    ];
  }
}

app.component('uiSubformListAgent', {
  templateUrl: 'modules/ui/form/subforms/agent/subformlist.template.html',
  controller: UISubformListAgentCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});