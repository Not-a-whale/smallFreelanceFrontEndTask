function PersonDetailCtrl() {
    var ctrl = this;
}

function PersonFormCtrl($http) {
    var ctrl = this;
    ctrl.rec = {
        BrnchAddress: {
            State: {}
        },
        BrnchPhone: {

        },
        BrnchFax: {

        }
    };


    ctrl.console = function () {
        console.log(ctrl.rec);
    };
    ctrl.submit = function () {
        $http.post('/dancer/person/new', ctrl.rec).then(function (res) {
            alert(res.data);
            console.log(res.status)
        }, function (res) {
            console.log(res.status)
        })
    };
}


angular.module('myApp').component('personDetail', {
    templateUrl: '/dancer/personDetail.html',
    controller: PersonDetailCtrl,
    bindings: {
        person: '<'
    }
});

angular.module('myApp').component('personForm', {
    templateUrl: '/dancer/personForm.html',
    controller: ['$http', PersonFormCtrl]
});