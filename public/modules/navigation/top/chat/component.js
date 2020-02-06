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

app.component("notifyChatIcon", {
  controller: ChatNotificationCtrl,
  templateUrl: "modules/navigation/top/chat/template.html"
});