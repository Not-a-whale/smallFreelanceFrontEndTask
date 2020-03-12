class DevFormsCtrl {
  constructor(http, scope, element, compile) {
    this.http = http;
    this.scope = scope;
    this.element = element;
    this.compile = compile;

    this.forms = [];

    this.currentForm = undefined;

    this.formData = {};
  }


  FetchFile(route) {
    let self = this;
    this.http.get(route).then(function (res) {
      return res.data;
    }).then(function (jsondata) {
      self.currentForm = jsondata;
      let formroot = angular.element(document.getElementById('form'));

      let objpath = 'formData';
      self.template = self.BuildTemplateForm(jsondata.structure, objpath);
      let newscope = self.scope.$new();
      let newelement = self.compile(self.template)(newscope);

      formroot.append(newelement);
    });

  }

  BuildTemplateForm(obj, objpath) {
    let template = '';

    for (let attrname in obj) {

      let attrval = obj[attrname];
      if (Array.isArray(attrval)) {
        let index = 0;
        for (let arrobj of attrval) {
          template += this.BuildTemplateForm(arrobj, objpath + '.' + attrname + '[' + index++ + ']');
        }
      } else if (typeof attrval == 'object') {
        template += this.BuildTemplateForm(attrval, objpath + '.' + attrname);
      } else {
        template += '<simple-input value="$ctrl.' + objpath + '.' + attrname + '" label="' + attrname + '"></simple-input>';
      }
    }
    return template;
  }

  Submit() {
    //TODO add the APIService to handle the requests/responses
    let self = this;
    let req = {
      POST: this.formData,
      ERROR: null,
      DATA: null
    };

    this.http.post(this.currentForm.route, req).then(function (res) {
      let singledata = res.data.DATA[0];
      self.UpdateFormData(currenttitle, singledata);
    }, function (res) {
      console.error(res)
    });
  }

  FetchForms() {
    let self = this;
    this.http.get('/api/TestForms').then(function (res) {
      self.forms = res.data;
    });
  }


  $onInit() {
    this.FetchForms();
  }
}

app.component('devForms', {
  templateUrl: 'modules/test/forms/template.html',
  controller: ['$http', '$scope', '$element', '$compile', DevFormsCtrl]
});