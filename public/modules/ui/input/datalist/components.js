class UIDatalistCrl {
  constructor(getid, apisrv, timeout) {
    this.listid = getid();
    this.apisrv = apisrv;
    this.timeout = timeout;
    this.searchcall = undefined;
    this.typed = undefined;
    this.options = [];

    this.page = 1;
    this.rows = 10;
    this.mapping_regex = /<<(.+?)>>/g;
    this.route = undefined;
    this.form = undefined;

  }

  $onChanges(changes) {
    if ('typed' in changes || 'data' in changes) {
      this.Reset();
      this.Validate(this.typed);
    }
  }

  Reset() {
    this.TimedSearch();
  }

  Validate(data) {
    if (data == undefined) {
      data = this.typed;
    }

    let valid = false;
    if (data == undefined || data == '') {
      valid = true;
      this.data = undefined;
    }

    for (let option of this.options) {
      if (option.display === data) {

        this.data = option.data;
        console.log('found the data');
        valid = true;
        break;
      }
    }
    this.valid = valid;
    return valid;
  }

  TimedSearch() {
    this.timeout.cancel(this.searchcall);
    let self = this;
    this.searchcall = this.timeout(
      function () {
        self.Search();
      }, 300);
  }

  Search() {
    if (this.url != undefined) {
      let self = this;
      return this.apisrv.List(this.url, this.BuildQuery()).then(function (data) {
        return data.map(function (x) {
          return self.Mapper(x);
        });
      }).then(function (data) {
        if (IsObj(data)) {
          self.options = data;
        }
      }).then(function () {
        self.Validate(self.typed);
      });
    } else {
      console.error('no url provided for search');
    }

  }

  Mapper(data) {
    // this mapper is doing job for backend
    let obj = {};
    obj.data = data;
    obj.id = DeepFind(data, this.dataid);
    let template = this.displaytemplate;
    let matches = template.matchAll(this.mapping_regex);
    for (let match of matches) {
      let path = match[1];
      let value = DeepFind(data, path);
      if (value != undefined && typeof value == 'string') {
        template = template.replace(new RegExp('<<' + path + '>>', 'g'), value);
      }
    }
    obj.display = template;
    return obj;
  }

  DataToTyped() {
    let obj = this.Mapper(this.data);
    this.options = [obj];
    this.Validate();
    this.typed = obj.display;
    return obj.display;
  }


  BuildQuery() {
    let searchlist = this.BuildSearchList();
    let orderbylist = this.BuildOrderByList();
    let query = {
      page: this.page,
      rows: this.rows,
      search: searchlist,
      orderby: orderbylist
    };
    return query;
  }

  BuildSearchList() {
    let fields = {};
    for (let fname of this.displayfields) {
      fields[fname] = this.typed;
    }
    return [fields];
  }

  BuildOrderByList() {
    let fields = [];
    for (let fname of this.displayfields) {
      let obj = {};
      obj[fname] = 'asc';
      fields.push(obj);
    }
    return fields;
  }

  NewProfile() {
    let res = this.form == undefined && this.route != undefined;
    return res;
  }

  NewForm() {
    let res = this.form != undefined;
    return res;
  }

  $onInit() {
    if (this.data != undefined && !angular.equals(this.data, {})) {
      this.DataToTyped();
    }
  }
}

app.controller('UIDatalistCtrl', ['getid', 'APIService', '$timeout', UIDatalistCrl]);
app.component('uiDatalist', {
  templateUrl: 'modules/ui/input/datalist/template.html',
  controller: 'UIDatalistCtrl',
  bindings: {
    data: '=?',
    options: '<?', // list of options to bind when needed
    label: '@?',
    required: '@?',
    url: '@',
    dataid: '@',
    displayfields: '<',
    displaytemplate: '@',
    route: '@?',
    form: '@?',
    name: '@?'
  }
});

app.component('uiDatalistConcrete', {
  templateUrl: function ($element, $attrs) {
    if ('type' in $attrs) {
      return 'modules/ui/input/datalist/types/' + $attrs.type + '.template.html';
    } else {
      return 'modules/ui/input/datalist/template.html';
    }
  },
  bindings: {
    data: '=?',
    options: '<?',
    required: '@?',
    label: '@?',
    form: '@?'
  }
});

class UISelectCtrl {
  constructor(getid, apisrv) {
    this.id = getid();
    this.apisrv = apisrv;
  }

  $onInit() {
    if (this.options == undefined) {
      let self = this;
      this.apisrv.Options(this.table, this.column).then(function (data) {
        if ('options' in data) {
          self.options = data.options;
          if (self.data == undefined) {
            self.data = data.options[0];
          }
        }
      });
    }
  }
}


app.component('uiSelect', {
  templateUrl: 'modules/ui/input/datalist/select.template.html',
  controller: ['getid', 'APIService', UISelectCtrl],
  bindings: {
    data: '=?',
    options: '<?', // list of options to bind when needed
    label: '@?',
    errmsg: '@?',
    required: '@?',
    table: '@?',
    column: '@?'
  }
});