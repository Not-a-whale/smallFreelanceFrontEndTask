class UIStatusLoadCtrl extends UIStatusCtrl {
  constructor() {
    super();
    this.status = 'delivered';

    this.possible = {
      'delivered': {
        class: 'delivered',
        icon: 'imgs/icons.svg#circle-checkmark'
      },
      'delayed': {
        class: 'delayed',
        icon: 'imgs/icons.svg#circle-exclamation'
      },
      'en route': {
        class: 'enroute',
        icon: 'imgs/icons.svg#circle-arrow-left'
      }
    };
  }
}

app.component('uiStatusLoad', {
  templateUrl: 'modules/ui/text/status/load/template.html',
  controller: UIStatusLoadCtrl,
  bindings: {
    status: '<?'
  }
});