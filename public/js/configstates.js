var configstates = {
  "tms": {
    abstract: true,
    url: "/tms"
  },
  "tms.dev": {
    url: "/dev",
    views: {
      "main@": {
        templateUrl: "modules/test/landingpage/template.html"
      }
    }
  },
  "tms.test": {
    url: "/test/:component",
    views: {
      "main@": {
        component: "metaComponentPost"
      }
    },
    resolve: {
      components: ['MetaComponentService', function (mcs) {
        return mcs.GetComponents();
      }]
    }
  },
  "tms.test.component": {
    url: "/c/show",
    views: {
      "component@tms.test": {
        template: function (params) {
          return `<` + params.component + ' gate="$ctrl.gate" ></' + params.component + `>`;
        }
      }
    }
  },
  "tms.test.table": {
    url: "/t/show",
    views: {
      "component@tms.test": {
        template: function (params) {
          return `<` + params.component + ` class="table-huge"
            gate="$ctrl.gate"
            meta="$ctrl.meta"
            on-search="$ctrl.Search($ctrl.meta.url + '/search' , query)"
            ></` + params.component + '>';
        }
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner/default/meta.template.html"
      },
      "table_advanced@.": {
        templateUrl: "modules/generic/table/searchbar/dropdown/meta.template.html"
      },
      "table_search@.": {
        component: "metaTableSearchBar"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "metaTestTableContent"
      },
      "table_expansion@.": {
        template: `<div style="height: 400px"> extra content </div>`
      }
    }
  },
  "tms.test.form": {
    url: "/f/show",
    views: {
      "component@tms.test": {

        template: function (params) {
          return `<meta-template-form
            forms="$resolve.forms"
            gate="$ctrl.gate"
            meta="$ctrl.meta"
            on-search="$ctrl.Search($resolve.meta.searchurl, query)"
            ></meta-template-form>`;
        }
      },
      "form@.": {
        template: function (params) {
          return `<` + params.component + `
            forms="$resolve.forms"
            gate="$ctrl.gate"
            meta="$ctrl.meta"
            get-form="$ctrl.GetForm(form)"
            on-disable="$ctrl.DisableForm(form)"
            ></` + params.component + '>';
        }
      }
    },
    resolve: {
      forms: function ($transition$, MetaFormService) {
        let comp = $transition$.params().component;
        // change meta-new-driver-form => NewDriverForm
        comp = comp.replace('meta-', '').split('-');
        for (let p in comp) {
          c = comp[p].charAt(0).toUpperCase();
          comp[p] = c + comp[p].slice(1);
        }
        comp = comp.join('');
        let promise = undefined;
        if (comp in MetaFormService) {
          promise = MetaFormService[comp]();
        }
        return promise;
      }
    }
  },
  "tmsapp.error": {
    url: "/error",
    views: {
      "main@": {
        templateUrl: "/views/tms/app/error/main.html"
      }
    }
  },
  "tmsapp.main2": {
    url: "/main2",
    views: {
      "main@": {
        component: "mainLayout2"
      },
      "logo-view@.": {
        template: '<img ui-sref="tmsapp.main2.test" src="imgs/logo_horiz.svg" height="100%" width="100%" style="padding: 8px" items="$resolve.items">'
      },
      "topnav-view@.": {
        component: "topNavbar"
      },
      "mainnav-view@.": {
        component: "menuMainNavLayoutDefault"
      },
      "mainnav-default-view@.": {
        component: "menuMainNavDefault"
      },
      "mainnav-department-view@.": {
        component: "menuMainNavDepartment"
      }
    },
    resolve: {
      departments: function (PageService) {
        return PageService.GetDepartments();
      },
      defaults: function (PageService) {
        return PageService.GetDefaults();
      }
    }
  },
  "tmsapp.main2.test": {
    url: "/test",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
        //template: '<div ui-sref="tmsapp.main2">click me</div>'
      }
      // "page-content@.": {
      //   component: 'pageSafetyBusinessAll'
      // }
    }
    // resolve: {
    //   current_page: function (PageService) {
    //     PageService.SetDepartment('safety');
    //     return PageService.SetPage('businesses');
    //   }
    // }
  },

  "tmsapp.main2.dispatch": {
    url: "/dispatch",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
        //template: '<div ui-sref="tmsapp.main2">click me</div>'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('dispatch');
      }
    }
  },


  "tmsapp.main2.dispatch.truck": {
    url: "/truck",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('trucks');
      }
    }
  },

  "tmsapp.main2.dispatch.truck.available": {
    url: "/avail",
    views: {
      "page-content@^.^": {
        template: 'this is the available truck page <br><a ui-sref="^.detail({truckid: 125})">Truck 125</a><br><a ui-sref="^.detail({truckid: 333})">Truck 333</a><br><a ui-sref="^.detail({truckid: 1002})">Truck 1002</a>'
      }
    }
  },

  "tmsapp.main2.dispatch.truck.detail": {
    url: "/:truckid/detail",
    views: {
      "page-content@^.^": {
        template: "this is the truck detail page <br>you picked truck {{$resolve.truckid}}"
      }
    },
    resolve: {
      truckid: function ($stateParams) {
        return $stateParams.truckid;
      }
    }
  },

  "tmsapp.main2.dispatch.driver": {
    url: "/drivers",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('drivers');
      }
    }
  },

  "tmsapp.main2.dispatch.driver.available": {
    url: "/avail",
    views: {
      "page-content@^.^": {
        template: 'this is the available drivers page <br><a ui-sref="^.detail({driverid: 125})">Driver 125</a><br><a ui-sref="^.detail({driverid: 333})">Driver 333</a><br><a ui-sref="^.detail({driverid: 1002})">Driver 1002</a>'
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('drivers');
      }
    }
  },


  "tmsapp.main2.dispatch.driver.detail": {
    url: "/:driverid/detail",
    views: {
      "page-content@^.^": {
        template: "this is the driver detail page <br>you picked driver {{$resolve.driverid}}"
      }
    },
    resolve: {
      driverid: function ($stateParams) {
        return $stateParams.driverid;
      }
    }
  },

  "tmsapp.main2.dispatch.load": {
    url: "/loads",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('loads');
      }
    }
  },

  "tmsapp.main2.dispatch.load.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the loads form page"
      }
    },
  },

  "tmsapp.main2.dispatch.load.available": {
    url: "/avail",
    views: {
      "page-content@^.^": {
        template: "this is the loads available"
      }
    },
  },
  "tmsapp.main2.dispatch.load.tender": {
    url: "/tenders",
    views: {
      "page-content@^.^": {
        template: "this is the loads tenders"
      }
    },
  },
  "tmsapp.main2.dispatch.load.board": {
    url: "/boards",
    views: {
      "page-content@^.^": {
        template: "this is the load boards"
      }
    },
  },


  "tmsapp.main2.dispatch.trip": {
    url: "/trips",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage trips');
      }
    }
  },

  "tmsapp.main2.dispatch.trip.active": {
    url: "/active",
    views: {
      "page-content@^.^": {
        template: "this is the trip active page"
      }
    },
  },

  "tmsapp.main2.dispatch.trip.detail": {
    url: "/:tripid/detail",
    views: {
      "page-content@^.^": {
        template: "this is the trip active detail page"
      }
    },
  },

  "tmsapp.main2.dispatch.trip.pending": {
    url: "/pending",
    views: {
      "page-content@^.^": {
        template: "this is the trip pending page"
      }
    },
  },

  "tmsapp.main2.dispatch.trip.complete": {
    url: "/complete",
    views: {
      "page-content@^.^": {
        template: "this is the trip complete page"
      }
    },
  },

  "tmsapp.main2.dispatch.trip.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the trip history page"
      }
    },
  },


  "tmsapp.main2.safety": {
    url: "/safety",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('safety');
      }
    }
  },

  "tmsapp.main2.safety.personnel": {
    url: "/personnel",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('personnel');
      }
    }
  },
  "tmsapp.main2.safety.personnel.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the personnel all page"
      }
    },
  },
  "tmsapp.main2.safety.personnel.driver": {
    url: "/driver",
    views: {
      "page-content@^.^": {
        template: "this is the personnel drivers page"
      }
    },
  },
  "tmsapp.main2.safety.personnel.ownerop": {
    url: "/ownerop",
    views: {
      "page-content@^.^": {
        template: "this is the personnel ownerop page"
      }
    },
  },
  "tmsapp.main2.safety.personnel.officestaff": {
    url: "/officestaff",
    views: {
      "page-content@^.^": {
        template: "this is the personnel officestaff page"
      }
    },
  },
  "tmsapp.main2.safety.personnel.contact": {
    url: "/contact",
    views: {
      "page-content@^.^": {
        template: "this is the personnel contact page"
      }
    },
  },

  "tmsapp.main2.safety.equipment": {
    url: "/equipment",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('equipment');
      }
    }
  },
  "tmsapp.main2.safety.equipment.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the equipment all page"
      }
    },
  },
  "tmsapp.main2.safety.equipment.device": {
    url: "/device",
    views: {
      "page-content@^.^": {
        template: "this is the equipment device page"
      }
    },
  },
  "tmsapp.main2.safety.equipment.truck": {
    url: "/truck",
    views: {
      "page-content@^.^": {
        template: "this is the equipment truck page"
      }
    },
  },
  "tmsapp.main2.safety.equipment.trailer": {
    url: "/trailer",
    views: {
      "page-content@^.^": {
        template: "this is the equipment trailer page"
      }
    },
  },

  "tmsapp.main2.safety.business": {
    url: "/businesses",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('businesses');
      }
    }
  },

  "tmsapp.main2.safety.business.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyBusinessAll'
      }
    },
  },

  "tmsapp.main2.safety.business.broker": {
    url: "/broker",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyBusinessBroker'
      }
    },

  },
  "tmsapp.main2.safety.business.carrier": {
    url: "/carrier",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyBusinessCarrier'
      }
    },

  },
  "tmsapp.main2.safety.business.other": {
    url: "/other",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyBusinessOther'
      }
    },

  },

  "tmsapp.main2.safety.expiration": {
    url: "/expiration",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('expirations');
      }
    }
  },
  "tmsapp.main2.safety.expiration.current": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the expiration all page"
      }
    },
  },
  "tmsapp.main2.safety.expiration.scheduled": {
    url: "/scheduled",
    views: {
      "page-content@^.^": {
        template: "this is the expiration scheduled page"
      }
    },
  },
  "tmsapp.main2.safety.expiration.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the expiration history page"
      }
    },
  },

  "tmsapp.main2.safety.maintenance": {
    url: "/maintenance",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('maintenance');
      }
    }
  },
  "tmsapp.main2.safety.maintenance.current": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the maintenance all page"
      }
    },
  },
  "tmsapp.main2.safety.maintenance.scheduled": {
    url: "/scheduled",
    views: {
      "page-content@^.^": {
        template: "this is the maintenance scheduled page"
      }
    },
  },
  "tmsapp.main2.safety.maintenance.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the maintenance history page"
      }
    },
  },


  "tmsapp.main2.safety.logbook": {
    url: "/logbook",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('logbook');
      }
    }
  },
  "tmsapp.main2.safety.logbook.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "This feature is currently not implemented"
      }
    },
  },

  "tmsapp.main2.safety.ifta": {
    url: "/ifta",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('IFTA/Highway use');
      }
    }
  },
  "tmsapp.main2.safety.ifta.carrier": {
    url: "/carrier",
    views: {
      "page-content@^.^": {
        template: "this is the ifta per carrier page"
      }
    },
  },
  "tmsapp.main2.safety.ifta.truck": {
    url: "/truck",
    views: {
      "page-content@^.^": {
        template: "this is the ifta per truck page"
      }
    },
  },
  "tmsapp.main2.safety.ifta.state": {
    url: "/state",
    views: {
      "page-content@^.^": {
        template: "this is the ifta per state page"
      }
    },
  },

  "tmsapp.main2.finance": {
    url: "/finance",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
        //template: '<div ui-sref="tmsapp.main2">click me</div>'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('finance');
      }
    }
  },

  "tmsapp.main2.finance.invoice": {
    url: "/invoice",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('invoices');
      }
    }
  },
  "tmsapp.main2.finance.invoice.open": {
    url: "/open",
    views: {
      "page-content@^.^": {
        template: "this is the invoice open page"
      }
    },
  },
  "tmsapp.main2.finance.invoice.processed": {
    url: "/processed",
    views: {
      "page-content@^.^": {
        template: "this is the invoice processed page"
      }
    },
  },
  "tmsapp.main2.finance.invoice.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the invoice history page"
      }
    },
  },
  "tmsapp.main2.finance.settlement": {
    url: "/settlement",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('settlements');
      }
    }
  },
  "tmsapp.main2.finance.settlement.open": {
    url: "/open",
    views: {
      "page-content@^.^": {
        template: "this is the settlement open page"
      }
    },
  },
  "tmsapp.main2.finance.settlement.check": {
    url: "/check",
    views: {
      "page-content@^.^": {
        template: "this is the settlement check page"
      }
    },
  },

  "tmsapp.main2.finance.settlement.processed": {
    url: "/processed",
    views: {
      "page-content@^.^": {
        template: "this is the settlement processed page"
      }
    },
  },
  "tmsapp.main2.finance.settlement.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the settlement history page"
      }
    },
  },

  "tmsapp.main2.finance.payschedule": {
    url: "/payschedule",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('payment schedule');
      }
    }
  },
  "tmsapp.main2.finance.payschedule.schedule": {
    url: "/schedule",
    views: {
      "page-content@^.^": {
        template: "this is the payschedule schedule page"
      }
    },
  },
  "tmsapp.main2.finance.payschedule.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the payschedule form page"
      }
    },
  },
  "tmsapp.main2.finance.payschedule.history": {
    url: "/history",
    views: {
      "page-content@^.^": {
        template: "this is the payschedule history page"
      }
    },
  },


  "tmsapp.main2.admin": {
    url: "/admin",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('admin');
      }
    }
  },

  "tmsapp.main2.admin.mycompany": {
    url: "/company",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('my company');
      }
    }
  },

  "tmsapp.main2.admin.mnguser": {
    url: "/manage",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage users');
      }
    }
  },

  "tmsapp.main2.admin.mnguser.user": {
    url: "/user",
    views: {
      "page-content@^.^": {
        template: "this is the manage user page"
      }
    },
  },

  "tmsapp.main2.admin.mnguser.user.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the manage user form page"
      }
    },
  },

  "tmsapp.main2.admin.mnguser.group": {
    url: "/group",
    views: {
      "page-content@^.^": {
        template: "this is the manage group page"
      }
    },
  },

  "tmsapp.main2.admin.mnguser.group.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the manage group form page"
      }
    },
  },
  "tmsapp.main2.admin.mnguser.role": {
    url: "/role",
    views: {
      "page-content@^.^": {
        template: "this is the manage role page"
      }
    },
  },

  "tmsapp.main2.admin.unit": {
    url: "/unit",
    abstract: true,
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage units');
      }
    }
  },
  "tmsapp.main2.admin.unit.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the manage unit page"
      }
    },
  },
  "tmsapp.main2.admin.unit.detail": {
    url: "/:unitid/detail",
    views: {
      "page-content@^.^": {
        template: "this is the manage unit detail page"
      }
    },
  },
  "tmsapp.main2.admin.unit.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the manage unit detail page"
      }
    },
  },

  "tmsapp.main2.admin.announcement": {
    url: "/announcement",
    views: {
      "page-content@^": {
        template: "this is the announcement page"
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('announcements');
      }
    }
  },
  "tmsapp.main2.admin.announcement.form": {
    url: "/form",
    views: {
      "page-content@^.^": {
        template: "this is the announcement form page"
      }
    },
  },

  "tmsapp.main2.admin.setting": {
    url: "/settings",
    views: {
      "page-content@^": {
        template: "this is the settings page"
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('app settings');
      }
    }
  },

  "tmsapp.main2.productivity": {
    url: "/productivity",
    abstract: true
  },

  "tmsapp.main2.productivity.dashboard": {
    url: "/dashboard",
    views: {
      "main-content-view@tmsapp.main2": {
        template: "this is the dashboard!"
      }
    }
  },
  "tmsapp.main2.productivity.calendar": {
    url: "/calendar",
    views: {
      "main-content-view@tmsapp.main2": {
        template: 'this is the calendar! <input type="date">'
      }
    }
  },
  "tmsapp.main2.productivity.map": {
    url: "/map",
    views: {
      "main-content-view@tmsapp.main2": {
        template: 'this is the map! <iframe src="https://www.google.com/maps/place/Usko+Express,+Inc/@38.609107,-121.2682923,17z/data=!3m1!4b1!4m5!3m4!1s0x809ad4171337e775:0xebc2e418f6fd3333!8m2!3d38.6091028!4d-121.2661036" height="480" width="640"></iframe>'
      }
    }
  },











  "tmsapp": {
    url: "/tmsapp"
  },
  "tmsapp.main": {
    url: "/main",
    views: {
      "main@": {
        component: "mainLayout"
      },
      "navbar@.": {
        component: "mainNavbar"
      },
      "topnav@.": {
        component: "topNavbar"
      },
      "navmenu@.": {
        component: "mainNavMenu2"
      },
      "topnavmenu@.": {
        component: "topNavMenu2"
      },
      "chat-dock@.": {
        component: "chatSystem"
      }
    },
    resolve: {
      menu: function (MainNavService) {
        return MainNavService.GetMainNavMenu();
      },
      pages: function (PageServiceOld) {
        return PageServiceOld.GetPages(); // this is not going to work if the state doesnt reload when clicking on page
      }
      // menulist: function (MenuService) {
      //   return MenuService.List();
      // },
      // activeitem: function ($transition$, MenuService, menulist) {
      //   return MenuService.SearchActiveState($transition$.to().name);
      // }
    }
  },
  "tmsapp.main.admin": {
    url: "/admin",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/admin/content.html"
      }
    }
  },
  "tmsapp.main.admin.users": {
    url: "/users",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/admin/users/content.html"
      }
    }
  },
  "tmsapp.main.mystuff": {
    url: "/mystuff",
    abstract: true
  },
  "tmsapp.main.mystuff.calendar": {
    url: "/calendar",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/calendar/content.html"
      }
    },
    resolve: {
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('calendar');
      }
    }
  },
  "tmsapp.main.mystuff.dashboard": {
    url: "/dashboard",
    views: {
      "content@tmsapp.main": {
        templateUrl: "modules/dashboard/template.html"
      }
    },
    resolve: {
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('dashboard');
      }
    }
  },
  "tmsapp.main.error": {
    url: "/error",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/error/content.html"
      }
    }
  },
  "tmsapp.main.fin": {
    url: "/fin",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/fin/content.html"
      }
    }
  },
  "tmsapp.main.fin.chargeitems": {
    url: "/chargeitems",
    views: {
      "content@tmsapp.main": {
        component: "transactionTemplateEditor"
      },
      "view@tmsapp.main.fin.chargeitems": {
        component: "transactionTemplateList",
      }
    },
    resolve: {
      list: function (TransactionService) {
        return TransactionService.List();
      }
    }
  },

  "tmsapp.main.fin.chargeitems.detail": {
    url: "/:tid/detail",
    views: {
      "form@tmsapp.main.fin.chargeitems": {
        component: "transactionTemplateDetail",
      },
      "table_search@tmsapp.main.fin.chargeitems.detail": {
        component: "genericTableSearch"
      },
      "table_select@tmsapp.main.fin.chargeitems.detail": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@tmsapp.main.fin.chargeitems.detail": {
        component: "transactionTableRow"
      },
      "custom_row@tmsapp.main.fin.chargeitems.detail": {
        component: "transactionTableRow2"
      }
    },
    resolve: {
      children: function ($transition$, TransactionService) {
        let id = $transition$.params().tid;
        return TransactionService.Children(id);
      }
    }
  },
  "tmsapp.main.fin.chargeitems.detail.edit": {
    url: "/edit",
    views: {
      "form@tmsapp.main.fin.chargeitems": {
        component: "transactionTemplateForm"
      }
    }
  },
  "tmsapp.main.fin.chargeitems.detail.edit2": {
    url: "/edit",
    views: {
      "form@tmsapp.main.fin.chargeitems": {
        component: "transactionTemplateForm2"
      }
    }
  },
  "tmsapp.main.fin.chargeitems.generate": {
    url: "/generate",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/fin/chargeitems/generate/content.html"
      }
    }
  },
  "tmsapp.main.fin.invoice": {
    url: "/invoice",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/fin/invoice/content.html"
      }
    }
  },
  "tmsapp.main.fin.settlments": {
    url: "/settlments",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/fin/settlments/content.html"
      }
    }
  },
  "tmsapp.main.groups": {
    url: "/groups"
  },
  "tmsapp.main.hr": {
    url: "/hr"
  },
  "tmsapp.main.hr.prsnl": {
    url: "/prsnl",
    resolve: {
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('personnel');
      }
    }
  },
  "tmsapp.main.hr.prsnl.ops": {
    url: "/operators"
  },
  "tmsapp.main.hr.prsnl.ops.list": {
    url: "/list",
    views: {
      "content@tmsapp.main": {
        component: "operatorsListPage"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner/default/meta.template.html"
      },
      "table_search@.": {
        component: "metaTableSearchBar"
      },
      "table_content@.": {
        component: "metaOperatorsTableContent"
      }
    },
    resolve: {
      meta: function (SampleData) {
        return SampleData.OperatorsTableMeta();
      },
      gate: function (SampleData) {
        return SampleData.OperatorsTableData();
      }
    }
  },
  "tmsapp.main.hr.prsnl.ops.list.detail": {
    url: "/:id/detail",
    views: {
      "detail@^": {
        component: 'operatorDetail'
      },
      "opstatus@.": {
        component: 'operatorStatusCards'
      },
      "opholds@.": {
        component: 'operatorHoldsCards'
      },
      "opdrivers@.": {
        component: 'operatorDriversCards'
      },
      "opvehicles@.": {
        component: 'operatorVehiclesCards'
      }
    },
    resolve: {
      detail: function ($stateParams, SampleData) {
        return SampleData.OperatorsTableDetailData($stateParams.id);
      }
    }
  },
  "tmsapp.main.hr.prsnl.owner.ops.owner": {
    url: "/owner_ops",
    abstract: true
  },
  "tmsapp.main.hr.prsnl.owner.form": {
    url: "/register",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      }
    }
  },
  "tmsapp.main.hr.prsnl.ops.driver": {
    url: "/driver",
    abstract: true
  },
  "tmsapp.main.hr.prsnl.ops.driver.form": {
    url: "/register",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewDriverForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewDriverForm();
      }
    }
  },
  "tmsapp.main.hr.biz": {
    url: "/biz",
    resolve: {
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('business');
      }
    }
  },
  // "tmsapp.main.hr.biz.other": {
  //   url: "/other"
  // },
  // "tmsapp.main.hr.biz.other.list": {
  //   url: "/list",
  //   views: {
  //     "content@tmsapp.main": {
  //       component: 'metaBusinessesListPage'
  //     },
  //     "table_banner@.": {
  //       templateUrl: "modules/generic/table/banner/default/meta.template.html"
  //     },
  //     "table_search@.": {
  //       component: "metaTableSearchBar"
  //     },
  //     "table_content@.": {
  //       component: "metaBusinessTableContent"
  //     }
  //   },
  //   resolve: {
  //     gate: function (BusinessService) {
  //       return BusinessService.TableOfBusinesses();
  //     },
  //     contentView: function () {
  //       return 'table_content';
  //     },
  //     Search: function () {
  //       console.log("hello");
  //       return function () {
  //         console.log("searching api...");
  //       };
  //     }
  //   }
  // },
  // "tmsapp.main.hr.biz.other.list.detail": {
  //   url: "/:id/detail",
  //   views: {
  //     "detail@^": {
  //       component: 'metaBusinessDetail'
  //     }
  //   },
  //   resolve: {
  //     detail: function (BusinessService, $stateParams) {
  //       let params = {
  //         search: {
  //           BrnchId: $stateParams.id
  //         }
  //       };
  //       return BusinessService.BusinessFind(params);
  //     }
  //   }
  // },
  "tmsapp.main.hr.biz.shipper": {
    url: "/shipper"
  },
  "tmsapp.main.hr.biz.shipper.form": {
    url: "/form",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewCarrierForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewCarrierForm();
      },
      gate: function () {
        return {};
      }
    }
  },
  "tmsapp.main.hr.biz.shipper.list": {
    url: "/list",
    views: {
      "content@tmsapp.main": {
        component: 'carrierListPage'
      }
    },
    resolve: {
      carriers: function (BusinessService) {
        return BusinessService.TableOfCarriers();
      },
      contentView: function () {
        return 'table_content';
      }
    }
  },
  "tmsapp.main.hr.biz.shipper.list.detail": {
    url: "/:id/detail",
    views: {
      "detail@^": {
        component: 'carrierDetail'
      }
    },
    resolve: {
      detail: function ($stateParams, BusinessService) {
        let params = {
          search: [{
            "carrier.biz_branches.BrnchId": $stateParams.id
          }]
        };
        return BusinessService.CarrierFind(params);
      }
    }
  },


  "tmsapp.main.hr.biz.broker": {
    url: "/broker"
  },
  "tmsapp.main.hr.biz.broker.form": {
    url: "/form",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewCarrierForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewCarrierForm();
      },
      gate: function () {
        return {};
      }
    }
  },
  "tmsapp.main.hr.biz.broker.list": {
    url: "/list",
    views: {
      "content@tmsapp.main": {
        component: 'carrierListPage'
      }
    },
    resolve: {
      carriers: function (BusinessService) {
        return BusinessService.TableOfCarriers();
      },
      contentView: function () {
        return 'table_content';
      }
    }
  },
  "tmsapp.main.hr.biz.broker.list.detail": {
    url: "/:id/detail",
    views: {
      "detail@^": {
        component: 'carrierDetail'
      }
    },
    resolve: {
      detail: function ($stateParams, BusinessService) {
        let params = {
          search: [{
            "carrier.biz_branches.BrnchId": $stateParams.id
          }]
        };
        return BusinessService.CarrierFind(params);
      }
    }
  },

  "tmsapp.main.hr.biz.carrier": {
    url: "/carrier"
  },
  "tmsapp.main.hr.biz.carrier.form": {
    url: "/form",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewCarrierForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewCarrierForm();
      },
      gate: function () {
        return {};
      }
    }
  },
  "tmsapp.main.hr.biz.carrier.list": {
    url: "/list",
    views: {
      "content@tmsapp.main": {
        component: 'carrierListPage'
      }
    },
    resolve: {
      carriers: function (BusinessService) {
        return BusinessService.TableOfCarriers();
      },
      contentView: function () {
        return 'table_content';
      }
    }
  },
  "tmsapp.main.hr.biz.carrier.list.detail": {
    url: "/:id/detail",
    views: {
      "detail@^": {
        component: 'carrierDetail'
      }
    },
    resolve: {
      detail: function ($stateParams, BusinessService) {
        let params = {
          search: [{
            "carrier.biz_branches.BrnchId": $stateParams.id
          }]
        };
        return BusinessService.CarrierFind(params);
      }
    }
  },
  "tmsapp.main.inv": {
    url: "/inv",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/inv/content.html"
      }
    }
  },
  "tmsapp.main.loads": {
    url: "/loads"
  },
  "tmsapp.main.safety": {
    url: "/safety",
    abstract: true
  },
  "tmsapp.main.safety.inv": {
    url: "/inventory",
    views: {
      "content@tmsapp.main": {
        template: "<div>This is the inventory page</div>"
      }
    },
    resolve: {
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('inventory');
      }
    }
  },
  "tmsapp.main.safety.inv.vehicles": {
    url: "/vehicles",
    views: {
      "content@tmsapp.main": {
        template: "<div>This is the vehicle inventory page</div>"
      }
    }
  },
  "tmsapp.main.safety.inv.assets": {
    url: "/assets",
    views: {
      "content@tmsapp.main": {
        template: "<div>This is the other assets inventory page</div>"
      }
    }
  },
  "tmsapp.main.safety.inv.regtrailer": {
    url: "/register/trailer",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewTrailerForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewTrailerForm();
      },
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('newtrailer');
      }
    }
  },
  "tmsapp.main.safety.inv.regtruck": {
    url: "/register/truck",
    views: {
      "content@tmsapp.main": {
        component: "metaTemplateForm"
      },
      "form@.": {
        component: "metaNewTruckForm"
      }
    },
    resolve: {
      forms: function (MetaFormService) {
        return MetaFormService.NewTruckForm();
      },
      page: function (PageServiceOld) {
        PageServiceOld.SetPage('newtruck');
      }
    }
  },
  "tmsapp.main.trpmgmt": {
    url: "/trpmgmt",
    abstract: true
  },
  "tmsapp.main.trpmgmt.loads": {
    url: "/loads",
    abstract: true
  },
  "tmsapp.main.trpmgmt.loads.availability": {
    url: "/avab",
    views: {
      "content@tmsapp.main": {
        component: "loadsAvailable"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_advanced@.": {
        templateUrl: "modules/generic/table/searchbar/dropdown/meta.template.html"
      },
      "table_search@.": {
        component: "metaTableSearchBar"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "metaTestTableContent"
      }
    },
    resolve: {
      availLoadList: function ($transition$, LoadService) {
        return LoadService.List();
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.buildaload": {
    url: "/buildaload",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/buildaload/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.enroute": {
    url: "/enroute",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/enroute/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.pending": {
    url: "/pending",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/pending/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.public": {
    url: "/public",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/public/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks": {
    url: "/trucks",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks.all": {
    url: "/all",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/all/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks.map": {
    url: "/map",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/map/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks.my": {
    url: "/my",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/my/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks.myteam": {
    url: "/myteam",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/myteam/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.trucks.mytrucks": {
    url: "/mytrucks",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/trucks/mytrucks/content.html"
      }
    }
  },
  "tmsapp.main.admin.webadmin": {
    url: "/webadmin",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/webadmin/content.html"
      }
    }
  },
  "tmsapp.main.admin.webadmin.navmenueditor": {
    url: "/navmenueditor",
    views: {
      "content@tmsapp.main": {
        component: "navEditor"
      },
      "view@.": {
        component: "navHierarchy"
      }
    },
    resolve: {
      navlist: function (MenuService) {
        return MenuService.Tree();
      }
    }
  },
  "tmsapp.main.admin.webadmin.navmenueditor.detail": {
    url: "/:tid/detail",
    views: {

      "form@^": {
        component: "navForm"
      }
    },
    resolve: {
      item: function ($transition$, MenuService) {
        return MenuService.Single($transition$.params().tid);
      },
      iconList: function (SymbolService) {
        return SymbolService.Symbols();
      }
    }
  },
  "tmsapp.main.admin.webadmin.navmenueditor.new": {
    url: "/new/detail",
    views: {
      "form@^": {
        component: "navFormNew"
      }
    },
    resolve: {

      iconList: function (SymbolService) {
        return SymbolService.Symbols();
      }
    }
  },
  "tmsapp.main.admin.webadmin.testpage": {
    url: "/testpage",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/webadmin/testpage/content.html"
      }
    }
  },

  "tmsapp.main.admin.webadmin.testpage.forms": {
    url: "/forms",
    views: {
      "content@tmsapp.main": {
        component: "testFormExample"
      },
      "form@.": { // this is the form template, the actual forms will be nested inside of this one
        templateUrl: "modules/generic/form/section/template.html"
      },
      "prsninfo@.": { // form for personal information, the rest of the views follow the same logic
        //templateUrl: "modules/personal/form/default.html"
        //templateUrl: "modules/driverlicense/form/default.html"
        //templateUrl: "modules/medicalrecord/form/default.html"
        //templateUrl: "modules/address/form/default.html"
        component: 'personalInformationForm'
      },
      "contactinfo@.": {
        //templateUrl: "modules/personal/form/default.html"
        component: 'agentInformationForm'
      },
      "taxes@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "billing@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "ascoinfo@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "vehicles@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "drivers@.": {
        component: 'driversForm'
      },
      "insurance@.": {
        component: 'insuranceForm'
      },
      "notes@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "adddocs@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "revsubmit@.": {
        templateUrl: "modules/generic/form/review_submit.html"
      }
    }
  },
  "tmsapp.main.admin.webadmin.testpage.tables": {
    url: "/tables",
    views: {
      "content@tmsapp.main": {
        templateUrl: "views/tmsapp/main/webadmin/testpage/tables/content.html"
      },
      "table_search@.": {
        component: "genericTableSearch"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "testTableRowExample1"
      },
      "table_edit@.": {
        component: "testTableRowExample1Edit"
      }
    }
  },
  "tmsapp.main.testpg": {
    url: "/testpg",
    abstract: true
  },
  "tmsapp.main.testpg.forms": {
    url: "/forms",
    views: {
      "content@tmsapp.main": {
        component: "testFormExample"
      },
      "form@.": { // this is the form template, the actual forms will be nested inside of this one
        templateUrl: "modules/generic/form/section/template.html"
      },
      "prsninfo@.": { // form for personal information, the rest of the views follow the same logic
        //templateUrl: "modules/personal/form/default.html"
        //templateUrl: "modules/driverlicense/form/default.html"
        //templateUrl: "modules/medicalrecord/form/default.html"
        //templateUrl: "modules/address/form/default.html"
        component: 'personalInformationForm'
      },
      "contactinfo@.": {
        //templateUrl: "modules/personal/form/default.html"
        component: 'agentInformationForm'
      },
      "taxes@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "billing@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "ascoinfo@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "vehicles@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "drivers@.": {
        component: 'driversForm'
      },
      "insurance@.": {
        component: 'insuranceForm'
      },
      "notes@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "adddocs@.": {
        templateUrl: "modules/personnel/personal/form/default.html"
      },
      "revsubmit@.": {
        templateUrl: "modules/generic/form/review_submit.html"
      }
    }
  },
  "tmsapp.main.testpg.forms.section": {
    url: "/section",
    views: {
      "content@tmsapp.main": {
        component: "insuranceForm"
      }
    }
  },
  "tmsapp.main.testpg.fonts": {
    url: "/fonts",
    views: {
      "content@tmsapp.main": {
        templateUrl: "views/tmsapp/main/testpg/fonts/content.html"
      }
    }
  },
  "tmsapp.main.testpg.inputs": {
    url: "/inputs"
  },
  "tmsapp.main.testpg.inputs.inputs": {
    url: "/inputs",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/webadmin/testpage/inputs/content.html"
      }
    }
  },
  "tmsapp.main.testpg.inputs.buttons": {
    url: "/buttons",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/webadmin/testpage/buttons/content.html"
      }
    }
  },
  "tmsapp.main.testpg.inputs.uploadfile": {
    url: "/uploadfile",
    views: {
      "content@tmsapp.main": {
        templateUrl: "views/tmsapp/main/testpg/inputs/upload/content.html"
      }
    }
  },

  "tmsapp.main.testpg.tables": {
    url: "/tables"
  },
  "tmsapp.main.testpg.tables.accordion": {
    url: "/accordion",
    views: {
      "content@tmsapp.main": {
        component: "testTableAccordionExample"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_search@.": {
        component: "genericTableSearch"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "testTableRowExample1"
      },
      "table_expansion@.": {
        component: "testTableExpansionExample"
      }
    },
    resolve: {
      displaylist: function (TestDataService) {
        return TestDataService.TableData();
      },
      savedlist: function (TestDataService) {
        return TestDataService.TableData();
      }
    }
  },
  "tmsapp.main.testpg.tables.selector": {
    url: "/selector",
    views: {
      "content@tmsapp.main": {
        component: "testTableSelectorExample"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_search@.": {
        component: "genericTableSearch"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "testTableRowExample1"
      }
    },
    resolve: {
      displaylist: function (TestDataService) {
        return TestDataService.TableData();
      },
      savedlist: function (TestDataService) {
        return TestDataService.TableData();
      }
    }
  },
  "tmsapp.main.testpg.tables.flowout": {
    url: "/flowout",
    views: {
      "content@tmsapp.main": {
        component: "testTableFlowoutExample"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_search@.": {
        component: "genericTableSearch"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "testTableFlowoutRowExample1"
      }
    },
    resolve: {
      displaylist: function (TestDataService) {
        return TestDataService.TableData();
      },
      savedlist: function (TestDataService) {
        return TestDataService.TableData();
      }
    }
  },
  "tmsapp.main.testpg.tables.focused": {
    url: "/focused",
    views: {
      "content@tmsapp.main": {
        component: "testTableFocusedExample"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_search@.": {
        component: "genericTableSearch"
      },
      "table_select@.": {
        templateUrl: "modules/temp/table/select.template.html"
      },
      "table_content@.": {
        component: "testTableRowExample1"
      },
      "table_expansion@.": {
        component: "testTableExpansionExample"
      }
    },
    resolve: {
      displaylist: function (TestDataService) {
        return TestDataService.TableData();
      },
      savedlist: function (TestDataService) {
        return TestDataService.TableData();
      }
    }
  },


}