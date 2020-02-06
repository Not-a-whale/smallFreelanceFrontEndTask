var configstates = {
  "tms": {
    abstract: true,
    url: "/tms"
  },
  "tms.dev": {
    url: "/dev",
    views: {
      "main@": {
        templateUrl: "modules/test/landingpage/meta.template.html"
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
        component: "menuMainNav"
      }
    },
    resolve: {
      items: function (MainNavService) {
        console.log("resolving");
        let items = MainNavService.GetMainNavMenu();
        console.log(items);
        return items;
      },
      pages: function (PageService) {
        return PageService.GetPages(); // this is not going to work if the state doesnt reload when clicking on page
      }
      // menulist: function (MenuService) {
      //   return MenuService.List();
      // },
      // activeitem: function ($transition$, MenuService, menulist) {
      //   return MenuService.SearchActiveState($transition$.to().name);
      // }
    }
  },
  "tmsapp.main2.test": {
    url: "/test",
    views: {
      "content-view@tmsapp.main2": {
        template: '<div ui-sref="tmsapp.main2">click me</div>'
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
      pages: function (PageService) {
        return PageService.GetPages(); // this is not going to work if the state doesnt reload when clicking on page
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
      page: function (PageService) {
        PageService.SetPage('calendar');
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
      page: function (PageService) {
        PageService.SetPage('dashboard');
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
      page: function (PageService) {
        PageService.SetPage('personnel');
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
      page: function (PageService) {
        PageService.SetPage('business');
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
      page: function (PageService) {
        PageService.SetPage('inventory');
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
      page: function (PageService) {
        PageService.SetPage('newtrailer');
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
      page: function (PageService) {
        PageService.SetPage('newtruck');
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