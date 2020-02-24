class OperatorsPageCtrl {
  constructor($state){
    this.state = $state;
  }

  ShowDetail(item){
    let id = item.id;
    console.log(id);
    this.state.go('tmsapp.main.hr.prsnl.ops.list.detail', { 'id': id});
  }
}

app.component('operatorsListPage',{
  templateUrl: 'modules/pages/personnel/operators/list/template.html',
  controller: OperatorsPageCtrl,
  bindings: meta_bindings
});