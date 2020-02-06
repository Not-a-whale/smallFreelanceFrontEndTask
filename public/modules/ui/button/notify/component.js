class UIButtonNotifyCtrl {
  constructor(){
    this.icon = "imgs/icons.svg#bell";
    this.notify = undefined;
  }
  hasNotification(){
    return this.notify != undefined;
  }
}

app.component('uiButtonNotify', {
  templateUrl: 'modules/ui/button/notify/template.html',
  controller: UIButtonNotifyCtrl,
  bindings: {
    icon: '<?',
    notify: '<?'
  }
});