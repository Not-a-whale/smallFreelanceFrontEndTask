class UITablePaginationCtrl {
  constructor() {
    this.currentPage = 1;
    this.maxpages = 10;
    this.rowOptions = [10, 15, 20, 50, 100];
    this.rowCount = this.rowOptions[0];

    this.basepage = this.currentPage;
    this.showcount = 5;
    this.displayPages = [];
  }

  SetRowOptions(options){
    this.rowOptions = options;
    this.rowCount = this.rowOptions[0];
    this.UpdatePage();
  }

  SetRowOption(option){
    if (this.rowOptions.includes(option)){
      let results = this.rowCount * this.currentPage;
      let newpage = Math.ceil(results / option);
      // is this correct area to update the changes?
      this.rowCount = option;
      this.UpdatePage();
    } else {
      console.log('invalid row display option chosen ' + option);
    }
  }

  IsActive(page) {
    return page == this.currentPage;
  }

  DisplayPages() {
    return this.displayPages;
  }

  SetDisplayPages(pages) {

    if (Array.isArray(pages)) {
      this.displayPages = pages;
    } else {
      let newpages = [];
      newpages = Array.from(new Array(this.showcount), (x, i) => {
        let num = i + this.basepage;
        return {
          value: num,
          show: num
        };
      });

      // if basepage is not 1, then that means that there is 1 hiding to the left
      if (this.basepage != 1) {
        newpages.unshift({
          value: 'p',
          show: '...'
        });
      }
      if (this.basepage + this.showcount - 1 < this.maxpages) {
        newpages.push({
          value: 'n',
          show: '...'
        });
      }
      this.SetDisplayPages(newpages);
    }

  }

  PrevPage() {
    this.SetPage(this.currentPage - 1);
  }

  NextPage() {
    this.SetPage(this.currentPage + 1);
  }

  ValidPage(page) {
    return (page > 0 && page <= this.maxpages) || page == 'p' || page == 'n';
  }

  SetPage(page) {
    let basepage = this.basepage;
    if (this.ValidPage(page)) {

      if (page == 'p') {
        page = this.currentPage - this.showcount;
        if (page < 1) {
          page = 1;
        }
      } else if (page == 'n') {
        page = this.currentPage + this.showcount;
        if (page > this.maxpages) {
          page = this.maxpages;
        }
      }

      if (page < this.basepage) {
        this.basepage = this.basepage - this.showcount;
        if (this.basepage < 1) {
          this.basepage = 1;
        }
      }
      if (page > this.basepage + this.showcount - 1) {
        this.basepage = this.basepage + this.showcount;
        if (this.basepage > this.maxpages - this.showcount) {
          this.basepage = this.maxpages - this.showcount + 1;
        }
      }

      if (basepage != this.basepage) {
        this.SetDisplayPages();
      }
      this.currentPage = page;
      this.UpdatePage();

    } else {
      console.log('trying to access invalid page');
    }

  }

  UpdatePage() {
    if (this.onPageChange instanceof Function) {
      this.onPageChange({
        page: this.currentPage,
        rows: this.rowCount
      });
    }
  }

  $onInit(){

    this.SetDisplayPages();
  }
}

app.component('uiTablePagination', {
  templateUrl: 'modules/generic/table/transclude/pagination/template.html',
  controller: UITablePaginationCtrl,
  bindings: {
    onPageChange: '&?',
    currentPage: '<?',
    maxpages: '<?',
    rowOptions: '<?'
  }
});