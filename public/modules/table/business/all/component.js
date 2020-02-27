class BusinessAllTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, timeout, businesssrv) {
    super(scope, state, chipsrv, timeout);

    // used to focus the input fields, need to delay after search expands
    this.businesssrv = businesssrv;
    this.fields = [{
      name: 'name',
      size: 'c3'
    }, {
      name: 'type',
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
      name: 'company email',
      size: 'c3'
    }, {
      name: 'status',
      size: 'c2'
    }];


    this.map = {
      'name': ['biz.BizName', 'OfficeName'],
      'type': ['TODO'],
      'mc': ['biz.has_carrier.MC'],
      'branch address': ['brnch_address.Street1', 'brnch_address.City', 'brnch_address.State', 'brnch_address.Zip', 'brnch_address.Country'],
      'primary contact': ['TODO'],
      'company phone': ['TODO'],
      'company email': ['TODO'],
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

    // holds ErrorObjs
    this.errors = [];
  }

  Search(query) {
    console.log('Business All Table Search is called');
    let self = this;
    this.businesssrv.BusinessSearch(query).then(function (data) {
      if (data instanceof ErrorObj) {
        self.errors.push(data);
      } else {
        self.carrierList = data;
      }
    });
  }
}

app.component('tableBusinessAll', {
  templateUrl: 'modules/table/business/all/template.html',
  controller: ['$scope', '$state', 'TableSortChips', '$timeout', 'BusinessService', BusinessAllTableCtrl],
  bindings: {
    carrierList: '<?'
  }
});