class BusinessAllTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, apisrv, timeout, businesssrv) {
    super(scope, state, chipsrv, apisrv, timeout);

    // used to focus the input fields, need to delay after search expands
    this.businesssrv = businesssrv;
    this.fields = [{
      name: 'name',
      size: 'c2'
    }, {
      name: 'branch',
      size: 'c2'
    }, {
      name: 'address',
      size: 'c3'
    }, {
      name: 'primary contact',
      size: 'c2'
    }, {
      name: 'company phone',
      size: 'c2'
    }, {
      name: 'company email',
      size: 'c1'
    }, {
      name: 'comments',
      size: 'c2'
    }, {
      name: 'holds',
      size: 'c1'
    }, {
      name: 'blacklist',
      size: 'c1'
    }];


    this.map = {
      'name': ['biz.BizName'],
      'branch': ['OfficeName'],

      'address': [
        'brnch_address.Street1',
        'brnch_address.City',
        'brnch_address.State',
        'brnch_address.Zip',
        'brnch_address.Country'
      ],
      'primary contact': [
        'primary_contact.Suffix',
        'primary_contact.Prefix',
        'primary_contact.FirstName',
        'primary_contact.LastName',
        'primary_contact.MiddleName',
        'primary_contact.NickName',
      ],
      'company phone': ['brnch_phone.Number', 'brnch_phone.Extension'],
      'company email': ['BrnchEMail'],
      'comments': ['TODO'],
      'holds': ['TODO'],
      'blacklist': ['TODO'],

      'business name': ['biz.BizName'],
      'office name': ['OfficeName'],
      'street': [
        'brnch_address.Street1',
        'brnch_address.Street2',
        'brnch_address.Street3'
      ],
      'city': ['brnch_address.City'],
      'state': ['brnch_address.State'],
      'zip': ['brnch_address.Zip'],
      'dot': ['biz.has_carrier.DOT'],
      'scac': ['biz.has_carrier.SCAC'],
      'mc': ['biz.has_carrier.MC'],
    };

    // holds ErrorObjs
    this.errors = [];
    this.searchurl = '/api/business/branch/table';
    this.profilestate = 'tmsapp.main2.form.generic';
    this.stateparams = {
      formName: 'new general business',
      subformName: 'company info'
    };
  }

  GetId(item) {
    return item.BrnchId;
  }
}

app.component('tableBusinessAll', {
  templateUrl: 'modules/table/business/all/template.html',
  controller: ['$scope', '$state', 'TableSortChips', 'APIService', '$timeout', 'BusinessService', BusinessAllTableCtrl],
  bindings: {
    tableList: '<?'
  }
});