let timeregex = new RegExp(/^\d{4}-\d{2}-\d{2}$/);
app.directive('uiDateTime', function () {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function ($scope, $element, $attrs, ngModel) {

      let parserfun = function (input) {
        let newdate = new Date(input);
        ngModel.$modelValue = newdate;
        return newdate;
      };

      ngModel.$formatters.push(function (input) {
        return parserfun(input);
      });
    }
  };
});


app.component('uiDate', {
  templateUrl: 'modules/ui/input/date/template.html',
  bindings: {
    data: '=?',
    label: '@?',
    required: '@?'
  }
});