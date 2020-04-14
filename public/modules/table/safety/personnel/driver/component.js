class SafetyPersonnelDriverTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, apisrv, timeout) {
    super(scope, state, chipsrv, apisrv, timeout);

    this.apisrv = apisrv;
    this.fields = [{
      name: 'name',
      size: 'c2'
    }, {
      name: 'phone',
      size: 'c1'
    }, {
      name: 'email',
      size: 'c2'
    }, {
      name: 'company',
      size: 'c2'
    }, {
      name: 'authority',
      size: 'c2'
    }, {
      name: 'unit',
      size: 'c2'
    }, {
      name: 'dispatcher',
      size: 'c3'
    }, {
      name: 'comments',
      size: 'c2'
    }, {
      name: 'holds',
      size: 'c3'
    }];

    this.map = {
      'name': [
        'driver.ast.FirstName',
        'driver.ast.NickName',
        'driver.ast.LastName',
        'driver.ast.Suffix',
        'driver.ast.Prefix',
        'driver.ast.NickName',
      ],
      'phone': [
        'driver.ast.biz_phone.Number',
        'driver.ast.biz_phone.Extension'
      ],
      'email': ['driver.ast.BizEmail'],
      'company': ['BizEmail'],
      'authority': ['ast.brnch.biz.BizName'],
      'unit': ['ast.brnch.OfficeName'],
      'dispatcher': ['ast.brnch.brnch_address'],
      'comments': ['TODO'],
      'holds': ['TODO']
    };

    this.searchurl = '/api/driver/table';
    this.profilestate = 'tmsapp.main2.form.generic';
    this.stateparams = {
      formName: 'new contact',
      subformName: 'new contact'
    };
  }

  GetId(item) {
    return item.DriverId;
  }
}

app.component('tableSafetyPersonnelDriver', {
  templateUrl: 'modules/table/safety/personnel/driver/template.html',
  controller: ['$scope', '$state', 'TableSortChips', 'APIService', '$timeout', SafetyPersonnelDriverTableCtrl],
  bindings: {
    tableList: '<?'
  }
});