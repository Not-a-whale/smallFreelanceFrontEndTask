/* dummy controller that just maps values properly */
class MetaTableSearchBarCtrl extends MetaGateCtrl {
  constructor() {
    super();
  }

  $onInit() {
    super.$onInit();
    var self = this;
    // setup the data for the search
    if (this.meta !== undefined) {
      if (this.meta.headers !== undefined) {
        this.meta.headers.forEach(x => {
          self.gate[x.name] = '';
        });
      }
    }
  }
}

app.controller('MetaTableSearchBarCtrl', MetaTableSearchBarCtrl);
app.component('metaTableSearchBar', {
  templateUrl: "modules/generic/table/searchbar/meta.template.html",
  controller: 'MetaTableSearchBarCtrl',
  bindings: meta_bindings
});