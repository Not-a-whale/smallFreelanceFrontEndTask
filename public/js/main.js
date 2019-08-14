var app = angular.module("tms", ["ui.router"]);

app.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise("/");

  var navbar = {
    templateUrl: "/modules/navigation/main/main_nav.html"//,
    //controller: ['$scope', '$http', NavbarCtrl]
  };

  $stateProvider.state('tmsapp', {
    template: '<div class="global-container" ui-view="main"><div/>'
  });

  $stateProvider.state("tmsapp.main", {
    url: "/",
    views: {
      main: {
        templateUrl: "modules/navigation/main.html"
      },
      "content@tmsapp.main": {
        templateUrl: "modules/temp/testpage.html"
      },
      "navbar@tmsapp.main": navbar,
      "topnav@tmsapp.main": {
        templateUrl: "modules/navigation/top/top_nav.html"
      }

    }
  }).state('tmsapp.main.loads', {
    views: {
      main: {
        templateUrl: 'modules/navigation/main.html'
      },
      "content@tmsapp.main": {
        templateUrl: "modules/invoice/cheque.html"
      }
    }
  }).state('tmsapp.main.test', {
    views: {
      main: {
        templateUrl: 'modules/navigation/main.html'
      },
      "content@tmsapp.main": navbar
    }
  }).state('invoice', {
    templateUrl: 'modules/invoice/cheque.html'
  });
}]);


var select_bindings = {
  label: '@?',
  sample: '@?',
  value: '=?',
  errmsg: '@?',
  required: '@?',
  disabled: '@?'
};

var input_bindings = {
  label: '@?',
  name: '@?',
  value: '=?',
  input_class: '@?',
  type: '@?',
  errmsg: '@?',
  required: '@?',
  pattern: '@?',
  type: '@?',
  disabled: '@?',
  placeholder: '@?'
};


app.factory('getid', function () {
  var id = Math.floor(Math.random() * 100000);

  return function () {
    let newid = ++id;
    return 'I' + newid;
  };
});