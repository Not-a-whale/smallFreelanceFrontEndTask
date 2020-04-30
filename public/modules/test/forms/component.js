class DevFormsCtrl {
  constructor($http, $scope, $element, $compile, $q, APIService) {
    this.http = $http;
    this.scope = $scope;
    this.element = $element;
    this.compile = $compile;
    this.q = $q;
    this.api = APIService;

    this.forms = [];

    this.currentForm = undefined;

    this.data = {};
    this.section = {};
    this.currentElement = undefined;


    this.tablerequests = [];
    this.form_info = {};
    this.tableinfos = {};

    this.panel = 1;

    this.search = {
      search: 123,
      page: 1,
      rows: 1
    };
  }

  FetchAllAPIRoutes() {
    let self = this;
    this.http.get('/api/routes/all').then(function (result) {
      self.routes = result.data;
    });
  }

  FetchTableList() {
    let self = this;
    this.http.get('/prefetch/sources').then(function (result) {
      self.tablerequests = result.data;
    });
  }

  SetFormInfoRoot(table) {
    let self = this;
    this.FetchTableInfo(table).then(function (info) {
      self.form_info = info;
      self.CompileForm();
    });
  }

  TableInfoURL(tablename) {
    return '/prefetch/' + tablename;
  }
  /**
   *
   * @param {String} tablename
   * returns copy of table information so original stays clean
   */
  FetchTableInfo(tablename) {

    if (tablename in this.tableinfos) {
      let deferred = this.q.defer();

      deferred.resolve(CloneObj(this.tableinfos[tablename]));
      return deferred.promise;

    } else {
      let self = this;

      return this.http.get(this.TableInfoURL(tablename)).then(function (result) {

        self.tableinfos[tablename] = result.data;
        return CloneObj(result.data);

      });
    }
  }

  AddTableInfo(tablename, addhere) {
    if ('form_info' in addhere) {
      return;
    }
    let self = this;
    this.FetchTableInfo(tablename).then(function (info) {
      addhere.form_info = info;
      self.CompileForm();
    });
  }

  CompileForm() {
    let formroot = angular.element(document.getElementById('form'));

    let objpath = "data";
    let newtemplate = this.BuildTemplateForm(this.form_info, objpath, '$ctrl.form_info');
    newtemplate = '<div class="col">' + newtemplate + '</div>';
    let newscope = this.scope.$new();
    if (this.currentElement != undefined) {
      this.currentElement.remove();
    }
    this.currentElement = this.compile(newtemplate)(newscope);
    formroot.append(this.currentElement);
    this.RebuildHTMLTemplate();
  }

  ColumnIsRequired(column) {
    return column.is_nullable == 0 && !('default_value' in column);
  }

  BuildAttrs(attrs) {
    return attrs.map(x => x.name + '="' + x.value + '"').join(' ');
  }
  BuildComponent(table, column, objpath) {

    let attrs = [];

    let component_type = 'ui-input';
    switch (column.data_type) {
      case 'enum':
        component_type = 'ui-select';
        attrs.push({
          name: 'table',
          value: table
        });

        attrs.push({
          name: 'column',
          value: column.name
        });
        break;
      case 'datetime':
      case 'date':
        component_type = 'ui-date';
        break;
      case 'tinyint':
        component_type = 'ui-checkbox';
    }

    attrs.push({
      name: 'label',
      value: column.name
    });
    attrs.push({
      name: 'data',
      value: ['$ctrl', objpath, column.name].join('.')
    });

    if (this.ColumnIsRequired(column)) {
      attrs.push({
        name: 'required',
        value: 1
      });
    }

    let attrs_str = this.BuildAttrs(attrs);
    let template = '';
    template += '<' + [component_type, attrs_str].join(' ') + '></' + component_type + '>';
    return template;
  }

  WrapSection(form_info, objpath, inner_template) {
    let template = '<div style="display: flex">'
    template += '<div>' + form_info.resource.table + '</div>';
    let toggle_attrs = [];
    toggle_attrs.push({
      name: 'ng-click',
      value: "$ctrl.ToggleSection('" + objpath + "')"
    });
    toggle_attrs.push({
      name: 'class',
      value: "btn btn-danger"
    });

    let remove_attrs = [];
    remove_attrs.push({
      name: 'ng-click',
      value: "$ctrl.RemoveSection('" + objpath + "')"
    });

    remove_attrs.push({
      name: 'class',
      value: "btn btn-danger"
    });

    template += '<button ' + this.BuildAttrs(toggle_attrs) + '>Toggle Section</button>';
    template += '<button ' + this.BuildAttrs(remove_attrs) + '>Remove</button>';
    template += '</div>';
    template += '<div class="section" ng-show="$ctrl.section[\'' + objpath + '\'].active">';
    template += inner_template;
    template += '</div>';
    return template;
  }
  BuildTemplateForm(form_info, objpath, formpath) {
    let template = '';

    template += '<div class="form-section">';

    let template_inner = '';
    for (let column of form_info.columns) {
      if (column.is_primary || column.is_foreign_key) {
        continue;
      }
      let component = this.BuildComponent(form_info.resource.name, column, objpath);
      //TODO add control to remove individual component
      template_inner += component;
    }

    this.section[objpath] = {
      active: true,
      template: template_inner
    };
    template += this.WrapSection(form_info, objpath, template_inner);


    if ('related' in form_info) {
      let display_str = '$ctrl.' + formpath + '.related.display';
      template += '<div><div ng-click="' + display_str + ' = !' + display_str + '">relationships:</div>';
      for (let reltype in form_info.related) {

        template += '<div ng-show="' + display_str + '== 1">' + reltype;
        let index = 0;
        for (let rel of form_info.related[reltype]) {
          let formpath_related = formpath + '.related.' + reltype + '[' + index + ']';
          template += '<button ng-click="$ctrl.AddTableInfo(\'' + rel.source + '\',' + formpath_related + ')" >' + rel.relationship + '</button>';
          if ('form_info' in rel) {
            template += this.BuildTemplateForm(rel.form_info, [objpath, rel.relationship].join('.'), [formpath_related, 'form_info'].join('.'));
          }
          index++;
        }
        template += '</div>';
      }
      template += '</div>';
    }
    template += '</div>';
    return template;
  }

  RebuildHTMLTemplate() {
    let template = ''; //<form id="{{$ctrl.formid}}" ng-submit="$ctrl.onSubmit()">
    for (let key in this.section) {
      if (this.section[key].active) {
        template += this.section[key].template;
      }
    }
    // template += '<button type="submit" hidden></button>'
    // template += '</form>';
    this.template = template;
  }


  /**
   * DEPRECATED
   * @param {*} route
   */
  // _FetchFile(route) {
  //   let self = this;
  //   this.http.get(route).then(function (res) {
  //     return res.data;
  //   }).then(function (jsondata) {
  //     self.currentForm = jsondata;
  //     let formroot = angular.element(document.getElementById('form'));
  //     let objpath = 'formData';
  //     let newtemplate = self.BuildTemplateForm(jsondata.structure, objpath);
  //     newtemplate = '<div class="col">' + newtemplate + '</div>';
  //     let newscope = self.scope.$new();
  //     if (self.currentElement != undefined) {
  //       self.currentElement.remove();
  //     }
  //     self.currentElement = self.compile(newtemplate)(newscope);
  //     formroot.append(self.currentElement);
  //     self.RebuildHTMLTemplate();
  //   });
  // }

  RemoveSection(section) {
    if (section == 'data') {
      alert("Can't remove the root! Change it instead.");
      return;
    }

    let parts = section.split('.');
    parts.splice(0, 1);
    let current = this.form_info;
    let index = 0;
    for (let part of parts) {
      let found = false;
      for (let reltype in current.related) {
        found = current.related[reltype].find(x => x.relationship === part);
        if (found) {
          break;
        }
      }
      if (!found) {
        alert("Can't remove the section. Unknown section.");
        return;
      }
      if (index == parts.length - 1) {
        delete found.form_info;
        delete this.section[section];
        break;
      } else {
        if ('form_info' in found) {
          current = found.form_info;
        }
      }

      index++;
    }

    this.CompileForm();
  }
  ToggleSection(section) {
    this.section[section].active = !this.section[section].active;
    this.RebuildHTMLTemplate();
  }

  CopyToClipboard() {
    let copyboard = document.getElementById('copyboard');
    copyboard.select();
    copyboard.setSelectionRange(0, 99999);
    document.execCommand('copy');
  }

  SearchObj() {
    return {
      search: [],
      orderby: [],
      page: this.search.page,
      rows: this.search.rows
    };
  }

  Search() {
    this.Submit(this.route + '/search', this.SearchObj());
  }
  Create() {
    this.Submit(this.route + '/create');
  }

  Update() {
    this.Submit(this.route + '/update');
  }

  Delete() {
    this.Submit(this.route + '/delete');
  }

  Submit(url, data) {
    //TODO add the APIService to handle the requests/responses
    let self = this;
    let route = url || this.route;
    this.api.Request('post', route, data || this.data).then(function (result) {
      if (result instanceof ErrorObj) {
        alert(result.ErrorMessage());
      } else {
        if (Array.isArray(result)) {
          result = result[0];
        }
        self.data = result;
      }
    });
  }



  FetchForms() {
    let self = this;
    this.http.get('/api/TestForms').then(function (res) {
      self.forms = res.data;
    });
  }

  Formatted(data, depth) {
    if (depth == undefined) {
      depth = 0;
    }
    let formatted = '';
    let base_indent = "  ".repeat(depth * 2);

    if (typeof data === 'object') {
      if (data == null) {
        return "null";
      } else if (Array.isArray(data)) {

        formatted += "[";
        for (let element of data) {
          formatted += this.Formatted(element, depth + 1);
        }
        formatted += "]";
      } else {
        formatted += "{\n";

        let pairs = [];
        for (let key of Object.keys(data).sort((a, b) => a.toLowerCase().localeCompare(b.toLowerCase()))) {
          pairs.push(base_indent + '  "' + key + '" : ' + this.Formatted(data[key], depth + 1));
        }
        formatted += pairs.join(',\n') + '\n';

        formatted += base_indent + "}";
      }

    } else if (typeof data === 'string') {
      return '"' + data + '"';
    } else if (typeof data === 'number') {
      return data;
    }

    return formatted;
  }

  $onInit() {
    this.FetchTableList();
    this.FetchForms();
    this.FetchAllAPIRoutes();
  }
}

app.component('devForms', {
  templateUrl: 'modules/test/forms/template.html',
  controller: DevFormsCtrl
});