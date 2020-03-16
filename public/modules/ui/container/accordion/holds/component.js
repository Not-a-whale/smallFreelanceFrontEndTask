class UIAccordionContainerHoldsCtrl {
  constructor() {
    this.title = 'Expirations and Holds';
  }
}

app.component('uiAccordionHolds', {
  templateUrl: 'modules/ui/container/accordion/holds/template.html',
  controller: UIAccordionContainerHoldsCtrl,
  bindings: {
    holds: '<?'
  }
});