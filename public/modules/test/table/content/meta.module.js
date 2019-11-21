class MetaTableContentCtrl extends MetaGateCtrl {
  constructor(){
    super();
    this.imeta = {};
  }
}

var meta_table_content_bindings = CloneObj(meta_bindings);
meta_table_content_bindings.tableMeta = '<?';

app.controller('MetaTableContentCtrl',MetaTableContentCtrl);
app.component('metaTestTableContent', {
  templateUrl: 'modules/test/table/content/meta.template.html',
  controller: 'MetaTableContentCtrl',
  bindings: meta_table_content_bindings
});