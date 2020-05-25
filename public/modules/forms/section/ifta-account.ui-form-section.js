class UIFormSectionIftaAccount extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = "IFTA account";
    this.dependency = [
      new UIFormSectionDependency('BizId', 'businessId')
    ];
  }

  IsNew() {
    return this.data.IftaAcctId === undefined;
  }

  CheckDependencies() {
    return isNaN(parseInt(this.businessId)) == false;
  }

  Update() {
    let self = this;
    this.api.UpdateIFTAAccount(this.data).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    });
  }

  Create() {
    let self = this;
    this.api.CreateIFTAAccount(this.data, this.businessId).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    });
  }

}

app.component('uiFormSectionIftaAccount', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/ifta-account.section.template.html';
  },
  controller: UIFormSectionIftaAccount,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    businessId: '<?'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});