class ChatBoxUICtrl {
  constructor(scope, chatsrv, element) {
    this.scope = scope;
    this.chatsrv = chatsrv;
    this.element = element;
    this.minimized = false;
    this.newmessage = '';
    this.re_emptymessage = /^\s*$/;
  }

  // ScrollToBottom(){
  //   console.log(this.element);
  //   let body = angular.element(this.element[0].getElementsByClassName('body')[0])[0];
  //   body.scrollTop = body.scrollHeight + 400;
  //   console.log(body.scrollTop);
  // }

  // ScrollToTop(){
  // }

  FindInput(){
    let input = undefined;
    if (this.element[0] !== undefined){
      input = this.element[0].getElementsByClassName('typefield');
      if(input !== undefined){
        this.input = input[0];
        return true;
      }
    }
    console.error('Failed to find input field inside of chatbox');
    return false;

  }

  FocusInput(){
    if (this.input !== undefined){
      this.input.focus();
    }
  }

  CheckKey(event) {
    if (event.key === "Enter") {
      if (event.shiftKey === false) {
        this.SendMessage();
      }
    }
  }

  Minimize() {
    this.minimized = true;
  }

  Expand() {
    this.minimized = false;
  }

  IsMinimized() {
    return this.minimized === true;
  }

  IsExpanded() {
    return this.minimized === false;
  }

  Toggle() {
    this.minimized = !this.minimized;
  }

  MessageIsEmpty(){
    return this.newmessage.search(this.re_emptymessage) != -1;
  }

  SendMessage() {
    if (!this.MessageIsEmpty()){
      this.chatsrv.SendMessage(this.msgData, this.newmessage);
    }
    this.newmessage = '';
    // this.ScrollToBottom();
  }

  Close() {
    console.log("Closing " + this.msgData.id);
    this.chatsrv.Close(this.msgData);
  }

  $onInit() {
    this.FindInput();
    this.FocusInput();

    let self = this;
    this.chatsrv.Subscribe(this.scope, 'focus-chatbox', function(event, args){
      if (self.msgData.id === args.id){
        self.FocusInput();
      }
    });
  }
}

app.component("chatBox", {
  templateUrl: "modules/messages/chat/box/default.html",
  controller: ['$scope', 'ChatSystemService', '$element', ChatBoxUICtrl],
  bindings: {
    onClose: '&',
    onSend: '&',
    msgData: '<?'
  }
});

app.directive('scrollBottom', function () {
  return {
    scope: {
      scrollBottom: "="
    },
    link: function (scope, element) {
      element.scrollTop(element[0].scrollHeight);
      scope.$watchCollection('scrollBottom', function (newval) {
        if (newval) {
          element.scrollTop(element[0].scrollHeight + 10000);
        }
      });
    }
  }
});