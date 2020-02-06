class NewFormCtrl {
  constructor(){
    this.expanded = false;
    this.options = [
      { label: 'load', state: ''},
      { label: 'trip', state: ''},
      { label: 'driver', state: ''},
      { label: 'equipment', state: ''},
      { label: 'carrier', state: 'tmsapp.main.hr.biz.carrier.form'},
      { label: 'business', state: ''},
      { label: 'user', state: ''},
      { label: 'employee', state: ''},
      { label: 'driver', state: 'tmsapp.main.hr.prsnl.ops.driver.form'},
    ];
  }

  OpenMenu(){
    this.expanded = true;
  }

  CloseMenu() {
    this.expanded = false;
  }

  Console(){
    console.log("hello");
  }
}

app.component("newForm", {
  controller: NewFormCtrl,
  templateUrl: "modules/navigation/top/newform/default.html"
});