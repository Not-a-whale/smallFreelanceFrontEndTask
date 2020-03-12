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
      let template = self.template.split(/<simple-input/g);
      console.log(template);
      let index = 0;
      let accumulator = '';
      let newtemplate = '';
      for (let part of template) {
        if (part == '') {
          continue;
        }
        accumulator += '<simple-input' + part;
        if (++index > 3) {
          newtemplate += '<div class="row">' + accumulator + '</div>'
          accumulator = '';
          index = 0;
        }
      }
      newtemplate = '<div class="col">' + newtemplate + '</div>';

      let newscope = self.scope.$new();
      let newelement = self.compile(newtemplate)(newscope);

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
        let label = objpath.split('.');
        label.splice(0, 1);
        label = label.join(' ');
        template += '<simple-input value="$ctrl.' + objpath + '.' + attrname + '" label="' + label + ' ' + attrname + '"></simple-input>';

      }
    }
    return template;
  }

  Create() {
    this.Submit(this.currentForm.route + '/create');
  }

  Update() {
    this.Submit(this.currentForm.route + '/update');
  }

  Delete() {
    this.Submit(this.currentForm.route + '/delete');
  }

  Submit(url) {
    //TODO add the APIService to handle the requests/responses
    let self = this;
    let req = {
      POST: this.formData,
      ERROR: null,
      DATA: null
    };

    let requrl = url || this.currentForm.route;

    this.http.post(requrl, req).then(function (res) {
      if (res.data.ERROR != undefined) {
        console.error(res.data.ERROR);
      }
      let singledata = res.data.DATA[0];
      self.formData = singledata;
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