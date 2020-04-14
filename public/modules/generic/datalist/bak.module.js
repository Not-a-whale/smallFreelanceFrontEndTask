class GenericDatalistCtrl extends GenericSelectCtrl {
  constructor(getid, scope, http, timeout) {
    super(getid, scope, http);
    this.listid = getid();
    this.timeout = timeout;
    this.searchcall = undefined;
    this.typed = undefined;
  }

  $onChanges(changes) {
    if ('typed' in changes || 'value' in changes) {
      this.Reset();
      this.Validate(this.typed);
    }
  }

  Reset() {
    this.Search();
    this.FindSelected(this.value);
  }

  Validate(value) {
    if (value == undefined) {
      value = this.typed;
    }

    let valid = false;
    if (value == undefined || value == '') {
      valid = true;
    }
    var self = this;

    for (let option of this.options) {
      if (option[self.keyname] === value) {
        this.showValue = option;
        valid = true;
        break;
      }
    }
    this.valid = valid;
    return valid;
  }

  BuildConfig() {
    var config = {
      "params": {
        "q": this.typed
      }
    };
    return config;
  }

  Search() {
    this.timeout.cancel(this.searchcall);
    let self = this;
    this.searchcall = this.timeout(
      function () {
        self.FetchOptions(self.BuildConfig());
      }, 300);
  }
}

var datalist_bindings = {
  value: '<?',
  options: '<?', // list of options to bind when needed
  typed: '<?',
  label: '@?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?',
  url: '@?',
  optionsname: '@?', // the attribute/key to use to grab the list of options from response
  keyname: '@?', // the attribute/key to use to display the options in the select
  valname: '@?', // the attribute/key to use to select the option
  disablename: '@?', // the attribute/key to use to determine if option is disabled
  groupname: '@?', // the attribute/key to use to group options
  onUpdate: '&?'
};

app.component('genericDatalist', {
  templateUrl: 'modules/generic/datalist/default.html',
  controller: ['getid', '$scope', '$http', '$timeout', GenericDatalistCtrl],
  bindings: datalist_bindings
});

/* TODO: deprecated, left for instructional purposes */
app.directive('datalistValidate', function () {
  return {
    require: 'ngModel',
    restrict: 'A',
    link: function (scope, element, attrs, model) {
      var ctrl = scope.$ctrl;
      model.$asyncValidators.datalistValidate = function (modelValue, viewValue) {
        return ctrl.http.get(ctrl.url, ctrl.BuildConfig()).then(
          function (res) {
            if ('DATA' in res.data) {
              let DATA = res.data.DATA;
              if (ctrl.optionsname in DATA) {
                let options = DATA[ctrl.optionsname];
                if (options.length > 0) {
                  if (ctrl.valname in options[0]) {
                    if (ctrl.keyname in options[0]) {
                      let found = false;
                      options.forEach(option => {
                        if (option[ctrl.keyname] == viewValue) {
                          model.$setValidity('invalid', true);
                          found = true;
                          return;
                        }
                      });
                      if (found) {
                        return true;
                      }
                    }
                  }
                }
              }
            }
            console.error("Could not find " + viewValue);
            return $q.reject('Could not find ' + viewValue);
          },
          function (res) {
            return $q.reject();
          }
        );

      };

      /* reading value from DOM -> undefined is invalid*/
      model.$parsers.unshift(function (value) {
        model.$setValidity('invalid', ctrl.Validate(value));
        return value;
      });

      /* model value changes */
      model.$formatters.unshift(function (value) {
        model.$setValidity('invalid', ctrl.Validate(value));
        return value;
      });
    }
  };
});