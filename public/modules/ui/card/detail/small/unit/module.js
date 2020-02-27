class UICardDetailSmallUnitCtrl {
  constructor() {}
  HasTruck() {
    return this.truck != undefined && this.truck != '';
  }
  HasTrailer() {
    return this.trailer != undefined && !angular.equals(this.trailer, {});
  }
  HasDriver() {
    return this.driver != undefined && !angular.equals(this.driver, []);
  }
  HasDispatcher() {
    return this.dispatcher != undefined && !angular.equals(this.dispatcher, {});
  }

  DisplayUnit(){
    return this.unit;
  }

  DisplayTruck(){
    return this.truck;
  }

  DisplayTrailer(){
    return this.trailer;
  }

  DisplayDrivers() {
    return this.driver.map(this.ConcatNames).join(',');
  }

  DisplayDispatcher() {
    return this.ConcatNames(this.dispatcher);
  }

  ConcatNames(obj) {
    return obj.FirstName + ' ' + obj.LastName;
  }
}

app.component('uiCardDetailSmallUnit', {
  templateUrl: 'modules/ui/card/detail/small/unit/template.html',
  controller: UICardDetailSmallUnitCtrl,
  bindings: {
    unit: '<?',
    truck: '<?',
    trailer: '<?',
    driver: '<?',
    dispatcher: '<?',
    profileLink: '<?'
  }
});