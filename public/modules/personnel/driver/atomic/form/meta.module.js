class MetaDriverPartFormCtrl extends MetaGateCtrl {
  constructor() {
    super();

    this.imeta = {
      "PullNotice": {
        "tree": {},
        "attr": {
          "label": "PullNotice",
          "alias": "TA01.PullNotice",
          "title": "PullNotice",
          "required": null
        }
      },
      "LastAnnualReview": {
        "attr": {
          "label": "LastAnnualReview",
          "alias": "TA01.LastAnnualReview",
          "title": "LastAnnualReview",
          "required": null
        },
        "tree": {}
      },
      "DriverId": {
        "attr": {
          "required": null,
          "title": "DriverId",
          "alias": "TA01.DriverId",
          "label": "DriverId"
        },
        "tree": {}
      },
      "LocalRoutes": {
        "tree": {},
        "attr": {
          "alias": "TA01.LocalRoutes",
          "required": null,
          "title": "LocalRoutes",
          "label": "LocalRoutes"
        }
      },
      "InternationalRoutes": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "InternationalRoutes",
          "alias": "TA01.InternationalRoutes",
          "label": "InternationalRoutes"
        }
      }
    };
  }
}

app.controller('MetaDriverPartFormCtrl',MetaDriverPartFormCtrl);
app.component('metaDriverPartForm',{
  templateUrl: 'modules/personnel/driver/atomic/form/meta.template.html',
  controller: 'MetaDriverPartFormCtrl',
  bindings: meta_bindings
});