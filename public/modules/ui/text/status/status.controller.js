class UIStatusCtrl {
  constructor() {
    this.status = undefined; // current status
    // all possible statuses with their properties
    this.possible = {
      'status': {
        class: 'unavailable',
        icon: 'path_to_icon',
        display: 'text to display'
      },
    };

  }

  Class() {
    let retval = '';
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

  DisplayText() {
    let retval = 'unknown';
    if (this.status in this.possible) {
      let status = this.possible[this.status];
      if ('display' in status) {
        retval = status.display;
      }
    }
    return retval;
  }
}