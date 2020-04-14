class UIPanelDetailIFTAAccountCtrl {
  constructor() {
    this.title = "IFTA account";
    this.fields = [{
      name: 'state',
      path: 'california'
    }, {
      name: 'license',
      path: 'california'
    }, {
      name: 'MC account',
      path: 'california'
    }, ]
  }
}

app.component('uiPanelDetailIftaAccount', {
  templateUrl: 'modules/ui/card/detail/panel/concrete.template.html',
  controller: UIPanelDetailIFTAAccountCtrl
});