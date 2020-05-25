class UIFormSectionStatePermit extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = "state permits";
    this.dependency = [
      new UIFormSectionDependency('BizId', 'businessId')
    ];
  }

  IsNew() {
    return isNaN(parseInt(this.data.CrrPrmtAccId)) == false;
  }
  CheckDependencies() {
    return isNaN(parseInt(this.businessId)) == false;
  }

  Create() {
    let self = this;

    let carrierId = this.businessId || this.carrierId;
    this.api.CreateCarrierStatePermit(this.data, carrierId).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
      return result;
    })
  }

  Update() {
    let self = this;
    this.api.UpdateCarrierStatePermit(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
      return result;
    });
  }

  Delete() {
    let self = this;
    this.api.DeleteCarrierStatePermit(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
    });
  }
}

app.component('uiFormSectionStatePermit', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/state-permit.section.template.html';
  },
  controller: UIFormSectionStatePermit,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    businessId: '<?',
    carrierId: '<?'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }

});