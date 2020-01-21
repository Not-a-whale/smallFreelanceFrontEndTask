function ListOfSources($scope, $http) {
  $http.get("/prefetch/sources")
  .then(function(response) {
    $scope.list= response.data;
  });

  $scope.Notify = function(msg) {
    $scope.$emit('MenuClick', { resourse: msg});
  };
}

app.component(
  'srcList', {
    templateUrl: '/prefetch/modules/sources/template.html',
    controller: ListOfSources,
    bindings: {
      list: '='
    }
  }
);
