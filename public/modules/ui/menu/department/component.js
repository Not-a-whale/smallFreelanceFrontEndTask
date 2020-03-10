class MenuMainNavDepartmentCtrl {
  constructor(pagesrv){
    this.pagesrv = pagesrv;
  }

  MenuTitle(){
    return this.pagesrv.CurrentDepartment().title;
  }

  Pages() {
    return this.pagesrv.CurrentDepartmentPages();
  }

  SetPage(pagename){
    this.pagesrv.SetPage(pagename);
  }
}

app.component("menuMainNavDepartment", {
  templateUrl: "modules/ui/menu/department/template.html",
  controller: ["PageService", MenuMainNavDepartmentCtrl]
});