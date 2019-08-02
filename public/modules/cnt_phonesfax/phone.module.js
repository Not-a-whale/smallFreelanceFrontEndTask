function PhoneCtrl($http){
    var ctrl = this;

    ctrl.req = {
        POST: '',
        ERROR: '',
        ENV: ''
    };

    ctrl.post = function() {
        ctrl.req[POST] = ctrl.phone;
        $http.post('/dancer/phone/new', ctrl.req ).then(function (res) {
            console.log(res.data);
        }, function (res) {
            console.log(res.data);
        });
    };
}


function PhoneListCtrl($http){
    var ctrl = this;
    ctrl.headers = ['Id', 'Number','Extension','Features','Mobility','Notes'];
    ctrl.list = [];
    ctrl.LoadData = function () {
        $http.get('/dancer/phone/data').then(function (res) {

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

angular.module('tms').controller('PhoneListCtrl', ['$http', PhoneListCtrl]);

angular.module('tms').component('phoneList', {
    templateUrl: '/dancer/phoneList.html',
    controller: ['$http', PhoneListCtrl]
});

angular.module('tms').component('phoneDetail', {
    templateUrl: '/dancer/phoneDetail.html',
    controller: PhoneCtrl,
    bindings: {
        phone: '='
    }
});


angular.module('tms').component('phoneForm',{
    templateUrl: '/dancer/phoneForm.html',
    controller: ['$http', PhoneCtrl],
    bindings: {
        phone: '=',
        type: '@'
    }
});


angular.module('tms').component('genericInput',{
    templateUrl: '/dancer/genericInput.html',
    bindings: {
        phone: '=',
        label: '@',
        input_class: '@',
        form_class: '@'
    }
});
