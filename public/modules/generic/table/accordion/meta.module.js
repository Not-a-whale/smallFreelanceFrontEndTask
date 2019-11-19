class MetaAccordionTableCtrl extends MetaTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);

    this.expansionView = 'table_expansion';
  }

  Select(item) {
    this._SelectSingle(item);
  }

  $onInit(){
    super.$onInit();
  }
}

var meta_table_accordion_bindings = {
  gate: '=?',
  meta: '<?',
  onSearch: '&',
  colsize: '<?',
  headers: '<?'
};

app.controller("MetaAccordionTableCtrl", ['getid', '$scope', '$element', '$timeout', MetaAccordionTableCtrl]);
app.component("metaTableAccordion", {
  controller: "MetaAccordionTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/accordion/meta.template.html",
  bindings: meta_table_accordion_bindings
});