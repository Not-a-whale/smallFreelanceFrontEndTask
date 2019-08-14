app.component("topNavMenu", {
  controller: ['$scope', '$http', 'getid', 'MenuOneTierCtrl'],
  templateUrl: '/',
  bindings: {
    url: '@?'
  }
});