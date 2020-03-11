function builderCtrl($scope, $http) {

  $scope.rsrs = null;
  $scope.name = null;

  $scope.$on('newResource', function (event, args) {
    let url = '/prefetch/'  + args.resourse;
    $scope.name = args.resourse;

    $http.get(url).then(function(response) {
      $scope.rsrs = response.data;
    });

    $scope.CheckSubset = function(item) {
      if( item.subset && item.checked < 1 ) {
        delete item.subset;
      } else {
        let url = '/prefetch/'  + item.source;
        $http.get(url).then(function(response) {
          item.subset = response.data;
        });
      }
    };
  });

  $scope.$on('finishUp',function (event, args) {
      let record = {
        "TopLevel"   : args.toplevel,
        "Route"      : args.route,
        "Feature"    : args.feature,
        "GitComment" : args.git,
        "Selected"   : $scope.rsrs,
      };

      $http.post('/prefetch/post_selections',record);
    }
  );
}

app.component(
  'prefetchBuilder', {
    templateUrl: '/prefetch/modules/builder/template.html',
    controller: builderCtrl,
    bindings: {
      rsrs: '=',
      name: '<',
    }
  }
);
