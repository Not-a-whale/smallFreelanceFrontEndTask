class UICardDetailSmallUnitCtrl {
  constructor() {}
  HasTruck() {
    return this.truck != undefined && this.truck != '';
  }
  HasTrailer() {
    return this.trailer != undefined && !angular.equals(this.trailer, {});
  }
  HasDriver() {
    let retval = false;
    if (this.driver != undefined) {
      if (typeof this.driver == 'array') {
        if (!angular.equals(this.driver, [])) {
          retval = true;
        }
      } else if (typeof this.driver == 'string') {
        if (this.driver != '') {
          retval = true;
        }
      }
    }
    return retval;
  }

  HasDispatcher() {
    return this.dispatcher != undefined && !angular.equals(this.dispatcher, {});
  }

  DisplayUnit() {
    return this.unit;
  }

  DisplayTruck() {
    return this.truck;
  }

  DisplayTrailer() {
    return this.trailer;
  }

  DisplayDrivers() {
    let display = 'no drivers listed';
    if (typeof this.driver == 'array') {
      display = this.driver.map(this.ConcatNames).join(',');
    } else if (typeof this.driver == 'string') {
      display = this.driver;
    }
    return display;
  }

  DisplayDispatcher() {
    let display = 'no dispatcher listed';
    if (typeof this.dispatcher == 'object') {
      display = this.ConcatNames(this.dispatcher);
    } else if (typeof this.dispatcher == 'string') {
      display = this.dispatcher;
    }
    return display;
  }

  ConcatNames(obj) {
    let retval = '';
    let names = [];
    if ('FirstName' in obj) {
      names.push(obj.FirstName);
    }
    if ('LastName' in obj) {
      names.push(obj.LastName);
    }
    retval.join(',', names);
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