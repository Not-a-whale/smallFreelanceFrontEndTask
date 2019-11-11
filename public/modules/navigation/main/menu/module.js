class MainMenuCtrl {
  constructor(getid, scope) {
    this.id = getid();
    this.menulist;
    this.scope = scope;
  }

  SetActive(item) {
    this.onActivateItem({item: item});
  }
}

app.component("mainMenu", {
  controller: [ 'getid', '$scope', MainMenuCtrl],
  controllerAs: "mainMenuCtrl",
  templateUrl: 'modules/navigation/main/menu/default.html',
  bindings: {
    menulist: '<',
    onActivateItem: '&'
  }
});

app.controller("collapsable", function () {
  var self = this;
  self.collapsed = false;
});