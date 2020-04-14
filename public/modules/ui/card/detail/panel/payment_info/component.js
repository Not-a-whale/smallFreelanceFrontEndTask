class UIPanelDetailPaymentInfoCtrl {
  constructor() {
    this.title = 'payment information';
    this.fields = [{
      name: 'pay to',
      path: 'data'
    }, {
      name: 'pay terms',
      path: 'data'
    }, {
      name: 'pay method',
      path: 'data'
    }];
  }
}

app.component('uiPanelDetailPaymentInfo', {
  templateUrl: 'modules/ui/card/detail/panel/concrete.template.html',
  controller: UIPanelDetailPaymentInfoCtrl
});