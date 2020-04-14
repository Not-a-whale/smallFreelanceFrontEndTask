class UIContactCtrl {
  constructor(getid) {
    this.id = getid();
    this.expanded = false;
  }

  $onChanges(changes) {
    if (changes != undefined) {
      this.SetupStructure();
    }

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

  $onInit() {
    this.SetupStructure();
  }
}