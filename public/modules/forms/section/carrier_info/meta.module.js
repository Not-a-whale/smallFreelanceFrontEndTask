class PermitAccount {
  constructor(state, accno) {
    this.state = state;
    this.account = accno;
  }
}

class CarrierInformationFormCtrl {
  AddPermit() {
    if (this.gate.permits == undefined){
      this.gate.permits = [];
    }
    this.gate.permits.push(new PermitAccount());

  }

  RemovePermit(permit) {
    if (permit < this.gate.permits.length) {
      this.gate.permits.splice(permit, 1);
    }

  }

  $onInit() {
    if (this.gate != undefined) {
      this.gate.permits = [];
      this.gate.permits.push(new PermitAccount());
    }
  }
}

app.component("metaCarrierInfoForm", {
  templateUrl: "modules/forms/section/carrier_info/meta.template.html",
  controller: CarrierInformationFormCtrl,
  bindings: meta_sectform_bindings
});