class UIFormSectionCtrl {
  constructor(getid, APIService, $scope) {
    this.formid = getid();
    this.api = APIService;
    this.scope = $scope;

    this.submitfunction = undefined;
    this.endpoint = undefined;
  }

  HasDepdendencies() {
    return this.dependencies != undefined;
  }
  CheckDependencies() {
    let retval = false;
    if (this.HasDepdendencies()) {
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
    } else {
      // no dependencies
      retval = true;
    }
    return retval;
  }
  MapDependencies() {
    let retval = false;
    if (this.HasDepdendencies()) {
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
    } else {
      //no dependencies
      retval = true;
    }
    return retval;
  }
  IsAccurate() {
    return true;
  }
  SaveForm() {
    let cansave = true;
    cansave = this.CheckDependencies();
    cansave = this.MapDependencies();

    if (cansave) {
      console.log('saved form ');
      console.log(this.data);
      this.SetSubmit('Update');
    }
  }

  SetSubmit(fun) {
    console.log('setting ' + fun);
    if (fun in this) {
      if (this[fun] instanceof Function) {
        this.submitfunction = this[fun];
      } else {
        console.log('not a function ' + fun);
      }
    } else {
      console.log('not found ' + fun);
    }
  }

  Submit() {
    if (this.submitfunction instanceof Function) {
      let self = this;
      console.log('submitting section form...');
      this.submitfunction().then(function (result) {
        if (result instanceof ErrorObj) {
          alert(result.ErrorMessage());
        } else {
          self.Clear();
          self.scope.$broadcast('list-reload');
        }
      });
    } else {
      console.error('submitfunction not set');
    }

  }

  Select(item) {
    this.editItem = item;
  }

  Add() {
    console.log('Adding new item');
    let data = this.data;
    if (this.editItem != undefined) {
      data = this.editItem.data;
    }
    return this.api.Create(this.endpoint, data);
  }

  Clear() {
    this.editItem.SetSelected(false);
    this.editItem = {};
  }

  Delete() {
    console.log('Deleting item');
    let data = this.data;
    if (this.editItem != undefined) {
      data = this.editItem.data;
    }
    return this.api.Delete(this.endpoint, data);
  }

  Update() {
    console.log('Updating item');
    let data = this.data;
    if (this.editItem != undefined) {
      data = this.editItem.data;
    }
    return this.api.Update(this.endpoint, data);
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
    section: '=?',
    dependency: '=?',
    endpoint: '=?',
  }
});


class UIFormSectionTemplateCtrl {
  constructor() {
    this.formid = undefined;
    this.status = 'save';
    this.saveForm = false;
  }


  SaveForm() {
    if (this.saveForm == true) {
      if (this.formCtrl != undefined) {
        this.formCtrl.SaveForm();
      }
    }
  }

  $onInit() {
    this.formid = this.formCtrl.formid;
    this.formCtrl.endpoint = this.endpoint;
  }
}
app.directive('uiFormSectionTemplate', function () {
  return {
    scope: true,
    restrict: 'E',
    require: {
      formCtrl: '?^^uiFormSection'
    },
    templateUrl: 'modules/forms/section/template.template.html',
    transclude: {
      'section-content': '?sectionContent'
    },
    bindToController: {
      section: '=',
      saveForm: '<?',
      endpoint: '<?'
    },
    controller: UIFormSectionTemplateCtrl,
    controllerAs: '$ctrl'
  };
});