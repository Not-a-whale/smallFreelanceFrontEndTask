class PageService {
  constructor(http) {
    this.http = http;
    this.departments = undefined;
    this.current_department = undefined;
    let self = this;
    // this.GetDepartments().then(function (res) {
    //   self.current_department = res[0];
    // });

    this.defaults = undefined;
    this.current_defaults = undefined;
    // this.GetDefaults().then(function (res) {
    //   self.current_defaults = res[0];
    // });

    this.current_page = undefined;
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

  CurrentDefault() {
    return this.current_defaults;
  }

  CurrentPageTabs() {
    if ('pages' in this.current_page) {
      return this.current_page.pages.filter(x => x.active);
    }
    return undefined;
  }

  CurrentPageOptional() {
    if ('optional' in this.current_page) {
      return this.current_page.optional.filter(x => x.active);
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

  Departments() {
    return this.departments;
  }

  GetDepartments() {
    let self = this;
    return this.http.get('pages_new.json').then(function (res) {
      self.departments = res.data;
      if (self.current_department == undefined) {
        self.current_department = self.departments[0];
      }
      return res.data;
    });
  }

  GetDefaults() {
    let self = this;
    return this.http.get('pages_default.json').then(function (res) {
      self.defaults = res.data;
      if (self.current_defaults == undefined) {
        self.current_defaults = self.defaults[0];
      }
      return res.data;
    });
  }
}

app.service('PageService', ['$http', PageService]);