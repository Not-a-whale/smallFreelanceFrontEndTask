function BusinessDetailCtrl() {
    var ctrl = this;
}

function BusinessFormCtrl($http) {
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
        $http.post('/dancer/business/new', ctrl.rec).then(function (res) {
            alert(res.data);
            console.log(res.status)
        }, function (res) {
            console.log(res.status)
        })
    };

    // ctrl.options = [];
    // ctrl.LoadStateOptions = function () {
    //     $http.get('/dancer/state/options').then(function (res) {
    //         ctrl.options = res.data.map(function (x) {
    //             x['str'] = JSON.stringify(x);
    //             console.log(x);
    //             return x;
    //         });
    //         console.log(ctrl.options);
    //     }, function (res) {
    //         console.log(res.status);
    //     });
    // }
    // ctrl.LoadStateOptions();
}


angular.module('myApp').component('businessDetail', {
    templateUrl: '/dancer/businessDetail.html',
    controller: BusinessDetailCtrl,
    bindings: {
        business: '<'
    }
});

angular.module('myApp').component('businessForm', {
    templateUrl: '/dancer/businessForm.html',
    controller: ['$http', BusinessFormCtrl]
});

function BusinessListCtrl($http, $element, $attrs) {
    var ctrl = this;
    ctrl.list = [];
    ctrl.LoadData = function () {
        $http.get('/dancer/business/data').then(function (res) {

            ctrl.list = res.data;
            console.log(ctrl.list);
        }, function (res) {
            alert(res.message);
        });
    };
    ctrl.$onInit = ctrl.LoadData;
    ctrl.AddMore = function () {
        ctrl.list.push({
            OfficeName: 'Hello'
        });
        console.log(ctrl.list);
    }
}


angular.module('myApp').component('businessList', {
    templateUrl: '/dancer/businessList.html',
    controller: ['$http', BusinessListCtrl]
});