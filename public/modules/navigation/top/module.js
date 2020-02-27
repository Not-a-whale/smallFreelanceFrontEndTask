class TopNavbarCtrl {
  constructor(pagesrv) {
    this.pagesrv = pagesrv;
  }

  Departments(){
    return this.pagesrv.Departments();
  }

  SetDepartment(department){
    this.pagesrv.SetDepartment(department.title);
  }
}


app.component("topNavbar", {
  templateUrl: "modules/navigation/top/template.html",
  controller: ["PageService", TopNavbarCtrl],
});