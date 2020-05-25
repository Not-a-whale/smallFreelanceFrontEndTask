/**
 * Base controller for UI-Form-Sections
 */
class UIFormSectionCtrl {
  constructor(APIService, $scope, $q, $state) {
    this.api = APIService;
    this.scope = $scope;
    this.q = $q;
    this.state = $state;
    this.dependency = null; // used for grabbing bindings and putting them into the proper spot
    this.submitfunction = null; //dynamic function for submitting with submit button bound to ngForm
    this.editItem = null;


    // all sections should go through "SaveForm" function when submitting.
    // override functions as needed
  }

  $onInit() {
    let self = this;
    if (this.megaformCtrl != undefined) {
      this.megaformCtrl.Register(this); //observer pattern sorta
      this.scope.$on('$destroy', function () {
        self.megaformCtrl.Deregister(self);
      });
    }
  }

  /**
   * Displays the text inside of the button
   */
  Status() {
    let form = this.GetForm();
    let retval = 'save';
    if (form.$submitted && !(form.$dirty)) {
      retval = 'saved';
    }
    return retval;
  }

  /**
   * true/false based on whether the form can be submitted
   */
  SaveEnabled() {
    let form = this.GetForm();
    let canSubmit = true;

    if (form.$pristine) {
      canSubmit &= false;
    }

    if (Object.keys(form.$error).length > 0) {
      canSubmit &= false;
    }
    if (this.HasDependencies()) {
      canSubmit &= this.CheckDependencies();
    }

    return canSubmit;
  }

  /**
   * getter for Form bound to Controller
   */
  GetForm() {
    return this.scope.form;
  }
  /** */

  /**
   * Override as needed per class
   * Default no dependencies
   */
  HasDependencies() {
    return this.dependency != undefined;
  }

  /**
   * returns true/false based on whether dependencies are correct enough
   */
  CheckDependencies() {
    return true;
  }
  /**
   * Set the dependencies to the proper paths
   *  Expects object to have list of dep objects
   */
  ResolveDependencies() {
    let resolved = true;
    for (let dep of this.dependency) {
      if (dep instanceof UIFormSectionDependency) {
        if (dep.binding in this && this[dep.binding] !== undefined) {
          let binding_value = this[dep.binding];
          if (isNaN(binding_value) === false) {
            resolved &= DeepSet(this.data, dep.location, binding_value);
          } else if (binding_value !== 'new') {
            console.error('Dependency resolved to unknown value');
          }

        } else {
          resolved = false;
        }
      } else {
        resolved = false;
      }
    }
    return resolved;
  }

  IsAccurate() {
    let form = this.GetForm();
    return form.$pristine && form.$submitted && Object.keys(form.$error).length == 0;
  }
  SaveForm(funcname) {
    // funcname is used for doing a specific function.
    let self = this;
    let defer = this.q.defer();
    let form = this.GetForm();
    let promise = defer.promise;
    let force_submit = (funcname === 'Delete');
    if (this.SaveEnabled() || force_submit) {
      if (this.ResolveDependencies()) {
        if (!this.SetSubmit(funcname)) {
          if (this.IsNew()) {
            this.SetSubmit('Create');
          } else {
            this.SetSubmit('Update');
          }
        }
        defer.resolve('Ready to submit form');
        defer.promise.then(function (result) {
          return self.Submit();
        });
      } else {
        this.SetSubmit(null);
        defer.reject('Failed to resolve dependencies');
        defer.promise.then(function (result) {
          form.$submitted = false;
        });
      }

    } else {
      this.SetSubmit(null);
      defer.reject('Save is not enabled for this form');
      defer.promise.then(function (result) {
        form.$submitted = false;
      });
    }
    return promise;
  }

  // override
  Submit() {
    let defer = this.q.defer();
    let promise = defer.promise;

    if (this.submitfunction instanceof Function) {
      promise = this.submitfunction();
    } else {
      defer.reject('unknown submit function called');
    }

    return promise;
  }

  /**
   * Attempts to set the dynamic submit function
   * @param {Function} fun
   */
  SetSubmit(fun) {
    let retval = false;
    if (fun in this) {
      if (this[fun] instanceof Function) {
        this.submitfunction = this[fun];
        retval = true;
      }
    } else {
      this.submitfunction = null;
    }
    return retval;
  }

  ResultError(result) {
    let retval = false;
    if (result instanceof ErrorObj) {
      console.error(result.ErrorMessage());
      if (this.errorCtrl != undefined) {
        this.errorCtrl.ShowError(result);
      }
      retval = true;
    }
    return retval;
  }
  SetData(result) {
    this.GetForm().$setPristine();
    this.GetForm().$setSubmitted();
    this.data = result;
  }

  // this item selection can go into its own directive
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
    this.SetData({});
    this.ReloadList();
  }
  ClearAfterSubmit() {
    if (this._CanClearEditItem()) {
      // only clear after a submit when it is a list item
      this.editItem.SetSelected(false);
      this.data = this.SetData({});
      this.ReloadList();
    }
  }

  ReloadList() {
    this.scope.$broadcast('ui-list-reload');
  }
}

class UIFormSectionDependency {
  constructor(location, binding) {
    this.location = location || null;
    this.binding = binding || null;
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
    query: '<?', //what information needs to be used to get information from serverside (i.e. lists or something else)
  },
  require: {
    megaformCtrl: '?^^uiMegaForm'
  }
});