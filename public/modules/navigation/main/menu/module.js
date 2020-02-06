class MainMenuCtrl {
  constructor(scope, state, mainnavsrv) {
    this.mainnavsrv = mainnavsrv;
    this.menulist;
    this.scope = scope;
    this.state = state;
  }

  SetActive(item) {
    this.onActivateItem({item: item});
  }

  $onInit(){
    this.menu = this.mainnavsrv.GetMainNavMenu();
  }
}


app.controller('MainMenuCtrl',['$scope', '$state','MainNavService', MainMenuCtrl] );

app.component("mainMenu", {
  controller: 'MainMenuCtrl',
  controllerAs: "mainMenuCtrl",
  templateUrl: 'modules/navigation/main/menu/default.html',
  bindings: {
    menulist: '<',
    onActivateItem: '&'
  }
});

app.component("mainNavMenu2", {
  controller: 'MainMenuCtrl',
  templateUrl: 'modules/navigation/main/menu/template.html',
  bindings: {
    menu: '<'
  }
});

app.controller("collapsable", function () {
  var self = this;
  self.collapsed = false;
});