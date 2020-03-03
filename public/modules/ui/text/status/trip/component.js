class UIStatusTripCtrl extends UIStatusCtrl {
  constructor() {
    super();
    this.status = 'unavailable';

    this.possible = {
      'unavailable': {
        class: 'unavailable',
        display: 'unavailable'
      },
      'en route': {
        class: 'enroute',
        display: 'en route'
      },
      'available': {
        class: 'available',
        display: 'available'
      }
    };
  }
}

app.component('uiStatusTrip', {
  templateUrl: 'modules/ui/text/status/trip/template.html',
  controller: UIStatusTripCtrl,
  bindings: {
    status: '<?'
  }
});