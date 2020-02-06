class ContactsCtrl {
  constructor(chatsrv) {
    this.initials = "";
    this.chatsrv = chatsrv;
  }

  Call() {
    console.log("Calling " + this.contact.phone);
  }

  Message() {
    console.log("Messaging " + this.contact.name);
    this.chatsrv.NewChatbox(this.contact.name);
  }

  HasAvatar() {
    let has = false;
    if ('avatar' in this.contact) {
      if (this.contact.avatar != undefined) {
        if (this.contact.avatar.length > 0) {
          has = true;
        }
      }
    }
    return has;
  }

  $onInit(){
    let names = this.contact.name.split(' ');
    this.initials = names[0].charAt(0);
    if (names.length > 1){
      this.initials += names[names.length - 1].charAt(0);
    }
    this.initials = this.initials.toUpperCase();
  }
}

app.component("contactBox", {
  controller: ['ChatSystemService', ContactsCtrl],
  templateUrl: "modules/messages/contacts/default.html",
  bindings: {
    contact: '<'
  }
});