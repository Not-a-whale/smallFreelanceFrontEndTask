class MainNavbarCtrl {
  constructor(scope){
    this.scope = scope;
    this.menulist = undefined;
  }

  ActivateItem(item){
    this.onActivateItem({item: item});
  }
}

app.component("mainNavbar", {
  controller: ["$scope", MainNavbarCtrl],
  bindings: {
    menulist: '<',
    onActivateItem: '&',
    toggleMenu: '&'
  },
  templateUrl: "modules/navigation/main/template.html"
});