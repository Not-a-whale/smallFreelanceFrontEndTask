class UIAccordionCardTripStatusCtrl {
  constructor(trackensure) {
    this.trackensure = trackensure;
    this.loads = [{ number: '1234', status: 'delivered'},{number: '543453', status: 'delayed'},{number: '87812', status: 'en route'}];
  }

  TruckLocation(truck) {
    if (truck != undefined) {
      let data = this.trackensure.TruckInfo(truck);
      return 'www.google.com/search?q=' + data.lat + '%2C+' + data.lng;
    }
    return 'no connection';
  }
}

app.component('tripStatusCard', {
  templateUrl: 'modules/ui/card/accordion/tripstatus/template.html',
  controller: ['TrackEnsure', UIAccordionCardTripStatusCtrl],
  bindings: {
    data: '<?'
  }
});