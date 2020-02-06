class MessageBoxCtrl {
  constructor(chatsrv) {
    this.chatsrv = chatsrv;
    this.maxlength = 108;
    this.message = "";
    this.display = "";
  }

  OpenChatbox(){
    this.chatsrv.NewChatbox(this.message.name);
  }


  DisplayMessage() {
    let msg = this.message.msg.slice(0, this.maxlength);
    if (this.message.msg.length > this.maxlength) {
      msg += '...';
    }

    return msg;
  }

  Remove(){
    if (this.onRemove instanceof Function){
      this.onRemove();
    }
  }

  $onInit() {
    this.display = this.DisplayMessage();
  }
}

app.component("messageBox", {
  controller: ['ChatSystemService', MessageBoxCtrl],
  templateUrl: "modules/messages/messagebox/default.html",
  bindings: {
    message: '<',
    onRemove: '&'
  }
});