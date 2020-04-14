class UISubformMediatorCtrl {
  constructor($scope, getid) {
    this.formid = getid();
    this.scope = $scope;
    this.edit = {};
    this.submittype = 'create';
    this.endpoint = '/api/business/person';
  }
  DeleteItem() {
    this.submittype = 'delete';
  }
  AddItem() {
    this.submittype = 'create';
  }
  UpdateItem() {
    this.submittype = 'update';
  }
  Submitted(data) {
    if (data instanceof ErrorObj) {

    } else {
      this.scope.$broadcast('list-refresh');
      this.edit = undefined;
    }
  }
}

app.component('uiSubformMediator', {
  templateUrl: 'modules/ui/form/template/newsubform/mediator.template.html',
  controller: UISubformMediatorCtrl,
  bindings: {}
});


class UISubformFormCtrl2 {
  constructor(APIService, $scope, $element) {
    this.apisrv = APIService;
    this.scope = $scope;
    this.element = $element;
    this.endpoint = undefined;
    this.data = {};
  }
  Submit() {
    let self = this;
    //let command = event.name.split('-')[1];
    console.log(this.submittype);
    let command = this.submittype;
    command = command.charAt(0).toUpperCase() + command.substring(1);
    if (this.apisrv[command] instanceof Function) {
      let beforehook = 'before' + command;
      if (this[beforehook] instanceof Function) {
        this[beforehook]();
      }
      let afterhook = 'after' + command;
      this.apisrv[command](this.endpoint, this.data).then(function (res) {

        if (res instanceof ErrorObj) {
          // some error occured so a thing
        }

        if (self[afterhook] instanceof Function) {
          self[afterhook](res);
        }
        if (self.onSubmit instanceof Function) {
          self.onSubmit({
            data: res
          });
        }
      });
    }
  }

  afterCreate(res) {
    this.data = {};
  }
  afterUpdate(res) {
    this.data = res;
  }

  afterDelete(res) {
    this.data = {};
  }
}

app.component('uiSubformForm', {
  templateUrl: 'modules/ui/form/template/newsubform/form.template.html',
  controller: UISubformFormCtrl2,
  bindings: {
    data: '<?',
    formid: '<',
    form: '=?',
    onSubmit: '&?',
    endpoint: '<',
    submittype: '<'
  }
});