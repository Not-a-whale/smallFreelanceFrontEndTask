class UIFormSectionPersonInformation extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = "personal information";
    this.dependency = [
      new UIFormSectionDependency('brnch.BizId', 'businessId')
    ];
  }

  IsNew() {
    return isNaN(parseInt(this.data.PrsnId)) == false;
  }

  CheckDependencies() {
    return isNaN(parseInt(this.businessId)) == false;
  }

  Update() {
    let self = this;

    this.api.UpdateContact(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    });
  }

  Create() {
    let self = this;

    this.api.CreateBusinessContact().then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
      return result;
    });
  }
}

app.component('uiFormSectionPersonInformation', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/person-information.section.template.html'
  },
  controller: UIFormSectionPersonInformation,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    businessId: '<'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});