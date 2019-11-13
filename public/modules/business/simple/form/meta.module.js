class MetaBusinessSimpleFormCtrl {
  constructor() {
    this.meta = {
      "BrnchId": {
        "tree": {},
        "attr": {
          "required": null,
          "label": "BrnchId",
          "alias": "TA01.BrnchId",
          "title": "BrnchId"
        }
      },
      "BrnchPhone": {
        "attr": {
          "alias": "TA01.BrnchPhone",
          "title": "BrnchPhone",
          "required": "required",
          "label": "BrnchPhone"
        },
        "tree": {
          "Number": {
            "tree": {},
            "attr": {
              "label": "Number",
              "required": "required",
              "title": "Number",
              "alias": "TA06.Number"
            }
          },
          "Extension": {
            "attr": {
              "alias": "TA06.Extension",
              "title": "Extension",
              "label": "Extension",
              "required": null
            },
            "tree": {}
          }
        }
      },
      "BrnchAddress": {
        "tree": {
          "Zip": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "Zip",
              "alias": "TA05.Zip",
              "title": "Zip"
            }
          },
          "State": {
            "attr": {
              "alias": "TA05.State",
              "title": "State",
              "label": "State",
              "required": "required"
            },
            "tree": {}
          },
          "Country": {
            "attr": {
              "alias": "TA05.Country",
              "title": "Country",
              "label": "Country",
              "required": null
            },
            "tree": {}
          },
          "City": {
            "attr": {
              "required": "required",
              "label": "City",
              "title": "City",
              "alias": "TA05.City"
            },
            "tree": {}
          },
          "Street1": {
            "tree": {},
            "attr": {
              "label": "Street1",
              "required": "required",
              "title": "Street or P.O. Box",
              "alias": "TA05.Street1"
            }
          }
        },
        "attr": {
          "title": "BrnchAddress",
          "alias": "TA01.BrnchAddress",
          "label": "BrnchAddress",
          "required": "required"
        }
      },
      "BizId": {
        "tree": {
          "RootNode": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "RootNode",
              "title": "RootNode",
              "alias": "TA02.RootNode"
            }
          },
          "BizName": {
            "tree": {},
            "attr": {
              "label": "BizName",
              "required": "required",
              "alias": "TA02.BizName",
              "title": "BizName"
            }
          },
          "BizId": {
            "attr": {
              "alias": "TA02.BizId",
              "title": "BizId",
              "required": null,
              "label": "BizId"
            },
            "tree": {}
          }
        },
        "attr": {
          "alias": "TA01.BizId",
          "title": "BizId",
          "required": "required",
          "label": "BizId"
        }
      }
    };
  }
}

app.controller('MetaBusinessSimpleFormCtrl', MetaBusinessSimpleFormCtrl);
app.component('metaBusinessSimpleForm', {
  templateUrl: 'modules/business/simple/form/meta.template.html',
  controller: 'MetaBusinessSimpleFormCtrl',
  bindings: meta_bindings
});