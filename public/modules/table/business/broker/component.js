class BusinessBrokerTableCtrl extends TableCoreCtrl {
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
      'name': ['cstmr.BizName', 'cstmr.biz_branches.OfficeName'],
      'mc': ['MC'],
      'branch address': [
        'cstmr.biz_branches.brnch_address.Street1',
        'cstmr.biz_branches.brnch_address.City',
        'cstmr.biz_branches.brnch_address.State',
        'cstmr.biz_branches.brnch_address.Zip',
        'cstmr.biz_branches.brnch_address.Country'
      ],
      'primary contact': [
        'cstmr.biz_branches.primary_contact.Suffix',
        'cstmr.biz_branches.primary_contact.Prefix',
        'cstmr.biz_branches.primary_contact.FirstName',
        'cstmr.biz_branches.primary_contact.MiddleName',
        'cstmr.biz_branches.primary_contact.LastName',
        'cstmr.biz_branches.primary_contact.NickName'
      ],
      'company phone': [
        'cstmr.biz_branches.brnch_phone.Number',
        'cstmr.biz_branches.brnch_phone.Extension'
      ],
      'company email': ['cstmr.biz_branches.BrnchEMail'],
      'pod/bol': ['Terms'],
      'credit limit': ['CreditLimit'],
      'status': ['TODO'],
      'business name': ['biz.BizName'],
      'office name': ['OfficeName'],
      'street': [
        'cstmr.biz_branches.brnch_address.Street1',
        'cstmr.biz_branches.brnch_address.Street2',
        'cstmr.biz_branches.brnch_address.Street3'
      ],
      'city': ['cstmr.biz_branches.brnch_address.City'],
      'state': ['cstmr.biz_branches.brnch_address.State'],
      'zip': ['cstmr.biz_branches.brnch_address.Zip'],
      'dot': ['DOT'],
      'scac': ['SCAC']
    };
    this.searchurl = '/api/business/broker/table';
    this.profilestate = 'tmsapp.main2.form.generic';
    this.stateparams = {
      formName: 'new general business',
      subformName: 'company info'
    };
  }

  GetId(item) {
    return item.CstmrId;
  }
}

app.component('tableBusinessBroker', {
  templateUrl: 'modules/table/business/broker/template.html',
  controller: ['$scope', '$state', 'TableSortChips', '$timeout', 'APIService', 'BusinessService', BusinessBrokerTableCtrl],
  bindings: {
    brokerList: '<?'
  }
});