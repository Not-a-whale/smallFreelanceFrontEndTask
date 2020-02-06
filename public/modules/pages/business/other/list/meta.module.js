class BusinessesPageCtrl {
  constructor(http, $state, businesssrv){
    this.businesssrv = businesssrv;
    this.state = $state;
    this.http = http;
  }

  Console(){
    console.log("what is going on?!");
  }

  Search(query){

    console.log(query);
    let self = this;
    this.businesssrv.BusinessSearch(query).then(function(res){
      console.log(res);
      self.gate = res;
    });
  }

  ShowDetail(item){
    let id = item.BrnchId;
    console.log("business id:" + id);
    this.state.go('tmsapp.main.hr.biz.other.list.detail', { 'id': id});
  }
}

app.component('metaBusinessesListPage', {
  templateUrl: 'modules/pages/businesses/other/list/meta.template.html',
  controller: ['$http','$state', 'BusinessService', BusinessesPageCtrl],
  bindings: meta_bindings
});