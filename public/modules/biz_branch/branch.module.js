function BranchCtrl() {
    var ctrl = this;
}

function BranchFormCtrl() {
    var ctrl = this;
}

angular.module('myApp').component('branchDetail', {
    templateUrl: '/dancer/branchDetail.html',
    controller: BranchCtrl,
    bindings: {
        branch: '<'
    }
});


angular.module('myApp').component('branchForm', {
    templateUrl: '/dancer/branchForm.html',
    controller: BranchFormCtrl,
    bindings: {
        branch: '<'
    }
});