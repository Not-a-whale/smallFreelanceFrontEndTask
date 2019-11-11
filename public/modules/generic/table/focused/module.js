class FocusedTableCtrl extends AccordionTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);
    this.hiddenlist;
  }

  Select(item) {
    this._SelectSingle(item);
    if (item.selected) {
      this.hiddenlist = this.list;
      this.list = [item];
    } else {
      if (this.hiddenlist != undefined && this.hiddenlist.length > 0) {
        this.list = this.hiddenlist;
      }
    }
  }
}

app.controller("FocusedTableCtrl", ['getid', '$scope', '$element', '$timeout', FocusedTableCtrl]);
app.component("tableFocused", {
  controller: "FocusedTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/focused/default.html",
  bindings: table_bindings
});