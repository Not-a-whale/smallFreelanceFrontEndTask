class UISubformCardCoreCtrl {
  constructor() {}
  Select() {
    this.onSelect({
      item: this.item
    });
  }
}

app.controller('UISubformCardCore', UISubformCardCoreCtrl);