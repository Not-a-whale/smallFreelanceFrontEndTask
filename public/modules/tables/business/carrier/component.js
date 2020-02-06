class CarrierTableCtrl {
  constructor(scope, businesssrv, state, chipsrv, timeout) {
    this.scope = scope;
    this.timeout = timeout;
    // used to focus the input fields, need to delay after search expands
    this.focuscall = undefined;

    this.chipsrv = chipsrv;
    this.state = state;
    this.businesssrv = businesssrv;
    this.fields = [{
      name: 'name',
      size: 'c3'
    }, {
      name: 'mc',
      size: 'c2'
    }, {
      name: 'address',
      size: 'c4'
    }, {
      name: 'amount insured',
      size: 'c3'
    }];



    this.map = {
      'name': ['biz.BizName', 'OfficeName'],
      'mc': ['biz.has_carrier.MC'],
      'address': ['brnch_address.Street1', 'brnch_address.City', 'brnch_address.State', 'brnch_address.Zip', 'brnch_address.Country'],
      'amount insured': ['TODO'],
      'business name': ['biz.BizName'],
      'office name': ['OfficeName'],
      'street': ['brnch_address.Street1','brnch_address.Street2','brnch_address.Street3'],
      'city': ['brnch_address.City'],
      'state': ['brnch_address.State'],
      'zip': ['brnch_address.Zip'],
      'dot' : ['biz.has_carrier.DOT'],
      'scac': ['biz.has_carrier.SCAC']
    };

    // holds ErrorObjs
    this.errors = [];
  }

  Search(query) {
    console.log('Carrier Table Search is called');
    let self = this;
    this.businesssrv.CarrierSearch(query).then(function (data) {
      if (data instanceof ErrorObj){
        self.errors.push(data);
      } else {
        self.carrierList = data;
      }

    });
  }

  PrepSearch(){
    let args = {
      fields: this.chipsrv.GetChips(),
      sort: this.chipsrv.GetSort()
    };

    console.log('broadcasting TableSearch with args');
    this.scope.$broadcast('TableSearch', args);
  }

  UpdateSort(field, value){
    this.chipsrv.SetSort(field, value);
    this.chipsrv.SetOrder(field);
    this.PrepSearch();
  }

  UpdateField(field, value){
    this.chipsrv.AddChip(field, value);
    this.PrepSearch();
  }

  Select(item){
    let id = item.BrnchId;
    this.state.go('tmsapp.main.hr.biz.carrier.list.detail', {
      'id': id
    });
  }

  FocusMe(index){
    let self = this;
    let args = {
      index: index
    };
    this.scope.$broadcast('SearchOpen');
    this.timeout( function(){
      self.scope.$broadcast('SearchFocus', args);
    }, 100);
  }

  $onInit(){
    this.chipsrv.Reset();
    this.chipsrv.SetMap(this.map);
  }
}

app.component('carrierTable', {
  templateUrl: 'modules/tables/business/carrier/template.html',
  controller: ['$scope', 'BusinessService', '$state', 'TableSortChips', '$timeout', CarrierTableCtrl],
  bindings: {
    carrierList: '<?'
  }
});