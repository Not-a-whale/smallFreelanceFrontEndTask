class ChatNotificationCtrl {
  constructor() {
    this.drawer = false;
  }

  DrawerToggle(){
    this.drawer = !this.drawer;
  }
  DrawerClose() {
    this.drawer = false;
  }
}

app.component("chatNotifications", {
  controller: ChatNotificationCtrl,
  templateUrl: "modules/navigation/top/chat/default.html"
});