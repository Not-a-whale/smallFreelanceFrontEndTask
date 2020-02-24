class CarrierPageCtrl {
  constructor($state) {
    this.state = $state;
  }

  ShowDetail(item) {
    let id = item.BrnchId;
    console.log(id);
    this.state.go('tmsapp.main.hr.biz.carrier.list.detail', {
      'id': id
    });
  }
}

app.component('carrierListPage', {
  templateUrl: 'modules/pages/business/carrier/list/page.html',
  controller: CarrierPageCtrl,
  bindings: {
    carriers: '<'
  }
});