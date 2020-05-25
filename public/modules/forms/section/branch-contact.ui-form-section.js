class UIFormSectionBranchContact extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = 'branch contacts';
    this.dependency = [
      new UIFormSectionDependency('ast.BrnchId', 'branchId')
    ];
  }

  IsNew() {
    return this.AstId == undefined;
  }

  CheckDependencies() {
    let retval = true;
    retval &= isNaN(parseInt(this.branchId)) == false;
    return retval;
  }

  Update() {
    let self = this;
    this.api.UpdateContact(this.data).then(this.api.MakeSingle).then(function (result) {
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
    this.api.CreateContact(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
    });
  }
  Delete() {
    let self = this;
    this.api.DeleteContact(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
        self.Clear();
        self.ReloadList();
      }
    });
  }
}

app.component('uiFormSectionBranchContact', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/branch-contact.section.template.html';
  },
  controller: UIFormSectionBranchContact,
  controllerAs: '$sectionctrl',
  bindings: {
    data: '<?',
    branchId: '<?',
    businessId: '<?'
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});