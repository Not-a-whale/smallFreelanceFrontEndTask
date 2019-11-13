class MetaBusinessMCFormCtrl {
  constructor() {

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
        },
        "RootNode": {
          "attr": {
            "label": "RootNode",
            "required": null,
            "title": "RootNode"
          },
          "tree": {}
        },
        "BizId": {
          "tree": {},
          "attr": {
            "title": "BizId",
            "required": null,
            "label": "BizId"
          }
        },
        "BizURL": {
          "tree": {},
          "attr": {
            "required": null,
            "title": "BizURL",
            "label": "BizURL"
          }
        }
      }
    };

    this.meta = {
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
          "Features": {
            "tree": {},
            "attr": {
              "label": "Features",
              "title": "Features",
              "required": null
            }
          },
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "label": "PhnFaxId",
              "title": "PhnFaxId",
              "required": null
            }
          },
          "Mobility": {
            "tree": {},
            "attr": {
              "label": "Mobility",
              "required": null,
              "title": "Mobility"
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
          "Notes": {
            "attr": {
              "title": "Notes",
              "required": null,
              "label": "Notes"
            },
            "tree": {}
          },
          "Extension": {
            "tree": {},
            "attr": {
              "title": "Extension",
              "required": null,
              "label": "Extension"
            }
          },
          "Features": {
            "tree": {},
            "attr": {
              "label": "Features",
              "title": "Features",
              "required": null
            }
          },
          "Mobility": {
            "attr": {
              "required": null,
              "title": "Mobility",
              "label": "Mobility"
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
      "BrnchEMail": {
        "tree": {},
        "attr": {
          "label": "BrnchEMail",
          "required": null,
          "title": "BrnchEMail"
        }
      },
      "CstmrId": bizmeta,
      "DontUse": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "Do not use",
          "label": "DontUse"
        }
      },
      "SCAC": {
        "tree": {},
        "attr": {
          "label": "SCAC",
          "required": null,
          "title": "SCACC"
        }
      },
      "OfficeName": {
        "attr": {
          "required": null,
          "title": "OfficeName",
          "label": "OfficeName"
        },
        "tree": {}
      },
      "BrnchId": {
        "attr": {
          "label": "BrnchId",
          "required": null,
          "title": "BrnchId"
        },
        "tree": {}
      },
      "Bond": {
        "attr": {
          "required": null,
          "title": "Bond",
          "label": "Bond"
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
          "GpsLng": {
            "attr": {
              "label": "GpsLng",
              "title": "GpsLng",
              "required": null
            },
            "tree": {}
          },
          "AddrId": {
            "tree": {},
            "attr": {
              "label": "AddrId",
              "title": "AddrId",
              "required": null
            }
          },
          "State": {
            "tree": {},
            "attr": {
              "title": "State",
              "required": "required",
              "label": "State"
            }
          },
          "Street2": {
            "attr": {
              "title": "Street",
              "required": null,
              "label": "Street2"
            },
            "tree": {}
          },
          "GpsLat": {
            "attr": {
              "required": null,
              "title": "GpsLat",
              "label": "GpsLat"
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
          },
          "Notes": {
            "tree": {},
            "attr": {
              "label": "Notes",
              "title": "Notes",
              "required": null
            }
          },
          "Street3": {
            "tree": {},
            "attr": {
              "title": "Street3",
              "required": null,
              "label": "Street3"
            }
          }
        }
      }
    };
  }
}

app.controller('MetaBusinessMCFormCtrl', MetaBusinessMCFormCtrl);
app.component('metaBusinessMcForm', {
  templateUrl: 'modules/business/simple/mc/form/meta.template.html',
  controller: 'MetaBusinessMCFormCtrl',
  bindings: meta_bindings
});