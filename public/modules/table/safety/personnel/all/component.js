class SafetyPersonnelAllTableCtrl extends TableCoreCtrl {
  constructor(scope, state, chipsrv, apisrv, timeout) {
    super(scope, state, chipsrv, apisrv, timeout);

    this.apisrv = apisrv;
    this.fields = [{
      name: 'name',
      size: 'c2'
    }, {
      name: 'role',
      size: 'c1'
    }, {
      name: 'phone',
      size: 'c2'
    }, {
      name: 'email',
      size: 'c2'
    }, {
      name: 'company',
      size: 'c2'
    }, {
      name: 'branch name',
      size: 'c2'
    }, {
      name: 'branch address',
      size: 'c3'
    }, {
      name: 'notes',
      size: 'c2'
    }, {
      name: '',
      size: 'c3'
    }];

    this.map = {
      'name': ['ast.FirstName', 'ast.NickName', 'ast.LastName'],
      'role': ['CurrentTitle'],
      'phone': ['biz_phone.Number', 'biz_phone.Extension'],
      'email': ['BizEmail'],
      'company': ['ast.brnch.biz.BizName'],
      'branch name': ['ast.brnch.OfficeName'],
      'branch address': ['ast.brnch.brnch_address'],
      'notes': ['TODO'],
    };

    this.searchurl = '/api/associate/table';
    this.profilestate = 'tmsapp.main2.form.generic';
    this.stateparams = {
      formName: 'new contact',
      subformName: 'new contact'
    };
  }

  GetId(item) {
    return item.AstId;
  }
}

app.component('tableSafetyPersonnelAll', {
  templateUrl: 'modules/table/safety/personnel/all/template.html',
  controller: ['$scope', '$state', 'TableSortChips', 'APIService', '$timeout', SafetyPersonnelAllTableCtrl],
  bindings: {
    tableList: '<?'
  }
});