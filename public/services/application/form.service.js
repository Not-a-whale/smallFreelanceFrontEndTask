class FormServiceCtrl {
  constructor(http, uirouter, q, apisrv, transition) {
    this.http = http;
    this.uirouter = uirouter;
    this.q = q;
    this.apisrv = apisrv;
    this.transition = transition;
    this.forms = {};
    this.formTemplates = {};
    this.endpoint = {
      mod: 'form.modular.json',
      sect: 'form.modular.json'
    };

    this.currentForm = undefined;
    this.currentSubform = undefined;
    this.formData = {};
  }

  GetForms() {
    return this.forms.mod;
  }

  SetCurrentFormData(data) {
    this.UpdateFormData(this.CurrentForm().title, data);
  }

  GetFormData(id) {
    let self = this;
    return this.q(function (resolve, reject) {
      if (id == undefined) {
        resolve(self.FormData(self.CurrentForm().title));
      } else {
        let currentForm = self.CurrentForm();
        let searchobj = {};
        searchobj[currentForm.searchid] = id;
        let query = {
          search: [searchobj]
        };
        let url = currentForm.route;

        resolve(self.apisrv.Single(url, query).then(function (data) {
          self.SetCurrentFormData(data);
          return self.CurrentFormData();
        }));
      }
    });
  }

  CurrentFormData(id) {
    let self = this;
    if (id == undefined) {
      return self.FormData(self.CurrentForm().title);
    } else {
      return this.GetFormData(id);
    }
  }

  FormData(formName) {
    let form = this.forms.mod.find(x => x.title == formName);
    if (form != undefined) {
      if (!(formName in this.formData)) {
        this.formData[formName] = {};
      }
      return this.formData[formName];
    } else {
      console.error('no form found ' + formName);
    }
    return undefined;
  }

  UpdateFormData(formName, data) {
    if (data != undefined) {
      let form = this.forms.mod.find(x => x.title == formName);
      if (form != undefined) {
        this.formData[formName] = data;
        return data;
      } else {
        console.error('no form found ' + formName);
      }
    }
  }

  ClearFormData(formName) {
    return this.UpdateFormData(formName, {});
  }


  BuildForm(formName) {
    if ('mod' in this.forms) {
      if (formName in this.forms.mod) {

      }
    }
  }

  SetForm(formName) {
    let form = this.GetForms().find(x => x.title.localeCompare(formName) == 0);
    if (form != undefined) {
      this.currentForm = form;
    } else {
      console.error('invalid form ' + formName);
    }
  }

  SetSubform(formName) {
    if (this.currentForm != undefined) {
      let form = this.currentForm.forms.find(x => x.title.localeCompare(formName) == 0);
      if (form != undefined) {
        this.currentSubform = form;
      }
    } else {
      console.error('no form set for subform ' + formName);
    }
  }

  GetSection(sectionName) {
    if (this.currentForm != undefined) {
      if (this.currentSubform != undefined) {
        let section = this.currentSubform.forms.find(x => x.title.localeCompare(sectionName) == 0);
        if (section != undefined) {
          return section;
        }
      }
    }
    console.error('no form / subform set');
  }

  GetTempTitle() {
    let titletemplate = this.CurrentForm().temptitle;
    let data = this.CurrentFormData();
    let retval = this.CurrentForm().title;
    if (!(angular.equals(data, {}))) {
      let paths = titletemplate.split(' ');
      for (let path of paths) {
        let value = DeepFind(data, path);
        if (value == undefined) {
          retval = undefined;
          break;
        } else {
          retval = retval.replace(path, value);
        }

      }
    }

    return retval;
  }

  CurrentSections() {
    if (this.currentSubform != undefined) {
      return this.currentSubform.forms;
    }
    return undefined;
  }

  CurrentSubform() {
    return this.currentSubform;
  }

  CurrentForm() {
    return this.currentForm;
  }

  ClearCurrentFormData() {
    return this.ClearFormData(this.CurrentForm().title);
  }

  Submit(urlsuffix) {
    let self = this;
    let currenttitle = this.currentForm.title;
    let formdata = this.FormData(this.currentForm.title);
    let suffix = urlsuffix || 'create';
    let url = [this.currentForm.route, suffix].join('/');
    return this.apisrv.Single(url, formdata).then(function (data) {
      self.UpdateFormData(currenttitle, data);
      return self.FormData(currenttitle);
    });
  }

  FetchForms() {
    var self = this;
    let defer = {
      mod: this.q.defer(),
      sect: this.q.defer()
    };

    for (let type of ['mod', 'sect']) {
      if (this.forms[type] == undefined) {
        defer[type].promise = this.http.get(this.endpoint[type]).then(function (res) {
          return self.forms[type] = res.data;
        }, function (res) {
          console.error('Could not find form at ' + self.endpoint[type]);
        });
      } else {
        defer[type].resolve(self.forms[type]);
      }
    }
    return this.q.all([defer['mod'].promise, defer['sect'].promise]);
  }
}

app.service('FormService', ['$http', '$uiRouter', '$q', 'APIService', FormServiceCtrl]);