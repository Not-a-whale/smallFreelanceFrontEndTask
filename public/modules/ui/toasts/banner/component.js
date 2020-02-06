class UIToastBannerCtrl {
  constructor(errsrv, timeout) {

    this.errsrv = errsrv;
    this.message = '';

    this.timeout = timeout;
  }

  Close() {
    if (this.CanClose()) {
      this.onClose();
    }
  }
  CanClose(){
    return this.onClose instanceof Function;
  }

  $onInit() {
    if (this.error instanceof ErrorObj && this.error != undefined) {
      this.message = this.errsrv.ReadError(this.error);
    }
    if (this.fade) {
      let self = this;
      this.timeout(function () {
        self.Close();
      }, 2200);
    }

  }
}

app.component('uiToastBanner', {
  templateUrl: 'modules/ui/toasts/banner/template.html',
  controller: ['ErrorService', '$timeout', UIToastBannerCtrl],
  bindings: {
    fade: '@',
    type: '@',
    error: '<',
    onClose: '&?'
  }
});