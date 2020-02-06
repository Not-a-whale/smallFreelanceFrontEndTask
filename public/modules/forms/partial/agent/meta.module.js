class Agent {
  constructor(fn, ln, phone, email) {
    this.firstname = fn;
    this.lastname = ln;
    this.phone = phone;
    this.email = email;
  }

  AddAccount() {

    let tempusername = undefined;
    if (this.firstname !== undefined && this.lastname !== undefined){
      tempusername = this.firstname[0] + this.lastname;
    }
    this.account = new LoginAccount(this.email, tempusername);
  }
  RemoveAccount() {
    delete this.account;
  }
}

class LoginAccount {
  constructor(email, username, password) {
    this.email = email;
    this.username = username;
    this.password = password;
  };
}

class AgentFormCtrl {
  constructor() {}
  AddAgent() {
    if (this.gate.agents == undefined) {
      this.gate.agents = [];
    }
    this.gate.agents.push(new Agent());
  }

  RemoveAgent(agent) {
    if (agent < this.gate.agents.length) {
      this.gate.agents.splice(agent, 1);
    }
  }

  $onInit() {
    this.AddAgent();
  }
}

app.component("metaAgentForm", {
  templateUrl: "modules/forms/partial/agent/meta.template.html",
  controller: AgentFormCtrl,
  bindings: meta_bindings
});