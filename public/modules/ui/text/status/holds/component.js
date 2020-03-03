class UIStatusHoldsCtrl extends UIStatusCtrl {
  constructor() {
    super();
    this.status = 'wip';

    this.possible = {
      'wip': {
        class: 'wip',
        icon: 'imgs/icons.svg#hourglass'
      },
      'unresolved': {
        class: 'unresolved',
        icon: 'imgs/icons.svg#circle-exclamation'
      }
    };
  }
}

app.component('uiStatusHolds', {
  templateUrl: 'modules/ui/text/status/holds/template.html',
  controller: UIStatusHoldsCtrl,
  bindings: {
    status: '<?'
  }
});