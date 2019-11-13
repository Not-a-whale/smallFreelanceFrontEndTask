var configstates = {
  "tms": {
    url: "/tms"
  },
  "tms.dev": {
    url: "/dev",
    views: {
      "main@": {
        template: function(){
          return `<style>
                .btn-cont {
                  margin: 10px 10px 10px 10px
                }

                #global-container {
                  align-items: center;
                  justify-content: center;
                }
            </style>


          <div class="btn-cont"><a ui-sref="tms.test" class="btn btn-primary btn-lg">Components</a></div><div class="btn-cont"><a ui-sref="tmsapp.main.dashboard"class="btn btn-primary btn-lg">Web App</a></div>`
        }
      }
    }
  },
  "tms.test": {
    url: "/test",
    views: {
      "main@": {
        templateUrl: "modules/test/template.html"
      }
    },
    resolve: {
      components: function ($http) {
        return $http.get("components.json").then(function(res){
          return res.data;
        }, function(res) {
          console.error("No components.json file found");
        });
      },
      SelectMe: function ($location) {
        return function (t) {
          let tt = t.template || "none";
          let td = t.dataurl || "none";
          let tc = t.component || "none";

          td = btoa(td);
          let locurl = "tms/test/" + tc + "/" + td + "/" + tt;
          $location.url(locurl);
        };
      }
    }
  },"tms.test.component": {
    url: "/:component/:dataurl/:template",
    views: {
      "component@tms.test": {
        template: function(params) {
          return `<` + params.component + ' gate="$ctrl.gate" ></' + params.component + `>`;
        }
      }
    }, resolve: {
      gate: function ($transition$, $http) {
        let data = atob($transition$.params().dataurl);
        return $http.get(data).then(function (res) {
          return res.data.DATA.gate;
        }, function (res) {
          return data;
        });
      }
    }
  },
  "tms.app.error": {
    url: "/error",
    views: {
      "main@": {
        templateUrl: "/views/tms/app/error/main.html"
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
      "navbar@tmsapp.main": {
        component: "navLayout"
      },
      "topnav@tmsapp.main": {
        component: "topLayout"
      }
    },
    resolve: {
      menulist: function (MenuService) {
        return MenuService.List();
      },
      activeitem: function ($transition$, MenuService, menulist) {
        return MenuService.SearchActiveState($transition$.to().name);
      }
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
  "tmsapp.main.calendar": {
    url: "/calendar",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/calendar/content.html"
      }
    }
  },
  "tmsapp.main.dashboard": {
    url: "/dashboard",
    views: {
      "content@tmsapp.main": {
        templateUrl: "modules/dashboard/template.html"
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
    views: {
      "content@tmsapp.main": {
        component: "genericForm"
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
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/safety/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt": {
    url: "/trpmgmt",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads": {
    url: "/loads",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.archives": {
    url: "/archives",
    views: {
      "content@tmsapp.main": {
        templateUrl: "/views/tmsapp/main/trpmgmt/loads/archives/content.html"
      }
    }
  },
  "tmsapp.main.trpmgmt.loads.available": {
    url: "/available",
    views: {
      "content@tmsapp.main": {
        component: "loadsAvailable"
      },
      "table_banner@.": {
        templateUrl: "modules/generic/table/banner.template.html"
      },
      "table_search@.": {

      },
      "table_select@.": {

      },
      "table_content@.": {
        component: "loadsAvailableContent"
      },
      "table_expansion@.": {
        templateUrl: "modules/loads/available/default_expansion.html"
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
  }
}