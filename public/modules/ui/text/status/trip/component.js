class UIStatusTripCtrl extends UIStatusCtrl {
  constructor() {
    super();
    this.status = 'unavailable';

    this.possible = {
      'unavailable': {
        class: 'unavailable'
      },
      'en route': {
        class: 'enroute'
      },
      'available': {
        class: 'available'
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