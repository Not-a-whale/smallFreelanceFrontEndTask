class TopNavMenuCtrl {
  constructor(scope, pagesrv) {
    this.scope = scope;
    this.activeitem = undefined;
    this.Page = pagesrv;
  }
}

app.component("topNavMenu", {
  controller: ["$scope", 'PageService', TopNavMenuCtrl],
  templateUrl: 'modules/navigation/top/menu/default.html',
  bindings: {
    activeitem: '<'
  }
});


app.component("topNavMenu2", {
  controller: ['$scope', 'PageService', TopNavMenuCtrl],
  templateUrl: 'modules/navigation/top/menu/template.html'
});