class NotificationCtrl {
  constructor(timeout) {
    this.shake = false;
    this.timeout = timeout;
    this.shakecall = undefined;
  }

  Shake(){
    var self = this;
    this.shakecall = this.timeout( function() {
      self.shake = false;
    }, 1000);
    this.shake = true;
  }
}

app.component("notifications", {
  controller: ['$timeout', NotificationCtrl],
  templateUrl: "modules/navigation/top/notifications/default.html"
});