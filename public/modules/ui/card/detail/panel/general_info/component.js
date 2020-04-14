class UIPanelDetailGeneralInfoCtrl {
  constructor(sample) {
    this.sample = sample;
  }
}

app.component('uiPanelDetailGeneralInfo', {
  templateUrl: 'modules/ui/card/detail/panel/general_info/template.html',
  controller: ['SampleData', UIPanelDetailGeneralInfoCtrl]
});