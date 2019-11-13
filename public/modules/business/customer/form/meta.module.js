class MetaBusinessCustomerFormCtrl {
  constructor() {
    this.meta = {
      "DUNS": {
        "attr": {
          "required": null,
          "title": "DUNS",
          "label": "DUNS"
        },
        "tree": {}
      },
      "CstmrId": {
        "tree": {
          "RootNode": {
            "attr": {
              "required": null,
              "title": "RootNode",
              "label": "RootNode"
            },
            "tree": {}
          },
          "BizId": {
            "attr": {
              "label": "BizId",
              "required": null,
              "title": "BizId"
            },
            "tree": {}
          },
          "BizURL": {
            "attr": {
              "label": "BizURL",
              "title": "BizURL",
              "required": null
            },
            "tree": {}
          },
          "BizName": {
            "attr": {
              "label": "BizName",
              "required": "required",
              "title": "BizName"
            },
            "tree": {}
          }
        },
        "attr": {
          "label": "CstmrId",
          "title": "CstmrId",
          "required": null
        }
      },
      "DOT": {
        "tree": {},
        "attr": {
          "label": "DOT",
          "title": "DOT",
          "required": null
        }
      },
      "SCAC": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "SCACC",
          "label": "SCAC"
        }
      },
      "Factoring": {
        "attr": {
          "title": "Factoring",
          "required": null,
          "label": "Factoring"
        },
        "tree": {}
      },
      "CreditLimit": {
        "attr": {
          "label": "CreditLimit",
          "title": "Credit Limit",
          "required": null
        },
        "tree": {}
      },
      "WhyDontUse": {
        "attr": {
          "label": "WhyDontUse",
          "required": null,
          "title": "Why do not use"
        },
        "tree": {}
      },
      "Bond": {
        "tree": {},
        "attr": {
          "label": "Bond",
          "title": "Bond",
          "required": null
        }
      },
      "DontUse": {
        "tree": {},
        "attr": {
          "title": "Do not use",
          "required": null,
          "label": "DontUse"
        }
      },
      "Terms": {
        "attr": {
          "title": "Payment terms",
          "required": null,
          "label": "Terms"
        },
        "tree": {}
      },
      "MC": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "MC number",
          "label": "MC"
        }
      }
    };
  }
}

app.controller('MetaBusinessCustomerFormCtrl', MetaBusinessCustomerFormCtrl);
app.component('metaBusinessCustomerForm', {
  templateUrl: 'modules/business/customer/form/meta.template.html',
  controller: 'MetaBusinessCustomerFormCtrl',
  bindings: meta_bindings
});