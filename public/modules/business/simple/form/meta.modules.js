class MetaBusinessSimpleFormCtrl {
  constructor() {
    this.meta = {
      "BrnchFax": {
        "tree": {
          "Notes": {
            "attr": {
              "required": null,
              "label": "Notes",
              "title": "Notes"
            },
            "tree": {}
          },
          "Features": {
            "attr": {
              "required": null,
              "label": "Features",
              "title": "Features"
            },
            "tree": {}
          },
          "PhnFaxId": {
            "attr": {
              "required": null,
              "title": "PhnFaxId",
              "label": "PhnFaxId"
            },
            "tree": {}
          },
          "Mobility": {
            "attr": {
              "title": "Mobility",
              "label": "Mobility",
              "required": null
            },
            "tree": {}
          },
          "Extension": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "Extension",
              "title": "Extension"
            }
          },
          "Number": {
            "attr": {
              "title": "Number",
              "label": "Number",
              "required": "required"
            },
            "tree": {}
          }
        },
        "attr": {
          "required": null,
          "title": "BrnchFax",
          "label": "BrnchFax"
        }
      },
      "BrnchId": {
        "attr": {
          "label": "BrnchId",
          "title": "BrnchId",
          "required": null
        },
        "tree": {}
      },
      "BizId": {
        "tree": {
          "RootNode": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "RootNode",
              "title": "RootNode"
            }
          },
          "BizName": {
            "tree": {},
            "attr": {
              "required": "required",
              "title": "BizName",
              "label": "BizName"
            }
          },
          "BizURL": {
            "attr": {
              "title": "BizURL",
              "label": "BizURL",
              "required": null
            },
            "tree": {}
          },
          "BizId": {
            "attr": {
              "required": null,
              "title": "BizId",
              "label": "BizId"
            },
            "tree": {}
          }
        },
        "attr": {
          "required": "required",
          "title": "BizId",
          "label": "BizId"
        }
      },
      "BrnchEMail": {
        "attr": {
          "title": "BrnchEMail",
          "label": "BrnchEMail",
          "required": null
        },
        "tree": {}
      },
      "BrnchPhone": {
        "tree": {
          "Number": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "Number",
              "title": "Number"
            }
          },
          "Extension": {
            "attr": {
              "title": "Extension",
              "label": "Extension",
              "required": null
            },
            "tree": {}
          },
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "PhnFaxId",
              "label": "PhnFaxId"
            }
          }
        },
        "attr": {
          "required": "required",
          "label": "BrnchPhone",
          "title": "BrnchPhone"
        }
      },
      "BrnchAddress": {
        "tree": {
          "City": {
            "attr": {
              "label": "City",
              "title": "City",
              "required": "required"
            },
            "tree": {}
          },
          "Country": {
            "attr": {
              "required": null,
              "title": "Country",
              "label": "Country"
            },
            "tree": {}
          },
          "GpsLat": {
            "tree": {},
            "attr": {
              "title": "GpsLat",
              "label": "GpsLat",
              "required": null
            }
          },
          "Street3": {
            "attr": {
              "required": null,
              "title": "Street3",
              "label": "Street3"
            },
            "tree": {}
          },
          "Notes": {
            "attr": {
              "required": null,
              "label": "Notes",
              "title": "Notes"
            },
            "tree": {}
          },
          "AddrId": {
            "attr": {
              "required": null,
              "label": "AddrId",
              "title": "AddrId"
            },
            "tree": {}
          },
          "GpsLng": {
            "attr": {
              "label": "GpsLng",
              "title": "GpsLng",
              "required": null
            },
            "tree": {}
          },
          "Street1": {
            "attr": {
              "title": "Street or P.O. Box",
              "label": "Street1",
              "required": "required"
            },
            "tree": {}
          },
          "State": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "State",
              "title": "State"
            }
          },
          "Street2": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "Street2",
              "title": "Street"
            }
          },
          "Zip": {
            "attr": {
              "title": "Zip",
              "label": "Zip",
              "required": "required"
            },
            "tree": {}
          }
        },
        "attr": {
          "title": "BrnchAddress",
          "label": "BrnchAddress",
          "required": "required"
        }
      },
      "OfficeName": {
        "attr": {
          "required": null,
          "title": "OfficeName",
          "label": "OfficeName"
        },
        "tree": {}
      }
    };
  }
}

app.controller('MetaBusinessSimpleFormCtrl', MetaBusinessSimpleFormCtrl);
app.component('metaBusinessSimpleForm', {
  templateUrl: 'modules/business/simple/form/meta.template.html',
  controller: 'MetaBusinessSimpleCtrl',
  bindings: meta_bindings
});