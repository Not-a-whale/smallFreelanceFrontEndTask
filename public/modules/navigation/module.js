// this is the main controller for the whole app...
// mainly keeps track of the active state because i have no idea how to pass it between components when it changes without having to make a bunch of resolves...
class MainLayoutCtrl {
  constructor(scope){
    this.menulist = undefined;
    this.activeitem = undefined;
  }

  ActivateItem(item){
    this.activeitem = item;
  }
}


app.component("mainLayout", {
  controller: ['$scope', MainLayoutCtrl],
  templateUrl: "modules/navigation/template.html",
  bindings: {
    menulist: '<',
    activeitem: '<'
  }
});