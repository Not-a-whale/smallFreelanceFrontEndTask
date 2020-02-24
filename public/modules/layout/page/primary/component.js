class PageCtrl {
  constructor(pagesrv){
    this.pagesrv = pagesrv;
  }

  PageTitle(){
    return this.pagesrv.CurrentPage().title;
  }

  PageTabs() {
    return this.pagesrv.CurrentPage().pages;
  }
  PageActions() {
    return this.pagesrv.CurrentPage().actions;
  }

  PageOptionals(){
    return this.pagesrv.CurrentPage().optional;
  }
}

app.component("pageLayoutPrimary", {
  templateUrl: "modules/layout/page/primary/template.html",
  controller: ['PageService', PageCtrl],
});