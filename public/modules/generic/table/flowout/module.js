class FlowoutTableCtrl extends GenericTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);
  }

  Select(item) {
    this._SelectSingle(item);

    if (this.onSelect instanceof Function && item.selected) {
      this.onSelect({
        item: item
      });
    }
  }
}

let table_flowout_bindings = JSON.parse(JSON.stringify(table_bindings));
table_flowout_bindings['onSelect'] = '&?';

app.controller("FlowoutTableCtrl", ['getid', '$scope', '$element', '$timeout', FlowoutTableCtrl]);
app.component("tableFlowout", {
  controller: "FlowoutTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/flowout/default.html",
  bindings: table_flowout_bindings
});