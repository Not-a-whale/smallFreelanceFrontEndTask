class MetaFlowoutTableCtrl extends MetaTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);
  }

  Select(item) {
    this._SelectSingle(item);
    if (this.onSelect instanceof Function && item.selected) {
      this.onSelect({
        item: item
      });
    } else {
      console.error("no function bound to onSelect for flowout table");
    }
  }
}

let meta_table_flowout_bindings = CloneObj(meta_table_bindings);
meta_table_flowout_bindings['onSelect'] = '&?';

app.controller("MetaFlowoutTableCtrl", ['getid', '$scope', '$element', '$timeout', MetaFlowoutTableCtrl]);
app.component("metaTableFlowout", {
  controller: "MetaFlowoutTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/flowout/meta.template.html",
  bindings: meta_table_flowout_bindings
});