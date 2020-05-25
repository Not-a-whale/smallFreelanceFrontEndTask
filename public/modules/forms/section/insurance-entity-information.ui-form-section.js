class UIFormSectionInsuranceEntityInformation extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = 'insurances';
    this.dependency = [
      new UIFormSectionDependency('EntityId', 'entityId')
    ];
  }

  IsNew() {
    return this.EntityId == undefined;
  }

  CheckDependencies() {
    let retval = true;
    retval &= isNaN(parseInt(this.entityId)) == false;
    retval &= isNaN(parseInt(this.businessId)) == false;
    return retval;
  }

  Update() {
    let self = this;
    this.api.UpdateInsuranceEntity(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
      return result;
    });
  }

  Create() {
    let self = this;
    this.api.CreateInsuranceEntity(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
    });
  }
  Delete() {
    let self = this;
    this.api.DeleteInsuranceEntity(this.data.AstId, this.data.EntityId, this.data.InsEntId).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
    });
  }
}

app.component('uiFormSectionInsuranceEntityInformation', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/insurance-entity-information.section.template.html';
  },
  controller: UIFormSectionInsuranceEntityInformation,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    businessId: '<?', // this is the business tied to the tax stuff
    entityId: '<?' // this is the tax stuff
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});