app.directive('date', function () {

  return {
    restrict: 'A',
    require: 'ngModel',
    link: function (scope, element, attrs, model) {
      function dateparser(value) {
        if (value) {
          let month = value.getMonth() < 10 ? '0' + value.getMonth() : value.getMonth();
          let day = value.getDate() < 10 ? '0' + value.getDate() : value.getDate();
          let output = value.getFullYear() + '/' + month + '/' + day;
          return output;
        }
      }
      //model.$parsers.push(dateparser);
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