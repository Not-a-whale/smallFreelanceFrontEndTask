class MetaFocusedTableCtrl extends MetaAccordionTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);
    this.hiddenlist;
  }

  Select(item) {
    this._SelectSingle(item);
    if (item.selected) {
      this.hiddenlist = this.gate;
      this.gate = [item];
    } else {
      if (this.hiddenlist != undefined && this.hiddenlist.length > 0) {
        this.gate = this.hiddenlist;
      }
    }
  }
}

app.controller("MetaFocusedTableCtrl", ['getid', '$scope', '$element', '$timeout', MetaFocusedTableCtrl]);
app.component("metaTableFocused", {
  controller: "MetaFocusedTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/focused/meta.template.html",
  bindings: meta_table_bindings
});