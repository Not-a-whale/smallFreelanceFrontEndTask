class MetaCheckboxCtrl extends MetaInputCtrl {
  constructor(getid) {
    super(getid);
  }

  Toggle() {
    this.gate = this.gate == this.meta.attr.onvalue ? this.meta.attr.offvalue : this.meta.attr.onvalue;
  }
}

app.controller('MetaCheckboxCtrl', ['getid', MetaCheckboxCtrl]);

app.component('metaCheckbox', {
  templateUrl: 'modules/generic/checkbox/meta.template.html',
  bindings: meta_bindings,
  controller: 'MetaCheckboxCtrl'
});