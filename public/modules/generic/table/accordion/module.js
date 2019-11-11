class AccordionTableCtrl extends GenericTableCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid, scope, element, timeout);

    this.expansionView = 'table_expansion';
  }

  Select(item) {
    this._SelectSingle(item);
  }
}

let table_accordion_bindings = JSON.parse(JSON.stringify(table_bindings));
table_accordion_bindings['expansionView', '<'];

app.controller("AccordionTableCtrl", ['getid', '$scope', '$element', '$timeout', AccordionTableCtrl]);
app.component("tableAccordion", {
  controller: "AccordionTableCtrl",
  controllerAs: "tctrl",
  templateUrl: "modules/generic/table/accordion/default.html",
  bindings: table_accordion_bindings
});