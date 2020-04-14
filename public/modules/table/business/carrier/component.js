class BusinessCarrierTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, timeout, apisrv, businesssrv) {
    super(scope, state, chipsrv, apisrv, timeout);

    this.businesssrv = businesssrv;
    this.fields = [{
      name: 'name',
      size: 'c3'
    }, {
      name: 'mc',
      size: 'c1'
    }, {
      name: 'branch address',
      size: 'c4'
    }, {
      name: 'primary contact',
      size: 'c2'
    }, {
      name: 'company phone',
      size: 'c2'
    }, {
      name: 'amount insured',
      size: 'c2'
    }, {
      name: 'status',
      size: 'c2'
    }];

    this.map = {
      'name': [
        'carrier.BizName',
        'carrier.biz_branches.OfficeName'
      ],
      'mc': ['MC'],
      'branch address': [
        'carrier.biz_branches.brnch_address.Street1',
        'carrier.biz_branches.brnch_address.City',
        'carrier.biz_branches.brnch_address.State',
        'carrier.biz_branches.brnch_address.Zip',
        'carrier.biz_branches.brnch_address.Country'
      ],
      'primary contact': [
        'carrier.biz_branches.primary_contact.Suffix',
        'carrier.biz_branches.primary_contact.Prefix',
        'carrier.biz_branches.primary_contact.FirstName',
        'carrier.biz_branches.primary_contact.MiddleName',
        'carrier.biz_branches.primary_contact.LastName',
        'carrier.biz_branches.primary_contact.NickName'
      ],
      'company phone': ['carrier.biz_branches.brnch_phone.Number', 'carrier.biz_branches.brnch_phone.Extension'],
      'amount insured': ['TODO'],
      'status': ['TODO'],
      'business name': ['carrier.BizName'],
      'office name': ['carrier.biz_branches.OfficeName'],
      'street': [
        'carrier.biz_branches.brnch_address.Street1',
        'carrier.biz_branches.brnch_address.Street2',
        'carrier.biz_branches.brnch_address.Street3'
      ],
      'city': ['carrier.biz_branches.brnch_address.City'],
      'state': ['carrier.biz_branches.brnch_address.State'],
      'zip': ['carrier.biz_branches.brnch_address.Zip'],
      'dot': ['carrier.biz_branches.biz.has_carrier.DOT'],
      'scac': ['carrier.biz_branches.biz.has_carrier.SCAC']
    };

    this.searchurl = '/api/business/carrier/table';
    this.profilestate = 'tmsapp.main2.form.generic';
    this.stateparams = {
      formName: 'new general business',
      subformName: 'company info'
    };

  }


  GetId(item) {
    return item.CarrierId;
  }


}

app.component('tableBusinessCarrier', {
  templateUrl: 'modules/table/business/carrier/template.html',
  controller: ['$scope', '$state', 'TableSortChips', '$timeout', 'APIService', 'BusinessService', BusinessCarrierTableCtrl],
  bindings: {
    carrierList: '<?'
  }
});