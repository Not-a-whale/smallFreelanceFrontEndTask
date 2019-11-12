class NewFormCtrl {
  constructor(){
    this.expanded = false;
    this.options = [
      { label: 'load', state: ''},
      { label: 'trip', state: ''},
      { label: 'driver', state: ''},
      { label: 'equipment', state: ''},
      { label: 'carrier', state: ''},
      { label: 'business', state: ''},
      { label: 'user', state: ''},
      { label: 'employee', state: ''},
    ];
  }

  OpenMenu(){
    this.expanded = true;
  }

  CloseMenu() {
    this.expanded = false;
  }
}

app.component("newForm", {
  controller: NewFormCtrl,
  templateUrl: "modules/navigation/top/newform/default.html"
});