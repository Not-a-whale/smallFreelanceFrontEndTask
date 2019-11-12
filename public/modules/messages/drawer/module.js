class MessageDrawerCtrl {
  constructor(timeout) {
    this.timeout = timeout;
    this.searchcall = undefined;
    this.activetab = 1;
    this.messages = [{
        name: "Vlad Golova",
        time: "7:30 AM",
        date: "Today",
        msg: "Can you please try to get me home sometime this week. Thank you."
      }, {
        name: "Penter Rookanovich",
        time: "12:30 AM",
        date: "12/31/2018",
        msg: "Hey .. sergey I am not driving 9 hours today to make that appointment after sitting all day at a repair shop .. I am tired"
      }, {
        name: "Mark markovich",
        time: "9:24 AM",
        date: "05/08/2020",
        msg: "I am empty. lumper fee"
      },
      {
        name: "Vlad Golova",
        time: "7:30 AM",
        date: "Today",
        msg: "Yo, give me better loads please."
      },
      {
        name: "Beanter Nyguawa",
        time: "7:30 AM",
        date: "Today",
        msg: "I am empty. lumper fee"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:29 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:28 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:27 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:26 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:25 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:24 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:23 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:22 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:21 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:20 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:19 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:18 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:17 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:16 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:15 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:14 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:13 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:12 AM",
        date: "Today",
        msg: "hey"
      },
      {
        name: "Beanter Nyguawa",
        time: "7:11 AM",
        date: "Today",
        msg: "hey"
      }
    ];

    this.contacts = [{
        name: "vlad golov",
        description: "Owner-Op (#3265, 2453)",
        phone: "123-123-1234",
        avatar: "imgs/temp/richard.png"
      },
      {
        name: "vladi kalifornia",
        description: "Owner-Op (#3265, 2453)",
        phone: "555-123-1234",
        avatar: undefined
      },
      {
        name: "chovak novak",
        description: "Agent (Team Potato)",
        phone: "555-123-1234",
        avatar: "imgs/temp/richard.png"
      },
      {
        name: "vlada zhenaiya",
        description: "Dispatcher (Team 2)",
        phone: "800-383-3453",
        avatar: undefined
      },
      {
        name: "mark maxismovich",
        description: "Owner-Op (#7771, 1222)",
        phone: "123-998-1668",
        avatar: "imgs/temp/richard.png"
      },
      {
        name: "chiva saliva",
        description: "Owner-Op (#4538, 8888)",
        phone: "619-656-5654",
        avatar: "imgs/temp/angela.png"
      },
      {
        name: "chiva saliva",
        description: "Owner-Op (#4538, 8888)",
        phone: "619-656-5654",
        avatar: "imgs/temp/angela.png"
      },
      {
        name: "chiva saliva",
        description: "Owner-Op (#4538, 8888)",
        phone: "619-656-5654",
        avatar: "imgs/temp/angela.png"
      },
      {
        name: "chiva saliva",
        description: "Owner-Op (#4538, 8888)",
        phone: "619-656-5654",
        avatar: "imgs/temp/angela.png"
      },
      {
        name: "chiva saliva",
        description: "Owner-Op (#4538, 8888)",
        phone: "619-656-5654",
        avatar: "imgs/temp/angela.png"
      }
    ];

    this.displaycontacts = this.contacts;
  }

  SearchContacts(query) {
    query = query.toLowerCase();
    this.timeout.cancel(this.searchcall);
    var self = this;
    this.searchcall = this.timeout(function () {
      let fcontacts = [];

      for (let c of self.contacts) {
        let matches = false;

        matches |= c.name.toLowerCase().includes(query);
        matches |= c.description.toLowerCase().includes(query);
        matches |= c.phone.toLowerCase().includes(query);

        if (matches) {
          fcontacts.push(c);
        }
      }

      self.displaycontacts = fcontacts;
    }, 500);
  }

  Remove(index) {
    this.messages.splice(index, 1);
  }

  ActivateTab(num) {
    this.activetab = num;
  }

  Close() {
    if (this.onClose instanceof Function) {
      this.onClose();
    }
  }
}

app.component("messageDrawer", {
  controller: ['$timeout', MessageDrawerCtrl],
  templateUrl: "modules/messages/drawer/default.html",
  bindings: {
    onClose: '&'
  }
});