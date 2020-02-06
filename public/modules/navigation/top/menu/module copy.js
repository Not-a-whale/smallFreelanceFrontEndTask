class TopNavMenuCtrl {
  constructor(scope, pgsrv) {
    this.Page = pgsrv;
    this.scope = scope;
    this.activeitem = undefined;
  }
}

app.component("topNavMenu", {
  controller: ["$scope", 'PageService', TopNavMenuCtrl],
  templateUrl: 'modules/navigation/top/menu/default.html',
  bindings: {
    activeitem: '<'
  }
});