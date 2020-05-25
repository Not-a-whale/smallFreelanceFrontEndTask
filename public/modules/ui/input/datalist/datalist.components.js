class DatalistOption {
  constructor(data, id, display) {
    this.data = data;
    this.id = id;
    this.display = display;
  }
}

class UIDatalistCtrl {
  constructor(APIService, getid, $timeout) {
    this.listid = getid();
    this.api = APIService;
    this.timeout = $timeout;
    this.searchcall = undefined;
    this.typed = undefined;
    this.options = [];

    this.page = 1;
    this.rows = 10;
    this.mapping_regex = /<<(.+?)>>/g;
    this.route = undefined;
    this.form = undefined;

    this.old_data = undefined;

  }

  $doCheck() {
    // sync up the typed or display part of the datalist and the data bound to datalist
    // this is purely for programatically changed data
    // propagate the data to typed variable

    if (this.typed === undefined) {
      this.typed = '';
    }

    if (!angular.equals(this.old_data, this.data)) {
      if (this.typed == '' && this.data != undefined && !angular.equals(this.data, {})) {
        this.DataToTyped();
      }
      // if data was cleared, have to clear typed as well
      if (this.data == undefined || angular.equals(this.data, {})) {
        if (this.typed != '') {
          // doCheck runs every digest cycle, only want to update the value once
          this.Clear();
        }
      }
      this.old_data = this.data;
    }
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
      data = this.typed; //typed is nothing first time around
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

  Clear() {
    this.ClearOptions();
    this.ClearData();
    this.ClearDisplay();
  }

  ClearOptions() {
    this.options = [];
  }

  ClearDisplay() {
    this.typed = '';
  }

  ClearData() {
    this.data = {};
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
    let self = this;
    let apiFunc = this.apiCall;
    let apiParams = this.apiParams || {};
    if (apiFunc != undefined) {
      // let selfquery = this.BuildQuery();
      // let concretequery = this.BuildConcreteQuery();
      apiParams.query = this.BuildQuery();

      return this.api.CallFunction(apiFunc, apiParams).then(function (data) {
        return data.map(function (x) {
          return self.Mapper(x);
        });
      }).then(function (data) {
        if (IsObj(data)) {
          self.options = data;
        }
      }).then(function () {
        self.Validate();
      });
    }
  }

  Mapper(data) {
    // this mapper is doing job for backend
    let id = DeepFind(data, this.dataid);
    let template = this.displaytemplate;
    let matches = template.matchAll(this.mapping_regex);
    for (let match of matches) {
      let path = match[1];
      let value = DeepFind(data, path);
      if (value != undefined && typeof value == 'string') {
        template = template.replace(new RegExp('<<' + path + '>>', 'g'), value);
      }
    }
    let display = template;
    return new DatalistOption(data, id, display);
  }

  DataToTyped() {
    let obj = this.Mapper(this.data);
    this.options = [obj];
    this.typed = obj.display;
    this.Validate();
    return obj.display;
  }


  BuildQuery() {
    let searchlist = this.BuildSearchList();
    let orderbylist = this.BuildOrderByList();
    let query = {};
    if (this.concreteCtrl != undefined) {
      //might want to do some logic here that is particular to only concreteCtrl
      if (this.concreteCtrl.query != undefined) {
        query = CloneObj(this.concreteCtrl.query);
      }
    }


    if (!('page' in query)) {
      query.page = this.page;
    }
    if (!('rows' in query)) {
      query.rows = this.rows;
    }
    if ('search' in query) {
      for (let item of searchlist) {
        query.search.push(item);
      }
    } else {
      query.search = searchlist;
    }

    if ('orderby' in query) {
      for (let item of orderbylist) {
        query.orderby.push(item);
      }
    } else {
      query.orderby = orderbylist;
    }
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
    return !this.NewForm() && this.route != undefined;
  }

  NewForm() {
    return this.form != undefined && this.form != '';
  }

  $onInit() {
    if (this.data != undefined && !angular.equals(this.data, {})) {
      this.DataToTyped();
    }
  }
}

app.component('uiDatalist', {
  templateUrl: 'modules/ui/input/datalist/ui-datalist.template.html',
  controller: UIDatalistCtrl,
  controllerAs: '$datalistctrl',
  bindings: {
    data: '=?',
    options: '<?', // list of options to bind when needed
    label: '@?',
    required: '@?',
    apiCall: '<?', // api function call string name
    apiParams: '<?', // api function params, obj mapping api params to values
    dataid: '@', // the "ID / Primary Key" of the data
    displayfields: '<', // the fields used to display in the dropdown
    displaytemplate: '@', // how to display the fields in the dropdown, must be enclosed by <<>>
    route: '@?', // go to a state when clicked on new button
    form: '@?', // the form to open when clicked on new button
  },
  require: {
    concreteCtrl: '?^uiDatalistConcrete'
  }
});

app.component('uiDatalistConcrete', {
  templateUrl: function ($element, $attrs) {
    if ('type' in $attrs) {
      return 'modules/ui/input/datalist/types/' + $attrs.type + '.ui-datalist.template.html';
    } else {
      return 'modules/ui/input/datalist/ui-datalist.template.html';
    }
  },
  bindings: {
    data: '=?', // the data from an external source
    options: '<?', // the options to display from external source
    required: '@?', // if input is required to be filled in
    label: '@?', // label to display
    form: '@?',
    newButton: '<?', // if the new button should be displayed
    query: '<?' //
  }
});

class UISelectCtrl {
  constructor(APIService, getid) {
    this.id = getid();
    this.api = APIService;
  }

  $onInit() {
    if (this.options == undefined) {
      let self = this;
      this.api.Options(this.table, this.column).then(function (data) {
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
  templateUrl: 'modules/ui/input/datalist/ui-select.template.html',
  controller: UISelectCtrl,
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