class MenuMainNavDefaultCtrl {
  constructor(pagesrv) {
    this.pagesrv = pagesrv;
  }

  MenuTitle() {
    return this.pagesrv.CurrentDefault().title;
  }

  Pages() {
    return this.pagesrv.CurrentDefault().pages;
  }

  SetPage(pagename) {
    this.pagesrv.SetPage(pagename);
  }
}

app.component("menuMainNavDefault", {
  templateUrl: "modules/ui/menu/default/template.html",
  controller: ["PageService", MenuMainNavDefaultCtrl]
});