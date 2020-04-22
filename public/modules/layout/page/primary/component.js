class PageCtrl {
  constructor(PageService) {
    this.pagesrv = PageService;
  }

  PageTitle() {
    return this.pagesrv.CurrentPageTitle();
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

app.component('pageLayoutPrimary', {
  templateUrl: 'modules/layout/page/primary/template.html',
  controller: PageCtrl,
  controllerAs: '$pageCtrl'
});