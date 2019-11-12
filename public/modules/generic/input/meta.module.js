class MetaInputCtrl {
  constructor(getid) {
    this.id = getid();
  }
}

var meta_bindings = {
  gate: '=?', // this is the input but showValue is the one being changed
  meta: '<?', // this has the meta data
};

let meta_input_bindings = CloneObj(meta_bindings);
meta_input_bindings['type'] = '@';


app.controller('MetaInputCtrl', ['getid', MetaInputCtrl]);

app.component('metaInput', {
  templateUrl: 'modules/generic/input/meta.template.html',
  controller: 'MetaInputCtrl',
  bindings: meta_input_bindings
});