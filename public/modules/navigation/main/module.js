class NavLayoutCtrl {
  constructor(scope){
    this.scope = scope;
    this.menulist = undefined;
  }

  ActivateItem(item){
    this.onActivateItem({item: item});
  }
}

app.component("navLayout", {
  controller: ["$scope", NavLayoutCtrl],
  bindings: {
    menulist: '<',
    onActivateItem: '&'
  },
  templateUrl: "modules/navigation/main/template.html"
});