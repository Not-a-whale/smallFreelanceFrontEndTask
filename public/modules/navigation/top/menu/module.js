class TopNavMenuCtrl {
  constructor(scope) {
    this.scope = scope;
    this.activeitem = undefined;
  }
}

app.component("topNavMenu", {
  controller: ["$scope", TopNavMenuCtrl],
  templateUrl: 'modules/navigation/top/menu/default.html',
  bindings: {
    activeitem: '<'
  }
});