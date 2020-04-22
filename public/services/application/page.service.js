class PageService {
  constructor(http, state, trans, q) {
    this.http = http;
    this.state = state;
    this.trans = trans;
    this.q = q;
    this.departments = undefined;
    this.current_department = undefined;
    this.current_page = undefined;
    this.page_history = [];
  }

  GoBack() {
    if (this.CanGoBack()) {
      let page = this.page_history.pop();
      this.state.go(page.state, undef, {
        goback: true
      });
    }
  }

  CanGoBack() {
    return this.page_history.length > 0;
  }


  _SetNavPage(navarray, navname, currentvar, getfun) {
    let self = this;
    let myfun = function (res) {
      let nav = undefined;
      for (let d of navarray) {
        if (d.title === navname) {
          nav = d;
          break;
        }
      }
      if (nav != undefined) {
        if (self[currentvar] != undefined) {
          if (!('goback' in self.state)) {
            self.page_history.push(self[currentvar]);
          }
        }
        self[currentvar] = nav;
      } else {
        console.error('Requested page ' + navname + ' not found.');
      }
    };

    if (navarray == undefined) {
      this.getfun().then(myfun);
    } else {
      myfun();
    }
  }

  FormToPage(formName) {
    let deferred = this.q.defer();

  }


  SetPage(pagename) {
    this._SetNavPage(this.current_department.pages, pagename, 'current_page', this.GetDepartment);
  }

  SetDepartment(deptname) {
    let self = this;
    let myfun = function (res) {
      let dept = undefined;
      for (let d of self.departments) {
        if (d.active) {
          if (d.title === deptname) {
            dept = d;
            break;
          }
        }
      }
      if (dept != undefined) {
        self.current_department = dept;
      } else {
        console.error('Requested department ' + deptname + ' not found.');
      }
    };

    if (this.departments == undefined) {
      this.GetDepartments().then(myfun);
    } else {
      myfun();
    }
  }

  CurrentDepartmentPages() {
    return this.current_department.pages.filter(x => x.active);
  }

  CurrentDepartment() {
    return this.current_department;
  }

  CurrentPageTabs() {
    if (this.current_page != undefined) {
      if ('pages' in this.current_page) {
        return this.current_page.pages.filter(x => x.active);
      }
    }
    return undefined;
  }

  CurrentPageOptional() {
    if (this.current_page != undefined) {
      if ('optional' in this.current_page) {
        return this.current_page.optional.filter(x => x.active);
      }
    }
    return undefined;
  }

  CurrentPageActions() {
    if ('actions' in this.current_page) {
      return this.current_page.actions.filter(x => x.active);
    }
    return undefined;
  }

  CurrentPage() {
    return this.current_page;
  }

  CurrentPageTitle() {
    let retval = "missing page title";
    if (this.current_page != undefined) {
      if (this.current_page.temp_title != undefined) {
        retval = this.current_page.temp_title;
      } else {
        retval = this.current_page.title;
      }
    }
    return retval;
  }

  SetCurrentPageTitle(title) {
    if (this.current_page != undefined) {
      if (title != undefined && title != '') {
        this.current_page.temp_title = title;
      }

    }
  }


  Departments() {
    return this.departments;
  }

  GetDepartments() {
    let self = this;
    return this.http.get('pages.json').then(function (res) {
      self.departments = res.data;
      if (self.current_department == undefined) {
        self.current_department = self.departments[0];
      }
      return res.data;
    });
  }
}

app.service('PageService', ['$http', '$state', '$transitions', '$q', PageService]);