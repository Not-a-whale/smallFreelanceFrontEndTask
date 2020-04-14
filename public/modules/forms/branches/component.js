class BusinessBranchesFormCtrl {
  constructor(getid, APIService, $scope) {
    this.formid = getid();
    this.apisrv = APIService;
    this.sectionformid = getid();
    this.scope = $scope;

    this.list_endpoint = '/api/business/branch/list';
    this.formdata = undefined;
  }

  FetchFormData(item) {

    let self = this;

    let query = {
      search: [{
        'me.BrnchId': item.data.BrnchId
      }],
      page: 1,
      rows: 1
    };

    this.apisrv.Single('/api/business/branch', query).then(function (res) {
      if (res instanceof ErrorObj) {
        console.log(res.ErrorMessage());
      } else {
        console.log(self);
        self.formdata = res;
      }
      console.log(self.formdata);

    });
  }


  Submit() {
    console.log('called submit');
  }

  SubmitSection() {
    console.log('called section submit');
  }
}

app.component('uiBusinessBranchesForm', {
  templateUrl: 'modules/forms/branches/form.template.html',
  controller: BusinessBranchesFormCtrl,
});