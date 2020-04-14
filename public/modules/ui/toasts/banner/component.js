class UIToastBannerCtrl {
  constructor(errsrv, timeout, element) {
    this.errsrv = errsrv;
    this.element = element;
    this.message = '';
    this.timeout = timeout;
    this.fade = 0;
  }

  Close() {
    if (this.CanClose()) {
      this.onClose();
    }
  }
  CanClose() {
    return this.onClose instanceof Function;
  }

  $onInit() {
    if (this.error instanceof ErrorObj && this.error != undefined) {
      this.message = this.errsrv.ReadError(this.error);
      let myclass = 'warn';
      switch (this.error.level) {
        case ErrorLevel.SUCCESS:
          myclass = 'success';
          break;
        default:
          myclass = 'warn';
      }
      console.log('adding class ' + myclass);
      this.element.addClass(myclass);
    }
    if (this.fade) {
      let self = this;
      this.timeout(function () {
        self.Close();
      }, this.fade * 1000);
    }

  }
}

app.component('uiToastBanner', {
  templateUrl: 'modules/ui/toasts/banner/template.html',
  controller: ['ErrorService', '$timeout', '$element', UIToastBannerCtrl],
  bindings: {
    fade: '<?', // how many seconds for it to stay up
    type: '@',
    error: '<',
    onClose: '&?'
  }
});