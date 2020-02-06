class MetaBusinessMCSimpleFormCtrl extends MetaGateCtrl{
  constructor() {
    super();
    let bizmeta = {
      "attr": {
        "label": "BizId",
        "title": "BizId",
        "required": "required"
      },
      "tree": {
        "BizName": {
          "tree": {},
          "attr": {
            "required": "required",
            "title": "BizName",
            "label": "BizName"
          }
        }
      }
    };

    this.imeta = {
      "BrnchPhone": {
        "tree": {
          "Notes": {
            "tree": {},
            "attr": {
              "title": "Notes",
              "required": null,
              "label": "Notes"
            }
          },
          "Extension": {
            "tree": {},
            "attr": {
              "label": "Extension",
              "title": "Extension",
              "required": null
            }
          },
          "Number": {
            "attr": {
              "label": "Number",
              "title": "Number",
              "required": "required"
            },
            "tree": {}
          }
        },
        "attr": {
          "label": "BrnchPhone",
          "title": "BrnchPhone",
          "required": "required"
        }
      },
      "BizId": bizmeta,
      "MC": {
        "tree": {},
        "attr": {
          "title": "MC number",
          "required": null,
          "label": "MC"
        }
      },
      "DOT": {
        "tree": {},
        "attr": {
          "title": "DOT",
          "required": null,
          "label": "DOT"
        }
      },
      "DUNS": {
        "tree": {},
        "attr": {
          "title": "DUNS",
          "required": null,
          "label": "DUNS"
        }
      },
      "BrnchFax": {
        "attr": {
          "required": null,
          "title": "BrnchFax",
          "label": "BrnchFax"
        },
        "tree": {
          "Extension": {
            "tree": {},
            "attr": {
              "title": "Extension",
              "required": null,
              "label": "Extension"
            }
          },

          "Number": {
            "attr": {
              "label": "Number",
              "required": "required",
              "title": "Number"
            },
            "tree": {}
          }
        }
      },
      "CstmrId": bizmeta,
      "SCAC": {
        "tree": {},
        "attr": {
          "label": "SCAC",
          "required": null,
          "title": "SCACC"
        }
      },
      "BrnchId": {
        "attr": {
          "label": "BrnchId",
          "required": null,
          "title": "BrnchId"
        },
        "tree": {}
      },

      "BrnchAddress": {
        "attr": {
          "label": "BrnchAddress",
          "required": "required",
          "title": "BrnchAddress"
        },
        "tree": {
          "State": {
            "tree": {},
            "attr": {
              "title": "State",
              "required": "required",
              "label": "State"
            }
          },
          "Country": {
            "attr": {
              "required": null,
              "title": "Country",
              "label": "Country"
            },
            "tree": {}
          },
          "Zip": {
            "attr": {
              "label": "Zip",
              "required": "required",
              "title": "Zip"
            },
            "tree": {}
          },
          "City": {
            "attr": {
              "title": "City",
              "required": "required",
              "label": "City"
            },
            "tree": {}
          },
          "Street1": {
            "attr": {
              "label": "Street1",
              "required": "required",
              "title": "Street or P.O. Box"
            },
            "tree": {}
          }
        }
      }
    };
  }
}

app.controller('MetaBusinessMCSimpleFormCtrl', MetaBusinessMCSimpleFormCtrl);
app.component('metaBusinessMcSimpleForm', {
  templateUrl: 'modules/business/simple/mc/form/meta.template.html',
  controller: 'MetaBusinessMCSimpleFormCtrl',
  bindings: meta_bindings
});