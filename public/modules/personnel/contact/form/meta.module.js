class MetaContactFormCtrl {
  constructor() {
    this.meta = {
      "AstId": {
        "attr": {
          "label": "AstId",
          "title": "AstId",
          "required": null
        },
        "tree": {
          "LastName": {
            "tree": {},
            "attr": {
              "title": "LastName",
              "required": "required",
              "label": "LastName"
            }
          },
          "FirstName": {
            "tree": {},
            "attr": {
              "required": "required",
              "title": "FirstName",
              "label": "FirstName"
            }
          },
          "PrsnId": {
            "tree": {},
            "attr": {
              "label": "PrsnId",
              "required": null,
              "title": "PrsnId"
            }
          }
        }
      },
      "BizPhone": {
        "attr": {
          "label": "BizPhone",
          "required": null,
          "title": "BizPhone"
        },
        "tree": {
          "Extension": {
            "attr": {
              "title": "Extension",
              "required": null,
              "label": "Extension"
            },
            "tree": {}
          },
          "Number": {
            "tree": {},
            "attr": {
              "title": "Number",
              "required": "required",
              "label": "Number"
            }
          }
        }
      }
    };
  }
}


app.controller('MetaContactFormCtrl', MetaContactFormCtrl);
app.component('metaContactForm', {
  templateUrl: 'modules/personnel/contact/form/meta.template.html',
  controller: 'MetaContactFormCtrl',
  bindings: meta_bindings
});