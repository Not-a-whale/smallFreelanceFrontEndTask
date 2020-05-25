class UIFormSectionOwnerInformation extends UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    super(APIService, $scope, $q, $state);
    this.title = 'owner information';
    this.dependency = [
      new UIFormSectionDependency('ast.BrnchId', 'branchId'),
      new UIFormSectionDependency('brnch.BizId', 'businessId')
    ];
  }

  IsNew() {
    let isnew = true;
    isnew &= this.data.AstId == undefined;
    return isnew;

  }

  CheckDependencies() {
    return isNaN(parseInt(this.branchId)) == false;
  }

  Update() {
    self = this;
    return this.api.UpdateContact(this.data).then(this.api.MakeSingle).then(function (result) {
      if (!self.ResultError(result)) {
        self.SetData(result);
      }
    })
  }

  Create() {
    let self = this;
    //first create the contact
    return this.api.CreateContact(this.data).then(this.api.MakeSingle).then(function (result) {
      let defer = self.q.defer();
      if (result == undefined) {
        self.api.GetContact(self.data).then(self.api.MakeSingle).then(function (result) {
          if (result == undefined) {
            defer.reject('no contact provided by backend');
          } else {
            defer.resolve(result);
          }
        });
      } else if (!self.ResultError(result)) {
        self.SetData(result);
        defer.resolve(result);
      } else {
        defer.reject('Got an error');
      }
      return defer.promise;
    }).then(function (result) {
      return self.api.SetBranchPrimaryContact(self.branchId, result.AstId).then(self.api.MakeSingle).then(function (result) {
        console.log('This is after the set primary contact');
        console.log(result);
        if (!self.ResultError(result)) {
          self.SetData(result);
        }
        return result;
      });
    });
  }
}

app.component('uiFormSectionOwnerInformation', {
  templateUrl: function ($element, $attrs) {
    return 'modules/forms/section/owner.section.template.html';
  },
  controller: UIFormSectionOwnerInformation,
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