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


class UIFormSectionCtrl {
  constructor() {

  }
  CheckDependencies() {
    let retval = false;
    if (this.dependencies != undefined) {
      if (Array.isArray(this.dependencies)) {
        retval = true;
        for (let dep of this.dependencies) {
          retval &= dep.IsAccurate();
          if (!retval) {
            console.log("form " + dep.title + " is not accurate");
            break;
          }
        }
      }
    }
    return retval;
  }

  MapDependencies() {
    let retval = false;
    if (this.dependencies != undefined) {
      if (Array.isArray(this.dependencies)) {
        for (let dep of this.dependencies) {
          for (let other_key of Object.keys(this.dependency_map[dep])) {
            let mappings = this.dependency_map[dep][other_key];
            if (!Array.isArray(mappings)) {
              mappings = [mappings];
            }
            let transfer = DeepFind(dep.formdata, other_key);
            if (transfer == undefined) {
              return false;
            }
            for (let path of mappings) {
              let formdata = this.formdata;
              if (!(Array.isArray(this.formdata))) {
                formdata = [this.formdata];
              }
              for (let data of formdata) {
                let transfered = DeepFind(data, path, transfer);
                if (transfered != transfer) {
                  return false;
                }
              }
            }
          }
        }
        retval = true;
      }
    }
    return retval;
  }
  IsAccurate() {
    return true;
  }
  SaveForm(form) {

    let cansave = true;
    cansave = this.CheckDependencies();
    cansave = this.MapDependencies();

    if (cansave) {
      console.log('saved form ' + form);
      console.log(this.formdata);
    }

  }

}


app.controller('uiFormSection', UIFormSectionCtrl);