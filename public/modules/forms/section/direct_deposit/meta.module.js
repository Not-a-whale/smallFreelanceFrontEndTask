class BankDeposit{
  constructor() {
    this.amount = undefined;
    this.type = 'percent';
  }
}

class BankAccount {
  constructor() {
    this.routing = undefined;
    this.number = undefined;
    this.type = undefined;
  }
}

class Bank {
  constructor() {
    this.name = undefined;
    this.nickname = undefined;
    this.account = new BankAccount();
    this.deposit = new BankDeposit();
  }
}

class DirectDepositFormCtrl {
  constructor() {}

  AddBank() {
    if (this.gate !== undefined) {
      if (this.gate.banks == undefined) {
        this.gate.banks = [];
      }
      this.gate.banks.push(new Bank());
    }
  }

  RemoveBank(bank) {
    if (this.gate !== undefined){
      if (bank < this.gate.banks.length){
        this.gate.banks.splice(bank, 1);
      }
    }
  }

  $onInit(){
    this.AddBank();
  }
}

app.component("metaDirectDepositForm", {
  templateUrl: "modules/forms/section/direct_deposit/meta.template.html",
  controller: DirectDepositFormCtrl,
  bindings: meta_sectform_bindings
});