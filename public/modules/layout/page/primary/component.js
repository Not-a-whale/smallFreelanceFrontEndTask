class PageCtrl {
  constructor(pagesrv) {
    this.pagesrv = pagesrv;
  }

  PageTitle() {
    return this.pagesrv.CurrentPage().title;
  }

  PageTabs() {
    return this.pagesrv.CurrentPageTabs();
  }
  PageActions() {
    return this.pagesrv.CurrentPageActions();
  }

  PageOptionals() {
    return this.pagesrv.CurrentPageOptional();
  }

  GoBack() {
    this.pagesrv.GoBack();
  }

  CanGoBack() {
    return this.pagesrv.CanGoBack();
  }
}

app.component("pageLayoutPrimary", {
  templateUrl: "modules/layout/page/primary/template.html",
  controller: ['PageService', PageCtrl],
});