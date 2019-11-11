class MessageBoxCtrl {
  constructor() {
    this.maxlength = 108;
    this.message = "";
    this.display = "";

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
  controller: MessageBoxCtrl,
  templateUrl: "modules/messages/messagebox/default.html",
  bindings: {
    message: '<',
    onRemove: '&'
  }
});