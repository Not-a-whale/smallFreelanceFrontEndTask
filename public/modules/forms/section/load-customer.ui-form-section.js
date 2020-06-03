class UIFormSectionLoadCustomer extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = 'Customer';
    this.dependency = [];
    this.id = 'load-customer-info';
  }
  IsNew() {
    return this.loadId === 'new';
  }

  Update() {
    let self = this;
    this.api.UpdateBranch(this.data).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        if (self.megaformCtrl != undefined) {
          self.megaformCtrl.ReloadList();
        }

      }
    });
  }
  Create() {
    let self = this;
    this.api.CreateBranch(this.data, this.businessId).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    }).then(function (result) {
      self.state.go('tmsapp.main2.profile.business.branch.detail', {
        branchid: result.BrnchId
      }, {
        reload: true
      });
    });
  }

  Delete() {
    //cannot delete a load
    alert('Cannot delete loads at the moment!');
  }
}

app.component('uiFormSectionLoadCustomer', {
  templateUrl: function ($element, $attrs) {
    $element.addClass('ui-section');
    return 'modules/forms/section/load-customer.section.template.html';
  },
  controller: UIFormSectionLoadCustomer,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    loadId: '<?'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});