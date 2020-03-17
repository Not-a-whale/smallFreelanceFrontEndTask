class UISubformItem {
  static index = 0;
  constructor(data) {
    if (data != undefined) {
      this.data = data;
    } else {
      this.data = {};
    }

    this.active = false;
    this.index = UISubformItem.index++;
  }

  Copy() {
    let newobj = new UISubformItem(CloneObj(this.data));
    newobj.index = this.index;
    return newobj;
  }

  Equals(obj) {
    return this.index == obj.index;
  }

  isEmpty() {
    return angular.equals(this.data, {});
  }

  Toggle() {
    this.active = !this.active;
  }

  isActive() {
    return this.active;
  }

  Activate() {
    this.active = true;
  }

  Deactivate() {
    this.active = false;
  }
}