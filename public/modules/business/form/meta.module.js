class MetaBusinessFormCtrl {
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
          "Features": {
            "tree": {},
            "attr": {
              "title": "Features",
              "alias": "TA06.Features",
              "required": null,
              "label": "Features"
            }
          },
          "Number": {
            "tree": {},
            "attr": {
              "label": "Number",
              "required": "required",
              "title": "Number",
              "alias": "TA06.Number"
            }
          },
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "alias": "TA06.PhnFaxId",
              "title": "PhnFaxId",
              "label": "PhnFaxId",
              "required": null
            }
          },
          "Mobility": {
            "tree": {},
            "attr": {
              "title": "Mobility",
              "alias": "TA06.Mobility",
              "required": null,
              "label": "Mobility"
            }
          },
          "Notes": {
            "tree": {},
            "attr": {
              "alias": "TA06.Notes",
              "title": "Notes",
              "label": "Notes",
              "required": null
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
          "AddrId": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "AddrId",
              "alias": "TA05.AddrId",
              "title": "AddrId"
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
          "GpsLng": {
            "tree": {},
            "attr": {
              "label": "GpsLng",
              "required": null,
              "alias": "TA05.GpsLng",
              "title": "GpsLng"
            }
          },
          "Notes": {
            "attr": {
              "label": "Notes",
              "required": null,
              "title": "Notes",
              "alias": "TA05.Notes"
            },
            "tree": {}
          },
          "GpsLat": {
            "attr": {
              "alias": "TA05.GpsLat",
              "title": "GpsLat",
              "required": null,
              "label": "GpsLat"
            },
            "tree": {}
          },
          "Street3": {
            "attr": {
              "alias": "TA05.Street3",
              "title": "Street3",
              "required": null,
              "label": "Street3"
            },
            "tree": {}
          },
          "Street2": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "Street2",
              "title": "Street",
              "alias": "TA05.Street2"
            }
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
          },
          "BizURL": {
            "attr": {
              "title": "BizURL",
              "alias": "TA02.BizURL",
              "label": "BizURL",
              "required": null
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
      },
      "OfficeName": {
        "attr": {
          "label": "OfficeName",
          "required": null,
          "alias": "TA01.OfficeName",
          "title": "OfficeName"
        },
        "tree": {}
      },
      "BrnchFax": {
        "attr": {
          "alias": "TA01.BrnchFax",
          "title": "BrnchFax",
          "required": null,
          "label": "BrnchFax"
        },
        "tree": {
          "Extension": {
            "tree": {},
            "attr": {
              "alias": "TA07.Extension",
              "title": "Extension",
              "label": "Extension",
              "required": null
            }
          },
          "Notes": {
            "attr": {
              "title": "Notes",
              "alias": "TA07.Notes",
              "required": null,
              "label": "Notes"
            },
            "tree": {}
          },
          "Mobility": {
            "attr": {
              "required": null,
              "label": "Mobility",
              "title": "Mobility",
              "alias": "TA07.Mobility"
            },
            "tree": {}
          },
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "title": "PhnFaxId",
              "alias": "TA07.PhnFaxId",
              "required": null,
              "label": "PhnFaxId"
            }
          },
          "Features": {
            "attr": {
              "label": "Features",
              "required": null,
              "alias": "TA07.Features",
              "title": "Features"
            },
            "tree": {}
          },
          "Number": {
            "tree": {},
            "attr": {
              "label": "Number",
              "required": "required",
              "alias": "TA07.Number",
              "title": "Number"
            }
          }
        }
      },
      "BrnchEMail": {
        "tree": {},
        "attr": {
          "required": null,
          "label": "BrnchEMail",
          "alias": "TA01.BrnchEMail",
          "title": "BrnchEMail"
        }
      }
    };
  }
}

app.controller('MetaBusinessFormCtrl', MetaBusinessFormCtrl);
app.component('metaBusinessForm', {
  templateUrl: 'modules/business/form/meta.template.html',
  controller: 'MetaBusinessFormCtrl',
  bindings: meta_bindings
});