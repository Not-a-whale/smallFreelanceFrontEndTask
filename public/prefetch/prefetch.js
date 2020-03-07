var app = angular.module("prefetch", []);
app.controller('MainCtrl', function($scope, $http) {

  $scope.selection = '';
  $scope.feature = null;
  $scope.route = null;

  $scope.$on('MenuClick', function (event, args) {
    $scope.$broadcast('newResource', args);
    $scope.selection = args.resourse;
  });

  $scope.FinishUp=function() {
    let message = {
      "toplevel": $scope.selection,
      "feature" : $scope.feature,
      "route"   : $scope.route,
    };
    $scope.$broadcast('finishUp', message );
  };

});

function HideShow(item) {
  for (var sitemi=0;sitemi<item.childNodes.length;sitemi++) {
    var sitem = item.childNodes[sitemi];
    if (sitem.nodeName=="UL" && item.nodeName=="LI") {
      sitem.style.display = sitem.style.display == 'none' ? 'block' : 'none';
    }
  }
}
