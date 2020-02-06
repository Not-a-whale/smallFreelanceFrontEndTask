class LoadsCtrl {
  constructor(){
    this.colsize = ['c1', 'c1', 'c2','c1','c2','c2', 'c1', 'c1', 'c1']
    this.headers = ['pick up', 'pro #', 'customer/ref#', 'truck type', 'origin', 'destination', 'weight', 'miles', 'rate/mile'];
  }
}


app.component("loadsAvailable", {
  controller: LoadsCtrl,
  templateUrl: "modules/loads/available/default.html",
  bindings: {
    availLoadList: '<'
  }
});

app.component("loadsAvailableSelect", {
  templateUrl: "modules/loads/available/default_select.html"
});

app.component("loadsAvailableSearch", {
  templateUrl: "modules/loads/available/default_search.html"
});

app.component("loadsAvailableContent", {
  templateUrl: "modules/loads/available/default_content.html",
  bindings: {
    colsize: '<',
    item: '<'

  }
});