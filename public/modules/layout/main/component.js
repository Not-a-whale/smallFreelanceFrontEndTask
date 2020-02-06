// this is the main controller for the whole app...
// mainly keeps track of the active state because i have no idea how to pass it between components when it changes without having to make a bunch of resolves...
// class MainLayoutCtrl {
//   constructor(rootscope, pgsrv){
//     this.Page = pgsrv;
//     this.menulist = undefined;
//     this.activeitem = undefined;
//     this.expanded = true;
//   }

//   ActivateItem(item){
//     this.activeitem = item;
//   }

//   Collapsed(){
//     return !this.Expanded();
//   }

//   Expanded(){
//     return this.expanded;
//   }

//   Toggle(){
//     console.log("toggling");
//     this.expanded = !this.expanded;
//   }
// }


app.component("mainLayout2", {
  templateUrl: "modules/layout/main/template.html",
  // controller: ['$rootScope', 'PageService', MainLayoutCtrl],
  // controllerAs: 'mainctrl',
  bindings: {
    menulist: '<',
    activeitem: '<'
  }
});