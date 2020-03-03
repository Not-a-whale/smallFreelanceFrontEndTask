class UIStatusCtrl {
  constructor() {
    // this.status = 'unavailable';
    // this.possible = {
    //   'unavailable': {
    //     class: 'unavailable'
    //   },
    //   'en route': {
    //     class: 'enroute'
    //   },
    //   'available': {
    //     class: 'available'
    //   }
    // };

  }

  Class() {
    let retval = '';
    console.log(this.possible);
    if (this.status in this.possible) {
      retval = this.possible[this.status].class;
    }
    return retval;
  }

  Icon() {
    let retval = '';
    if (this.status in this.possible) {
      retval = this.possible[this.status].icon;
    }
    return retval;
  }
}