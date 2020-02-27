class UIBusinessDetailCtrl {
  constructor(){}

  HasVehicles(){
    return this.detail.vehicles != undefined;
  }

  HasHolds(){
    return this.detail.holds != undefined;
  }

  HasInsurances() {
    return this.detail.insurances != undefined;
  }

  HasDrivers() {
    return this.detail.drivers != undefined;
  }

  HasIFTA(){
    return this.detail.ifta != undefined;
  }
}

app.controller('UIBusinessDetailCtrl', UIBusinessDetailCtrl);