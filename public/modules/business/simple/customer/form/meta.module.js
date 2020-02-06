class MetaBusinessCustomerSimpleFormCtrl extends MetaGateCtrl{
  constructor(){
    super();
    this.imeta = {
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

app.controller('MetaBusinessCustomerSimpleFormCtrl', MetaBusinessCustomerSimpleFormCtrl);
app.component('metaBusinessCustomerSimpleForm', {
  templateUrl: 'modules/business/customer/form/meta.template.html',
  controller: 'MetaBusinessCustomerSimpleFormCtrl',
  bindings: meta_bindings
});