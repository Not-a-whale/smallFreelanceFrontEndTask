class UIStatusLocationCtrl extends UIStatusCtrl {
  constructor() {
    super();
    this.status = 'delivered';

    this.possible = {
      'delivered': {
        class: 'delivered',
        icon: 'imgs/icons.svg#circle-checkmark',
        display: 'delivered!'
      },
      'delayed': {
        class: 'delayed',
        icon: 'imgs/icons.svg#circle-exclamation',
        display: 'delayed!'
      },
      'en route': {
        class: 'enroute',
        icon: 'imgs/icons.svg#circle-arrow-left',
        display: 'en route'
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