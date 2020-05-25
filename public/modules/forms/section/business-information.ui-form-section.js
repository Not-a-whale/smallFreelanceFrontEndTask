class UIFormSectionBusinessInformation extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = 'business information';
    this.dependency = [new UIFormSectionDependency('BizId', 'businessId')];
  }
  IsNew() {
    return this.businessId === 'new';
  }

  Update() {
    let self = this;
    this.api.UpdateBusiness(this.data).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
    });
  }
  Create() {
    let self = this;
    this.api.CreateBusiness(this.data).then(
      this.api.MakeSingle
    ).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    }).then(function (result) {
      self.state.go('tmsapp.main2.profile.business.detail', {
        businessId: result.BizId
      }, {
        reload: true
      });
    });
  }
}

app.component('uiFormSectionBusinessInformation', {
  templateUrl: function ($element, $attrs) {
    $element.addClass('ui-section');
    return 'modules/forms/section/business-information.section.template.html';
  },
  controller: UIFormSectionBusinessInformation,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    businessId: '<?'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});