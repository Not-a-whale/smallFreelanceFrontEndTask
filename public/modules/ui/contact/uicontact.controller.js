class UIContactCtrl {
  constructor(getid) {
    this.id = getid();
    this.expanded = false;
  }

  Toggle() {
    this.expanded = !this.expanded;
  }
  ShowDetail() {
    return this.expanded;
  }

  Close() {
    this.expanded = false;
  }
}