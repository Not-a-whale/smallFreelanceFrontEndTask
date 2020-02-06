/*
  Purpose of this class is to hold the configuration data for all the forms
  and fetch them from the server when needed,

  also responsible for creating all the form states.
*/

class MetaFormService {
  constructor(http, uirouter, q) {
    this.http = http;
    this.uirouter = uirouter;
    this.q = q;

    this.MODULAR = 'mod';
    this.SECTIONAL = 'sec';

    this.forms = {};
    this.forms[this.MODULAR] = undefined;
    this.forms[this.SECTIONAL] = undefined;
    // where to fetch the meta data from the form types
    this.url = {};
    this.url[this.MODULAR] = 'modularforms.json';
    this.url[this.SECTIONAL] = 'sectionalforms.json';
    this.RegisterStates();
  }

  RegisterStates() {
    // let state = this.uirouter.stateRegistry.register({
    //   name: 'itworks',
    //   url: "/itworks",
    //   views: {
    //     "main": {
    //       template: '<div>indeed it does</div>'
    //     }
    //   }
    // });

    // this part needs to be added to a state if you want to load it when you load a state
    // resolve: {
    //   nothing: function(MetaFormService){
    //     MetaFormService.RegisterStates('nothing');
    //   }
    // }

  }

  /* returns a promise */
  NewTruckForm() {
    return this.BuildForm('New Truck');
  }

  NewLoadForm(){
    return this.BuildForm('New Load');
  }

  NewTrailerForm(){
    return this.BuildForm('New Trailer');
  }

  NewDriverForm(){
    return this.BuildForm('New Driver');
  }

  NewEquipmentForm(){
    return this.BuildForm('New Equipment');
  }

  NewCarrierForm(){
    return this.BuildForm('New Carrier');
  }

  NewOwnerOperatorForm(){
    return this.BuildForm('New Owner-Operator');
  }

  NewCompanyForm(){
    return this.BuildForm('New Company');
  }

  NewEmployeeForm(){
    return this.BuildForm('New Employee');
  }

  NewCustomerForm(){
    return this.BuildForm('New Customer');
  }

  NewAssociateForm(){
    return this.BuildForm('New Associate');
  }

  NewShipperForm(){
    return this.BuildForm('New Shipper');
  }

  NewUserForm(){
    return this.BuildForm('New User');
  }

  FindForm(name) {
    let found = undefined;
    for (let index in this.forms[this.MODULAR]) {
      let form = this.forms[this.MODULAR][index];
      if (form.title === name) {
        found = form;
        break;
      }
    }
    return found;
  }

  /* return a promise */
  BuildForm(name) {
    var self = this;
    let promise = this.FetchForms().then(function (res) {
      let form = self.FindForm(name);
      let formdata = {
        title: form.title,
        sectionals: []
      };
      if (form) {
        for (let section of form.sectionals) {
          let sform = self.forms[self.SECTIONAL][section.title];
          formdata.sectionals.push({
            title: section.title || sform.title,
            optional: section.optional || sform.title,
            enabled: section.enabled || sform.enabled || false,
            viewname: section.viewname || sform.viewname,
            component: section.component || sform.component
          });
        }
      } else {
        console.error('Requested form does not exist');
      }
      return formdata;
    });
    return promise;
  }

  /* Function to asynchronous fetch the forms from server   */
  FetchForms() {
    var self = this;
    let defer = {};
    defer[this.MODULAR] = this.q.defer();
    defer[this.SECTIONAL] = this.q.defer();
    for(let type of [this.MODULAR, this.SECTIONAL]){
      if (this.forms[type] == undefined){
        defer[type].promimse = this.http.get(this.url[type]).then(function (res) {
          defer[type].resolve(self.forms[type] = res.data);
        }, function(res){
          console.error('Could not find form at ' + self.url[type]);
        });
      } else {
        defer[type].resolve(this.forms[type]);
      }
    }
    return this.q.all([defer[this.MODULAR].promise, defer[this.SECTIONAL].promise]);
  }
}


app.service('MetaFormService', ['$http', '$uiRouter', '$q', MetaFormService]);