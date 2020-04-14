class UIAccordionContainerTripStatusCtrl {
  constructor() {
    this.title = 'Trip Status';
  }
}

app.component('uiAccordionTripStatus', {
  templateUrl: 'modules/ui/container/accordion/tripstatus/template.html',
  controller: UIAccordionContainerTripStatusCtrl,
  bindings: {
    trips: '<?'
  }
});