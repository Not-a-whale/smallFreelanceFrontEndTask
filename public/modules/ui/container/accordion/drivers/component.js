class UIAccordionContainerDriverCtrl {
  constructor() {
    this.title = 'Drivers';
    this.header = [{
      name: 'name',
      size: 'c4'
    }, {
      name: 'phone',
      size: 'c3'
    }, {
      name: 'status',
      size: 'c3'
    }, {
      name: 'holds',
      size: 'c2'
    }, ];
  }
}

app.component('uiAccordionDrivers', {
  templateUrl: 'modules/ui/container/accordion/drivers/template.html',
  controller: UIAccordionContainerDriverCtrl,
  bindings: {
    drivers: '<?'
  }
});