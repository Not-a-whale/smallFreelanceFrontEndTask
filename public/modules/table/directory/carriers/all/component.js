class DirectoryCarriersAllTableCtrl extends TableCoreCtrl {
  constructor($scope, $state, TableSortChips, $timeout, APIService) {
    super($scope, $state, TableSortChips, $timeout);

    this.api = APIService;
    this.fields = [{
      name: 'name',
      size: 'c3'
    }, {
      name: 'office name',
      size: 'c3'
    }, {
      name: 'address',
      size: 'c4'
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
    let self = this;
    this.api.GetBusinessListByBranch(query).then(function (data) {
      self.carrierList = data;
    });
  }

  Select(item) {
    return undefined;
  }


}

app.component('tableDirectoryCarriersAll', {
  templateUrl: 'modules/table/directory/carriers/all/template.html',
  controller: DirectoryCarriersAllTableCtrl,
  bindings: {
    tableList: '<?'
  }
});