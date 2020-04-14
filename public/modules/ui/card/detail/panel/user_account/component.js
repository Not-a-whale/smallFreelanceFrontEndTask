class UIPanelDetailUserAccountCtrl {
  constructor() {
    this.title = 'user account';
    this.fields = [{
      name: 'username',
      path: 'data'
    }, {
      name: 'account',
      path: 'data'
    }];
  }
}

app.component('uiPanelDetailUserAccount', {
  templateUrl: 'modules/ui/card/detail/panel/concrete.template.html',
  controller: UIPanelDetailUserAccountCtrl,
  bindings: {
    data: '<?'
  }
});