function stitch_attrs(attrs) {
  return Object.keys(attrs).map(x => x + '="' + attrs[x] + '"').join(' ');
}

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
  "tms.dev.forms": {
    url: "/forms",
    views: {
      "main@": {
        component: 'devForms'
      }
    }
  },
  "tms.dev.pages": {
    url: '/pages',
    views: {
      'main@': {
        component: 'devPages'
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
  "tmsapp": {
    abstract: true,
    url: "/tmsapp",
    resolve: {
      api: 'APIService'
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
      // "mainnav-default-view@.": {
      //   component: "menuMainNavDefault"
      // },
      "mainnav-department-view@.": {
        component: "menuMainNavDepartment"
      }
    },
    resolve: {
      departments: function (PageService) {
        return PageService.GetDepartments();
      }
    }
  },
  "tmsapp.main2.form": {
    url: "/form",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('forms');
      },
      forms: function (FormService) {
        return FormService.FetchForms();
      }
    }
  },

  'tmsapp.main2.form.generic': {
    url: '/:formName/:subformName?id',
    views: {
      'page-content@^': {
        component: 'uiForm'
      }
    },
    resolve: {
      current_page: function (PageService, $stateParams) {
        PageService.SetPage($stateParams.formName);
      },
      current_form: function (FormService, $stateParams) {
        return FormService.SetForm($stateParams.formName);
      },
      current_subform: function (FormService, $stateParams, current_form) {
        // current_form is used as dependency, do not remove
        return FormService.SetSubform($stateParams.subformName);
      },
      formdata: function (PageService, FormService, $stateParams, current_form) {
        // current_form is used a dependency, do not remove

        return FormService.GetFormData($stateParams.id).then(function (data) {
          let pagetitle = FormService.GetTempTitle();
          PageService.SetCurrentPageTitle(pagetitle);
          return data;
        });
      },
      sections: function (FormService, current_subform) {
        // current_subform is used as dependency, do not remove
        FormService.CurrentSections();
      },
    },
    params: {
      formName: null,
      subformName: null,
      tempTitle: null,
    }
  },


  "tmsapp.main2.form.test": {
    url: "/test",
    views: {
      "page-content@^": {
        component: 'uiForm'
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('example form');
      },
      current_form: function (FormService) {
        return FormService.SetForm('test');
      },
      current_subform: function (FormService) {
        return FormService.SetSubform('test1');
      },
      formdata: function (FormService, $stateParams) {
        if ($stateParams.id == undefined) {
          return FormService.CurrentFormData();
        } else {

        }
      },
      sections: function (FormService) {
        FormService.CurrentSections();
      },
    }
  },
  "tmsapp.main2.form.contact": {
    url: "/contact?id",
    views: {
      "page-content@^": {
        component: 'uiForm'
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('new contact');
      },
      current_form: function (FormService) {
        return FormService.SetForm('new contact');
      },
      current_subform: function (FormService) {
        return FormService.SetSubform('new contact');
      },

      sections: function (FormService) {
        FormService.CurrentSections();
      },
      formdata: function (FormService, APIService, $stateParams) {
        if ($stateParams.id == undefined) {
          return FormService.CurrentFormData();
        } else {
          let query = {
            search: [{
              'AstId': $stateParams.id
            }]
          };
          return APIService.Single('/api/associate/search', query).then(
            function (res) {
              FormService.SetCurrentFormData(res);
              return FormService.CurrentFormData();
            });
        }
      }
    }
  },
  "tmsapp.main2.form.employee": {
    url: "/employee?id",
    views: {
      "page-content@tmsapp.main2.form": {
        component: 'uiFormOfficeEmployee'
      },
      "page-actions@tmsapp.main2.form": {
        component: 'uiFormControls'
      },
      "page-optional@tmsapp.main2.form": {
        component: 'uiFormControlsOptional'
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('new office employee');
      },
      current_form: function (FormService) {
        return FormService.SetForm('new office employee');
      },
      current_subform: function (FormService) {
        return FormService.SetSubform('new office employee');
      },
      formdata: function (FormService, $stateParams) {
        if ($stateParams.id == undefined) {
          return FormService.CurrentFormData();
        } else {

        }
      },
      sections: function (FormService) {
        FormService.CurrentSections();
      },
    }
  },
  "tmsapp.main2.form.business": {
    url: "/business?id",
    views: {
      "page-content@^": {
        component: 'uiForm'
      },
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('new general business');
      },
      current_form: function (FormService) {
        return FormService.SetForm('new general business');
      },
      current_subform: function (FormService) {
        return FormService.SetSubform('new general business');
      },
      formdata: function (FormService, APIService, $stateParams) {
        if ($stateParams.id == undefined) {
          return FormService.CurrentFormData();
        } else {
          let query = {
            search: [{
              'me.brnchId': $stateParams.id
            }]
          };
          return APIService.Single('/api/business/branch/search', query).then(
            function (res) {
              FormService.SetCurrentFormData(res);
              return FormService.CurrentFormData();
            });
        }
      },
      sections: function (FormService) {
        let sects = FormService.CurrentSections();
        return sects;
      },

    },
  },


  "tmsapp.main2.form.carrier": {
    url: "/carrier",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('new carrier');
      }
    },
    redirectTo: "tmsapp.main2.form.carrier.carrierinfo"
  },

  "tmsapp.main2.form.carrier.carrierinfo": {
    url: "/info",
    views: {
      "page-content@^": {
        component: 'uiFormCarrier'
      }
    },
    resolve: {

    }
  },

  "tmsapp.main2.form.carrier.branches": {
    url: "/branches",
    views: {
      "page-content@^": {
        component: 'uiBusinessBranchesForm'
      }
    },
    resolve: {
      current_subform: function (FormService) {
        FormService.SetSubform('example tab title 1');
      }
    }
  },

  "tmsapp.main2.form.carrier.equipment": {
    url: "/equipment",
    views: {
      "page-content@^": {
        template: "this is the vehicles page"
      }
    },
    resolve: {
      current_subform: function (FormService) {
        FormService.SetSubform('example tab title 2');
      }
    }
  },

  "tmsapp.main2.form.carrier.drivers": {
    url: "/info",
    views: {
      "page-content@^": {
        template: "this is the drivers page"
      }
    },
    resolve: {
      current_subform: function (FormService) {
        FormService.SetSubform('example tab title 3');
      }
    }
  },

  "tmsapp.main2.dispatch": {
    url: "/dispatch",
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('dispatch');
      }
    },
    redirectTo: 'tmsapp.main2.dispatch.truck.available'
  },


  "tmsapp.main2.dispatch.truck": {
    url: "/truck",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('units');
      }
    },
    redirectTo: 'tmsapp.main2.dispatch.truck.available'
  },

  "tmsapp.main2.dispatch.truck.available": {
    url: "/avail",
    views: {
      "page-content@^.^": {
        component: 'pageDispatchUnitAll'
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('drivers');
      }
    },
    redirectTo: 'tmsapp.main2.dispatch.driver.available'
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('loads');
      }
    },
    redirectTo: 'tmsapp.main2.dispatch.load.available'
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage trips');
      }
    },
    redirectTo: "tmsapp.main2.dispatch.trip.active"
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
    },
    redirectTo: "tmsapp.main2.safety.personnel.all"
  },

  "tmsapp.main2.safety.personnel": {
    url: "/personnel",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('personnel');
      }
    },
    redirectTo: "tmsapp.main2.safety.personnel.all"
  },
  "tmsapp.main2.safety.personnel.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyPersonnelAll'
      }
    },
  },
  "tmsapp.main2.safety.personnel.driver": {
    url: "/driver",
    views: {
      "page-content@^.^": {
        component: 'pageSafetyPersonnelDriver'
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
  "tmsapp.main2.safety.personnel.officeemps": {
    url: "/officeemps",
    views: {
      "page-content@^.^": {
        template: "this is the personnel office employees page"
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
  "tmsapp.main2.safety.personnel.detail": {
    url: "/:pid/detail",
    views: {
      "page-content@^.^": {
        component: "pageSafetyPersonnelDetail"
      }
    },
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage();
      },
      detail: function ($transition$, PersonnelService) {
        return PersonnelService.PersonnelFind({
          AstId: $transition$.params().pid
        });
      }
    }
  },

  "tmsapp.main2.safety.equipment": {
    url: "/equipment",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('equipment');
      }
    },
    redirectTo: "tmsapp.main2.safety.equipment.all"
  },
  "tmsapp.main2.safety.equipment.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: '<ui-popup formtype="branch"></ui-popup>'
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('businesses');
      }
    },
    redirectTo: "tmsapp.main2.safety.business.all"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('expirations');
      }
    },
    redirectTo: "tmsapp.main2.safety.expiration.current"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('maintenance');
      }
    },
    redirectTo: "tmsapp.main2.safety.maintenance.current"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('logbook');
      }
    },
    redirectTo: "tmsapp.main2.safety.logbook.all"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('IFTA/Highway use');
      }
    },
    redirectTo: "tmsapp.main2.safety.ifta.carrier"
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
    },
    redirectTo: "tmsapp.main2.finance.invoice.open"
  },

  "tmsapp.main2.finance.invoice": {
    url: "/invoice",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('invoices');
      }
    },
    redirectTo: "tmsapp.main2.finance.invoice.open"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('settlements');
      }
    },
    redirectTo: "tmsapp.main2.finance.settlement.open"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('payment schedule');
      }
    },
    redirectTo: "tmsapp.main2.finance.payschedule.schedule"
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
    },
    redirectTo: "tmsapp.main2.admin.mycompany"
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
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage users');
      }
    },
    redirectTo: "tmsapp.main2.admin.mnguser.user"
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

  "tmsapp.main2.safety.unit": {
    url: "/unit",
    resolve: {
      current_page: function (PageService) {
        return PageService.SetPage('manage units');
      }
    },
    redirectTo: "tmsapp.main2.safety.unit.all"
  },
  "tmsapp.main2.safety.unit.all": {
    url: "/all",
    views: {
      "page-content@^.^": {
        template: "this is the manage unit page"
      }
    },
  },
  "tmsapp.main2.safety.unit.detail": {
    url: "/:unitid/detail",
    views: {
      "page-content@^.^": {
        template: "this is the manage unit detail page"
      }
    },
  },
  "tmsapp.main2.safety.unit.form": {
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
    redirectTo: "tmsapp.main2.productivity.dashboard"
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
        template: 'this is the map!'
      }
    }
  },


  "tmsapp.main2.profile": {
    url: "/profile",
    abstract: true,
    resolve: {
      department: function (PageService) {
        return PageService.SetDepartment('forms');
      }
    }
  },
  "tmsapp.main2.profile.business": {
    url: '/{businesstype:owner-operator|carrier|broker|shipper|general}/{businessId:[0-9]+|new}',
    abstract: true,
    views: {
      'main-content-view@tmsapp.main2': {
        component: 'pageLayoutPrimary'
      },
      'page-content@.': {
        component: 'uiMegaForm'
      }
    },
    resolve: {
      businessData: function (APIService, businessId) {
        return APIService.GetBusiness(businessId);
      },
      pagesetup: function ($q, $transition$, PageService, businessId, businessData, businessIsNew) {

        let type = $transition$.params().businesstype;


        PageService.Clear();

        PageService.AddTab(type + ' info', 'tmsapp.main2.profile.business.detail');
        if (businessIsNew) {
          PageService.SetTitle(['new', type, 'business'].join(' '));
        } else {
          PageService.SetTitle(businessData.BizName || 'nothing here');
          PageService.AddTab('branches', 'tmsapp.main2.profile.business.branch');
          PageService.AddTab('office staff', 'tmsapp.main2.profile.business.staff');
          switch (type) {
            case 'owner-operator':
              break;
            case 'carrier':
              PageService.AddTab('Drivers', 'tmsapp.main2.profile.business.driver');
              PageService.AddTab('Equipment', 'tmsapp.main2.profile.business.equipment');
              break;
            case 'broker':
              break;
            case 'shipper':
              break;
            case 'general':

              break;
          }
        }
        return true;
      },
      entityId: function (businessData) {
        return businessData.entity.EntityId;
      },
      businessId: function ($transition$) {
        return $transition$.params().businessId;
      },
      businessIsNew: function (businessId) {
        return businessId === 'new';
      },
      businessType: function ($transition$) {
        return $transition$.params().businesstype;
      }
    },
    redirectTo: '.detail'
  },
  "tmsapp.main2.profile.business.detail": {
    url: '/detail',
    views: {
      'megaform-form': {
        template: function (params) {
          let type = params.businesstype;
          let template = '';
          let business_attrs = {
            'data': '$resolve.businessinfo',
            'business-id': '$resolve.businessId'
          };
          let insurance_attrs = {
            'business-id': '$resolve.businessId',
            'entity-id': '$resolve.entityId',
            'api-call': "'GetBusinessInsuranceEntity'",
            'api-params': '{businessId: $resolve.businessId}'
          };
          let state_attrs = {
            'business-id': '$resolve.businessId'
          };

          let ifta_attrs = {
            'data': '$resolve.iftaaccountData',
            'business-id': '$resolve.businessId'
          };

          switch (type) {
            case 'owner-operator':

              break;
            case 'carrier':
              business_attrs.type = 'business-carrier';
              template += '<ui-form-section-business-information ' + stitch_attrs(business_attrs) + ' ></ui-form-section-business-information>';
              template += '<ui-form-section-insurance-entity-information ' + stitch_attrs(insurance_attrs) + ' ></ui-form-section-insurance-entity-information>';
              template += '<ui-form-section-ifta-account ' + stitch_attrs(ifta_attrs) + ' ></ui-form-section-ifta-account>';
              template += '<ui-form-section-state-permit ' + stitch_attrs(state_attrs) + ' ></ui-form-section-state-permit>';
              break;
            case 'broker':
              break;
            case 'shipper':
              break;
            case 'general':
              template += '<ui-form-section-business-information ' + stitch_attrs(business_attrs) + ' ></ui-form-section-business-information>';
              template += '<ui-form-section-insurance-entity-information ' + stitch_attrs(insurance_attrs) + ' ></ui-form-section-insurance-entity-information>';
              break;
          }

          return template;
        }
      }
    },
    resolve: {
      businessinfo: function (businessData, businessIsNew) {
        if (businessIsNew) {
          return {};
        }
        return businessData;
      },
      iftaaccountData: function (APIService, businessId) {
        let query = {
          strict: {
            businessId: businessId
          }
        };
        return APIService.GetIFTAAccount(query).then(APIService.MakeSingle);
      }

    }
  },
  'tmsapp.main2.profile.business.branch': {
    url: '/branch',
    views: {
      'megaform-list': {
        template: function (params) {
          let list_attrs = {
            'type': 'branch-form',
            'list': '$resolve.businessBranchList',
            'list-id': '$megaform.listid',
            'api-call': "'GetBusinessBranchList'",
            'api-params': "{businessId: $resolve.businessId, branchid: $resolve.branchid}"

          }
          let template = '<ui-list ' + stitch_attrs(list_attrs) + ' ></ui-list>';
          return template;
        }
      },
      'megaform-form': {
        template: function (params) {
          let list_attrs = {
            'list': '$resolve.businessBranchList',
            'idname': 'branchid'
          };
          let template = '<ui-form-blank ' + stitch_attrs(list_attrs) + ' ></ui-form-blank>';
          return template;
        }

      }
    },
    resolve: {
      businessBranchList: function (APIService, businessId) {
        return APIService.GetBusinessBranchList(businessId);
      },
    }
  },
  'tmsapp.main2.profile.business.branch.detail': {
    url: '/{branchid: [0-9]+|new}',
    views: {
      'megaform-form@^.^': {
        template: function (params) {
          let branch_attrs = {
            'branch-id': '$resolve.branchid',
            'business-id': '$resolve.businessId',
            'data': '$resolve.branchinfo'
          };
          let owner_attrs = {
            'data': '$resolve.primary_contact',
            'branch-id': '$resolve.branchid',
            'business-id': '$resolve.businessId'
          };
          let agent_attrs = {
            'branch-id': '$resolve.branchid',
            'business-id': '$resolve.businessId'
          };
          let template = '';
          template += '<ui-form-section-branch-information ' + stitch_attrs(branch_attrs) + ' ></ui-form-section-branch-information>';
          template += '<ui-form-section-owner-information ' + stitch_attrs(owner_attrs) + ' ></ui-form-section-owner-information>';
          template += '<ui-form-section-branch-contact ' + stitch_attrs(agent_attrs) + ' ></ui-form-section-branch-contact>';
          return template;
        }
      },
      'new-item@^': {
        template: function (params) {
          let template = "";
          if (params.branchid == 'new') {
            template = '<ui-list-insert type="branch-form" ui-sref-active="active" ></ui-list-insert>';
          }
          return template;
        }
      }
    },
    resolve: {
      branchid: function ($transition$) {
        return $transition$.params().branchid;
      },
      branchinfo: function (APIService, branchid) {
        return APIService.GetBranch(branchid).then(function (data) {
          delete data.primary_contact;
          return data;
        });

      },
      primary_contact: function (APIService, branchid) {
        return APIService.GetBranchPrimaryContact(branchid);
      }
    }
  },
  'tmsapp.main2.profile.business.staff': {
    url: '/staff',
    views: {
      'megaform-list': {
        template: function (params) {
          let list_attrs = {
            'type': "staff-form",
            'list': '$resolve.businessStaffList',
            'list-id': '$megaform.listid',
            'api-call': "'GetBusinessStaffList'",
            'api-params': "{businessId: $resolve.businessId}"
          };

          let template = '<ui-list ' + stitch_attrs(list_attrs) + '></ui-list>';
          return template;
        }
      },
      'megaform-form': {
        template: function (params) {
          let list_attrs = {
            'list': '$resolve.businessStaffList',
            'idname': 'staffId'
          };
          let template = '<ui-form-blank ' + stitch_attrs(list_attrs) + ' ></ui-form-blank>';
          return template;
        }

      }
    },
    resolve: {
      businessStaffList: function (APIService, businessId) {
        return APIService.GetBusinessStaffList(businessId);
      },
    }
  },
  'tmsapp.main2.profile.business.staff.detail': {
    url: '/{staffId: [0-9]+|new}',
    views: {
      'megaform-form@^.^': {
        template: function (params) {
          let personal_attrs = {
            'data': "$resolve.staffInfo",
            'business-id': '$resolve.businessId'
          };


          let template = '';
          template += '<ui-form-section-person-information ' + stitch_attrs(personal_attrs) + ' ></ui-form-section-person-information>';
          return template;
        }
      },
      'new-item@^': {
        template: function (params) {
          let template = "";
          if (params.staffId == 'new') {
            template = '<ui-list-insert type="staff-form" ui-sref-active="active" ></ui-list-insert>';
          }
          return template;
        }
      }
    },
    resolve: {
      isNew: function (staffId) {
        return staffId === 'new';
      },
      staffId: function ($transition$) {
        return $transition$.params().staffId;
      },
      staffInfo: function (APIService, businessId, staffId) {
        return APIService.GetBusinessStaff(businessId, staffId);
      }
    }
  },
  'tmsapp.main2.profile.business.driver': {
    url: '/driver',
    views: {
      'megaform-list': {
        template: function (params) {
          let list_attrs = {
            'type': "driver-form",
            'list': '$resolve.businessDriverList',
            'list-id': '$megaform.listid',
            'api-call': "'GetBusinessDriverList'",
            'api-params': "{businessId: $resolve.businessId}"
          };

          let template = '<ui-list ' + stitch_attrs(list_attrs) + '></ui-list>';
          return template;
        }
      },
      'megaform-form': {
        template: function (params) {
          let blank_attrs = {
            'list': '$resolve.businessDriverList',
            'idname': 'driverid'
          };
          let template = '<ui-form-blank ' + stitch_attrs(blank_attrs) + ' ></ui-form-blank>';
          return template;
        }
      }
    },
    resolve: {
      businessDriverList: function (APIService, businessId) {
        return APIService.GetBusinessDriverList(businessId);
      },
    }
  },
  'tmsapp.main2.profile.business.driver.detail': {
    url: '/{driverid: [0-9]+|new}',
    views: {
      'megaform-form@^.^': {
        template: function (params) {
          let personal_attrs = {
            'data': "$resolve.driverInfo",
            'business-id': '$resolve.businessId'
          };

          let work_attrs = {}
          let template = '';
          template += '<ui-form-section-person-information ' + stitch_attrs(personal_attrs) + ' ></ui-form-section-person-information>';
          return template;
        }
      },
      'new-item@^': {
        template: function (params) {
          let template = "";
          if (params.driverid == 'new') {
            let list_attrs = {
              'type': 'driver-form',
              'ui-sref-active': 'active'
            };
            template = '<ui-list-insert ' + stitch_attrs(list_attrs) + ' ></ui-list-insert>';
          }
          return template;
        }
      }
    },
    resolve: {
      driverInfo: function (APIService) {
        return APIService.GetBusinessDriver();
      }
    }
  },
  'tmsapp.main2.load': {
    url: '/load/{loadid:[0-9]+|new}',
    views: {
      'main-content-view@tmsapp.main2': {
        component: 'pageLayoutPrimary'
      },
      'page-content@.': {
        component: 'uiMegaForm'
      },
      'megaform-form@.': {
        template: function (params) {
          let template = "";

          let customer_attrs = {};
          let load_info_attrs = {};
          let rate_desc_attrs = {};
          let stops_attrs = {};

          template += '<ui-form-section-load-customer ' + stitch_attrs(customer_attrs) + ' ></ui-form-section-load-customer>';


          return template;

        }
      },
    },
    resolve: {
      pagesetup: function (PageService) {
        PageService.SetTitle('Load');
      }
    }
  },

  'tmsapp.main2.logistics': {
    url: '/logistics',
    abstract: true
  },
  'tmsapp.main2.logistics.directory': {
    url: '/dir',
    views: {
      "main-content-view@tmsapp.main2": {
        component: 'pageLayoutPrimary'
      }
    },
    resolve: {
      current_dept: function (PageService) {
        return PageService.SetDepartment('directory');
      }
    }

  },
  'tmsapp.main2.logistics.directory.business': {
    url: '/{businesstype: carrier|broker|customer}',
    redirectTo: 'tmsapp.main2.logistics.directory.business.list'
  },
  'tmsapp.main2.logistics.directory.business.list': {
    url: '/list',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        component: 'pageDirectoryCarriersAll'
      }
    },
    resolve: {
      pagesetup: function (PageService) {
        PageService.Clear();
        PageService.SetTitle('Carriers');
      }
    }
  },
  'tmsapp.main2.logistics.directory.business.detail': {
    url: '/{businessId: [0-9]+|new}',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        component: 'uiMegaForm'
      },
      'megaform-form@.': {
        template: function (params) {
          let type = params.businesstype;
          let template = '';
          let business_attrs = {
            'data': '$resolve.businessinfo',
            'business-id': '$resolve.businessId'
          };
          let insurance_attrs = {
            'business-id': '$resolve.businessId',
            // 'entity-id': '$resolve.entityId',
            'api-call': "'GetBusinessInsuranceEntity'",
            'api-params': '{businessId: $resolve.businessId}'
          };
          let state_attrs = {
            'business-id': '$resolve.businessId'
          };

          let ifta_attrs = {
            'data': '$resolve.iftaaccountData',
            'business-id': '$resolve.businessId'
          };

          switch (type) {
            case 'owner-operator':

              break;
            case 'carrier':
              business_attrs.type = 'business-carrier';
              template += '<ui-form-section-business-information ' + stitch_attrs(business_attrs) + ' ></ui-form-section-business-information>';
              template += '<ui-form-section-insurance-entity-information ' + stitch_attrs(insurance_attrs) + ' ></ui-form-section-insurance-entity-information>';
              template += '<ui-form-section-ifta-account ' + stitch_attrs(ifta_attrs) + ' ></ui-form-section-ifta-account>';
              template += '<ui-form-section-state-permit ' + stitch_attrs(state_attrs) + ' ></ui-form-section-state-permit>';
              break;
            case 'broker':
              break;
            case 'shipper':
              break;
            case 'general':
              template += '<ui-form-section-business-information ' + stitch_attrs(business_attrs) + ' ></ui-form-section-business-information>';
              template += '<ui-form-section-insurance-entity-information ' + stitch_attrs(insurance_attrs) + ' ></ui-form-section-insurance-entity-information>';
              break;
          }

          return template;
        }
      }
    },
    resolve: {
      businessData: function (APIService, businessId) {
        return APIService.GetBusiness(businessId);
      },
      pagesetup: function ($q, $transition$, PageService, businessId, businessData, businessIsNew) {
        let type = $transition$.params().businesstype;
        PageService.Clear();

        PageService.AddTab('overview', 'tmsapp.main2.logistics.directory.business.detail.overview');
        if (businessIsNew) {
          PageService.SetTitle(['new', type].join(' '));
        } else {
          PageService.SetTitle(businessData.BizName || 'nothing here');
          PageService.AddTab('addresses', 'tmsapp.main2.logistics.directory.business.detail.address');
          PageService.AddTab('contacts', 'tmsapp.main2.logistics.directory.business.detail.contact');
          switch (type) {
            case 'owner-operator':
              break;
            case 'carrier':
              PageService.AddTab('Drivers', 'tmsapp.main2.logistics.directory.business.detail.driver');
              break;
            case 'broker':
              break;
            case 'shipper':
              break;
            case 'general':

              break;
          }
        }
        return true;
      },
      // entityId: function (businessData) {
      //   return businessData.entity.EntityId;
      // },
      businessId: function ($transition$) {
        return $transition$.params().businessId;
      },
      businessIsNew: function (businessId) {
        return businessId === 'new';
      },
      businessType: function ($transition$) {
        return $transition$.params().businesstype;
      },
      businessinfo: function (businessData, businessIsNew) {
        if (businessIsNew) {
          return {};
        }
        return businessData;
      },
      iftaaccountData: function (APIService, businessId) {
        let query = {
          strict: {
            businessId: businessId
          }
        };
        return APIService.GetIFTAAccount(query).then(APIService.MakeSingle);
      }

    },
    redirectTo: 'tmsapp.main2.logistics.directory.business.detail.overview'
  },
  'tmsapp.main2.logistics.directory.business.detail.overview': {
    url: '/detail'

  },
  'tmsapp.main2.logistics.directory.business.detail.address': {
    url: '/address',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the address page'
      }
    }
  },
  'tmsapp.main2.logistics.directory.business.detail.address.detail': {
    url: '/{addressId: [0-9]+|new}/detail',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the address detail page'
      }
    }
  },
  'tmsapp.main2.logistics.directory.business.detail.contact': {
    url: '/contact',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the contact page'
      }
    }
  },
  'tmsapp.main2.logistics.directory.business.detail.contact.detail': {
    url: '/{contactId: [0-9]+|new}/detail',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the contact detail page'
      }
    }
  },
  'tmsapp.main2.logistics.directory.business.detail.driver': {
    url: '/driver',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the driver page'
      }
    }

  },
  'tmsapp.main2.logistics.directory.business.detail.driver.detail': {
    url: '/{driverId: [0-9]+|new}/detail',
    views: {
      'page-content@tmsapp.main2.logistics.directory': {
        template: 'this is the driver detail page'
      }
    }
  }
}