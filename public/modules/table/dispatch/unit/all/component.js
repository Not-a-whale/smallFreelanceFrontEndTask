class DispatchUnitAllTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, timeout, businesssrv) {
    super(scope, state, chipsrv, timeout);

    this.businesssrv = businesssrv;
    this.fields = [{
      name: 'status',
      size: 'c3'
    }, {
      name: 'available',
      size: 'c2'
    }, {
      name: 'truck',
      size: 'c4'
    }, {
      name: 'type',
      size: 'c3'
    }, {
      name: 'driver',
      size: 'c2'
    }, {
      name: 'current location',
      size: 'c2'
    }, {
      name: 'current location',
      size: 'c2'
    }, {
      name: 'current location',
      size: 'c2'
    }, {
      name: 'current location',
      size: 'c2'
    }, {
      name: 'current location',
      size: 'c2'
    }];



    this.map = {
      'name': ['biz.BizName', 'OfficeName'],
      'type': ['TODO'],
      'primary contact': ['TODO'],
      'company phone': ['TODO'],
      'status': ['TODO'],
      'mc': ['biz.has_carrier.MC'],
      'branch address': ['brnch_address.Street1', 'brnch_address.City', 'brnch_address.State', 'brnch_address.Zip', 'brnch_address.Country'],
      'amount insured': ['TODO'],
      'business name': ['biz.BizName'],
      'office name': ['OfficeName'],
      'street': ['brnch_address.Street1', 'brnch_address.Street2', 'brnch_address.Street3'],
      'city': ['brnch_address.City'],
      'state': ['brnch_address.State'],
      'zip': ['brnch_address.Zip'],
      'dot': ['biz.has_carrier.DOT'],
      'scac': ['biz.has_carrier.SCAC']
    };
  }

  Search(query) {
    console.log('Unit Table Search is called');
    let self = this;
    this.businesssrv.BusinessSearch(query).then(function (data) {
      self.carrierList = data;
    });
  }

  Select(item) {
    return undefined;
    let id = item.BizId;
    this.state.go('tmsapp.main.hr.biz.carrier.list.detail', {
      'id': id
    });
  }


}

app.component('tableDispatchUnitAll', {
  templateUrl: 'modules/table/dispatch/unit/all/template.html',
  controller: ['$scope', '$state', 'TableSortChips', '$timeout', 'BusinessService', DispatchUnitAllTableCtrl],
  bindings: {
    tableList: '<?'
  }
});