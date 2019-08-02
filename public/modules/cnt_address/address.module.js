
angular.module('myApp').factory('state_options', ['$http', function ($http) {
    var self = this;
    self.states = [];
    self.load = function() {
        $http.get('/dancer/state/options').then(function (res) {

            self.states = res.data.map(function (x) {
                x['str'] = JSON.stringify(x);
                console.log(x);
                return x;
            });

            console.log(self.states);
            //other.options = self.states;
        }, function (res) {
            alert(res.message);
        });
    };
    self.load();

    return function () {
        if (self.states.length == 0) {
            self.load();
        }
        return self.states;
    };
}]);


function AddressDetailCtrl() {
    var ctrl = this;
}

angular.module('myApp').component('addressDetail', {
    templateUrl: '/dancer/addressDetail.html',
    controller: AddressDetailCtrl,
    bindings: {
        address: '<'
    }
});

angular.module('myApp').component('addressPrint', {
    templateUrl: '/dancer/addressPrint.html',
    controller: AddressDetailCtrl,
    bindings: {
        address: '<'
    }
});

function AddressFormCtrl() {
    var ctrl = this;
}

angular.module('myApp').component('addressForm', {
    templateUrl: '/dancer/addressForm.html',
    controller: AddressFormCtrl,
    bindings: {
        address: '<'
    }
});

function StateDetailCtrl() {
    var ctrl = this;
}


angular.module('myApp').component('stateDetail', {
    template: `{{ $ctrl.state.FullName }}, {{ $ctrl.state.Country}}`,
    controller: StateDetailCtrl,
    bindings: {
        state: '<'
    }
});

angular.module('myApp').component('stateAddress', {
    template: `{{ $ctrl.state.ShortName}}, {{ $ctrl.state.Country }}`,
    controller: StateDetailCtrl,
    bindings: {
        state: '<'
    }
});


function StateFormCtrl($http) {
    var ctrl = this;
    ctrl.options = [];

    ctrl.load = function() {
        $http.get('/dancer/state/options').then(function (res) {
            ctrl.options = res.data.map(function (x) {
                x['str'] = JSON.stringify(x);
                return x;
            });
        }, function (res) {
            alert(res.message);
        });
    };

    ctrl.$onInit = function () {
        ctrl.load();
    };

}

angular.module('myApp').component('stateForm', {
    template: `<select ng-model="$ctrl.state"><option ng-repeat="s in $ctrl.options" ng-value="{{s.str}}">{{s.FullName}}</option></select>`,
    controller: ['$http', StateFormCtrl],
    bindings: {
        state: '='
    }
});
