app.component("mainMenu", {
  controller: ['$scope', '$http', 'getid', MenuTwoTierCtrl],
  templateUrl: '/modules/navigation/main/menu/menu.html',
  bindings: {
    url: '@?'
  }
});