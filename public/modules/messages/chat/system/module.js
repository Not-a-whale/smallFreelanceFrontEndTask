class ChatSystemCtrl {
  constructor(scope, chatsyssrv) {
    this.chatsys = chatsyssrv;
    this.scope = scope;
    this.activeChats = undefined;
  }

  GetActiveChats() {
    this.activeChats = this.chatsys.ActiveChats();
    //console.log("These are the chats inside of the chat system: ");
    //console.log(this.activeChats);
  }

  $onInit() {
    // both events just want to update the list of active chats.
    var self = this;
    this.chatsys.Subscribe(this.scope, 'new-chatbox', function () {
      self.GetActiveChats
    });
    this.chatsys.Subscribe(this.scope, 'close-chatbox', function () {
      self.GetActiveChats
    });
    this.GetActiveChats();
  }
}

app.component('chatSystem', {
  templateUrl: 'modules/messages/chat/system/template.html',
  controller: ['$scope', 'ChatSystemService', ChatSystemCtrl]
});

class ChatConversation {
  constructor(id, messages, contact) {
    this.id = id;
    this.from = 'me';
    this.to = contact; // for now its just a string of the persons name;
    this.messages = messages || [];
  }

  AddMessage(who, message) {
    this.messages.push(new ChatMessage(who, message));
  }

  OldestTimestamp() {
    //oldest timestamp should be at the end of the messages array
    let timestamp = 0;
    if (this.messages.length > 0) {
      timestamp = this.messages.slice(-1)[0].timestamp;
    }
    return timestamp;
  }
}

class ChatMessage {
  constructor(who, message) {
    this.text = message;
    this.who = who;
    this.timestamp = Date.now();
  }
}

class ChatSystemService {
  constructor(http, rootscope, getid) {
    this.getid = getid;
    this.http = http;
    this.rootscope = rootscope;
    this.MAX_CONVERSATIONS = 5;
    this.conversations = [];
    this.events = ['new-message-received', 'new-message-sent', 'new-chatbox', 'close-chatbox', 'focus-chatbox'];
  }

  Subscribe(scope, eventstr, callback) {
    if (this.events.includes(eventstr)) {
      let handler = this.rootscope.$on(eventstr, callback);
      scope.$on('$destroy', handler);
      return true;
    }
    return false;
  }

  ActiveChats() {
    return this.conversations;
  }

  RemoveOldestConversation() {
    let oldest_index = 0;
    let oldest_timestamp = this.conversations[oldest_index].OldestTimestamp();
    for (let index in this.conversations) {
      let cur_timestamp = this.conversations[index].OldestTimestamp();
      if (cur_timestamp < oldest_timestamp) {
        oldest_index = index;
        oldest_timestamp = cur_timestamp;
      }
    }
    // remove the potentially the oldest conversation
    this.conversations.splice(oldest_index, 1);
  }

  FindExistingConversation(contact) {
    let convo = undefined;
    for (let index in this.conversations) {
      if (this.conversations[index].to === contact) {
        console.log('found matching conversation ' + this.conversations[index].id);
        convo = this.conversations[index];
      }
    }
    return convo;
  }

  NewChatbox(contact) {
    console.log('Creating new chatbox with contact: ' + contact);
    let convo = this.FindExistingConversation(contact);
    if (convo !== undefined) {
      this.rootscope.$emit('focus-chatbox', {
        id: convo.id
      });
    } else {
      if (this.MAX_CONVERSATIONS <= this.conversations.length) {
        this.RemoveOldestConversation();
      }
      let newconvo = new ChatConversation(this.getid(), [], contact);
      this.conversations.unshift(newconvo);
      this.rootscope.$emit('new-chatbox');
    }
  }

  Close(conversation) {
    for (let index in this.conversations) {
      console.log(this.conversations[index].id);
      console.log(conversation.id);
      if (this.conversations[index].id == conversation.id) {
        this.conversations.splice(index, 1);
      }
    }
    this.rootscope.$emit('close-chatbox');

  }

  SendMessage(conversation, message) {
    // this is to send the message to whereever it needs to go
    // adds the message to the conversation object
    console.log('sending message!');
    conversation.AddMessage('me', message);
  }
}

app.service('ChatSystemService', ['$http', '$rootScope', 'getid', ChatSystemService]);


app.directive('outOfFocusClose', function($window){
  return {
    link: function (scope, element, attrs, controller){
      //console.log(scope);
      scope.open = 'potato';
      scope.$watch(function(){ return scope.open;}, function(value){
        //console.log('this is open: ' + scope.open);
      });
      scope.window = $window;
      scope.window.onclick = function(event, args){
        //console.log('clicked!');
        //TODO: make a directive that can be applied to anything when it opens it closes when the clicky happens outside of it.

      };
    }
  }
});