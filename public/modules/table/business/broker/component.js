class BusinessBrokerTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, timeout, businesssrv) {
    super(scope, state, chipsrv, timeout);

    this.businesssrv = businesssrv;
    this.fields = [{
        name: 'name',
        size: 'c3'
      }, {
        name: 'mc',
        size: 'c1'
      }, {
        name: 'branch address',
        size: 'c3'
      }, {
        name: 'primary contact',
        size: 'c2'
      }, {
        name: 'company phone',
        size: 'c2'
      }, {
        name: 'pod/bol',
        size: 'c2'
      }, {
        name: 'credit limit',
        size: 'c2'
      },
      {
        name: 'status',
        size: 'c1'
      }
    ];

    this.map = {
      'name': ['biz.BizName', 'OfficeName'],
      'mc': ['biz.has_carrier.MC'],
      'branch address': ['brnch_address.Street1', 'brnch_address.City', 'brnch_address.State', 'brnch_address.Zip', 'brnch_address.Country'],
      'primary contact': ['TODO'],
      'company phone': ['TODO'],
      'company email': ['TODO'],
      'pod/bol' : ['TODO'],
      'credit limit' : ['TODO'],
      'status': ['TODO'],
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
    console.log('Brokerage Table Search is called');
    let self = this;
    this.businesssrv.BrokerSearch(query).then(function (data) {
      if (data instanceof ErrorObj) {
        self.errors.push(data);
      } else {
        self.brokerList = data;
      }
    });
  }

  Select(item) {
    return undefined;
    let id = item.BrnchId;
    this.state.go('tmsapp.main.hr.biz.carrier.list.detail', {
      'id': id
    });
  }
}

app.component('tableBusinessBroker', {
  templateUrl: 'modules/table/business/broker/template.html',
  controller: ['$scope', '$state', 'TableSortChips', '$timeout', 'BusinessService', BusinessBrokerTableCtrl],
  bindings: {
    brokerList: '<?'
  }
});