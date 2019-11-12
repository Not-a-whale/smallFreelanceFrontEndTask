var app = angular.module("tms", ["ui.router", "ngAnimate", "duScroll", "angularFileUpload"]);

app.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise("tmsapp/main/dashboard");

  for (let [key, value] of Object.entries(configstates)) {
    $stateProvider.state(key, value);
  }
}]);

app.value('duScrollSpyWait', 500);
app.value('duScrollBottomSpy', true);

app.run(['$transitions', function (trans) {

  trans.onSuccess({}, function (trans) {
    //console.log(trans.from().name);
  });


}]);


app.factory('getid', function () {
  var id = Math.floor(Math.random() * 100000);

  return function () {
    let newid = ++id;
    return 'I' + newid;
  };
});


class StateManager {
  constructor(scope) {

    this.states = [];
    this.maxLength = 20;
    this.rootScope = scope;
    this.rootScope.$on('$stateChangeSuccess', function (event, to, toParams, from, fromParams) {
      console.log(from);
    });
  }

  SetMaxLength(newlength) {
    this.maxLengtht = newlegth;
  }

  Prev() {
    if (this.states.length > 1) {
      return this.states[1];
    }
    return null;
  }

  Current() {
    return this.states[0];
  }

  AddState(state) {
    if (this.states.length > this.maxLength) {
      let splice_amount = this.states.length - this.maxLength;
      this.states.splice(this.maxLength - 1, splice_amount);
    }

    this.states.unshift(state);
  }
}

app.service('statemanager', ['$rootScope', StateManager]);

app.filter('menuitems', function () {
  return function (items, position) {
    if (!items) {
      return items;
    }
    switch (position) {
      case "mainnav":
        return items.filter(function (element, index, array) {
          return element.Target == "mainnav" && element.Enabled;
        });
      case "topnav":
        return items.filter(function (element, index, array) {
          return element.Target == "topnav" && element.Enabled;;
        });
      default:
        return items;
    }
  };
});

app.filter('enabled', function () {
  return function (list) {
    return list.filter(function(item, index, array){
      if ('enabled' in item) {
        return item.enabled == true;
      } else if ('disabled' in item) {
        return item.disabled == false;
      }
    });
  };
});

app.filter('disabled', function () {
  return function (list) {
    return list.filter(function(item, index, array){
      if ('enabled' in item) {
        return item.enabled == false;
      } else if ('disabled' in item) {
        return item.disabled == true;
      }
    });

  }
});

function CloneObj(x) {
  return JSON.parse(JSON.stringify(x));
}