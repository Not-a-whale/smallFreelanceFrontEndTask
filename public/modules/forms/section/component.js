class UIFormSectionCtrl {
  constructor(getid, APIService, $scope, $q, $state) {
    this.formid = getid();
    this.api = APIService;
    this.scope = $scope;
    this.q = $q;
    this.state = $state;

    this.submitfunction = null;
    this.endpoint = null;
    this.dependency = null;
    this.isNew = false;
    this.uiform = null;
    this.canSave = true;
    this.editItem = null;
  }

  $onInit() {
    if (this.megaformCtrl != undefined) {
      this.megaformCtrl.Register(this); //observer pattern sorta
    }
  }

  GetForm() {
    return this.scope.form;
  }

  HasDepdendencies() {
    return this.dependency != undefined;
  }

  CheckDependencies() {
    console.log('Checking dependencies');
    let retval = false;
    if (this.HasDepdendencies()) {
      let all_good = true;
      // dependencies are located in the state's resolve
      // list of configuration objects
      for (let depobj of this.dependency) {
        console.log(depobj);
        if (all_good == false) {
          break;
        }
        let depCtrl = null;
        if (depobj.section != undefined) {
          let depCtrl = this.megaformCtrl.GetDependency(depobj);
          if (depCtrl == undefined) {
            console.error('dependency not found');
            return false;
          }
          if (!(depCtrl instanceof UIFormSectionCtrl) && !depCtrl.IsAccurate()) {
            all_good = false;
            continue;
          }
        }

        for (let fieldobj of depobj.fields) {
          if (all_good == false) {
            break;
          }
          let fielddata = fieldobj.from;
          if (fieldobj.type != 'const') {
            fielddata = DeepFind(depCtrl.data, fieldobj.from);
          }
          if (fielddata == undefined) {
            all_good = false;
            continue;
          }
          let topaths = fieldobj.to;
          if (!(Array.isArray(fieldobj.to))) {
            topaths = [fieldobj.to];
          }
          for (let path of topaths) {
            if (DeepFind(this.data, path, fielddata) == undefined) {
              all_good = false;
              continue;
            }
          }
        }
      }
      retval = all_good;
    } else {
      console.log('no dependencies');
      // no dependencies
      retval = true;
    }
    return retval;
  }

  IsAccurate() {
    let form = this.GetForm();
    return form.$pristine && form.$submitted;
  }
  SaveForm() {
    let cansave = true;
    cansave = this.CheckDependencies(); //checks and maps dependencies
    cansave &= this.canSave;
    if (cansave) {
      this.SetSubmit('Add');
    } else {
      console.log('dependency not satisfied');
    }
  }

  SetSubmit(fun) {
    console.log('setting ' + fun);
    if (fun in this) {
      if (this[fun] instanceof Function) {
        if (this.isNew) {
          this.submitfunction = this.Add;
        } else {
          this.submitfunction = this[fun];
        }
      } else {
        console.log('not a function ' + fun);
      }
    } else {
      console.log('not found ' + fun);
    }
  }

  Submit() {
    let deferred = this.q.defer();
    if (this.submitfunction instanceof Function) {
      let self = this;
      console.log('submitting section form...');
      if (this.CheckDependencies()) { //checks and maps dependencies
        return this.submitfunction().then(function (result) {
          if (result instanceof ErrorObj) {
            alert(result.ErrorMessage());
            return false;
          } else {
            self.data = result[0];
            self.ClearAfterSubmit();
            self.scope.$broadcast('list-reload');

            return true;
          }
        }).then(function (result) {
          if (result) {
            self.GetForm().$setPristine();
            self.GetForm().$setSubmitted();
            return result;
          }

          return false;
        }).then(function (result) {
          if (result && self.isNew) {
            let params = {};
            if (self.ids != undefined) {
              for (let id of self.ids) {
                params[id.state] = DeepFind(self.data, id.data);
              }
            }
            let options = {
              reload: true
            };
            self.state.go('.', params, options);
          }
        });
      }
    } else {
      console.error('submitfunction not set');
    }
    deferred.reject(false);
    return deferred.promise;
  }

  Select(item) {
    this.editItem = item;
    this.data = item.data;
  }
  _CanClearEditItem() {
    return this.editItem != undefined && 'SetSelected' in this.editItem;
  }
  Clear() {
    if (this._CanClearEditItem()) {
      this.editItem.SetSelected(false);
    }
    this.data = {};
  }
  ClearAfterSubmit() {
    if (this._CanClearEditItem()) {
      // only clear after a submit when it is a list item
      this.editItem.SetSelected(false);
      this.data = {};
    }
  }

  Add() {
    return this.api.Create(this.endpoint, this.data);
  }
  Delete() {
    let delete_data = this.data;
    if (this.primaryPath != undefined) {
      let obj = {};
      DeepSet(obj, this.primaryPath, DeepFind(this.data, this.primaryPath));
      delete_data = obj;
    }
    return this.api.Delete(this.endpoint, delete_data);
  }

  Update() {
    return this.api.Update(this.endpoint, this.data);
  }
}


app.controller('uiFormSectionCtrl', UIFormSectionCtrl);
app.component('uiFormSection', {
  templateUrl: function ($element, $attrs) {
    let template = undefined;
    if ('type' in $attrs) {
      template = 'modules/forms/section/' + $attrs.type + '.section.template.html';
    }
    return template;
  },
  controller: UIFormSectionCtrl,
  bindings: {
    data: '=?',
    editItem: '=?',
    dependency: '<?', // object of object mappings, find uiFormSection of the type, then move that data over to this one
    // i.e. agent type uiFormSection needs branchid from branch uiFormSection
    endpoint: '=?', //where to submit the form's data
    query: '<?', //what information needs to be used to get information from serverside (i.e. lists or something else)
    isNew: '<?', //if this form is used to submit a new item
    type: '@?', // this is used for dependencies and template selection
    ids: '<?', // the id mapping of the state to the data's for new
    primaryPath: '<?' //the id to delete
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});

class UIFormSectionTemplateCtrl {
  constructor() {}
  Status(form) {
    let retval = 'save'
    if (form.$submitted && !(form.$dirty)) {
      retval = 'saved';
    }
    return retval;
  }
}
app.directive('uiFormSectionTemplate', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/forms/section/section-template.template.html',
    transclude: {
      'section-content': '?sectionContent'
    },
    bindToController: {
      canSave: '<?',
      title: '<?'
    },
    controller: UIFormSectionTemplateCtrl,
    controllerAs: '$formtemplate'
  };
});