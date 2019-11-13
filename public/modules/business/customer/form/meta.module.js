class MetaBusinessCustomerFormCtrl extends MetaGateCtrl {
  constructor() {
    super();
    let bizmeta = {
      "attr": {
        "label": "BizId",
        "alias": "TA01.BizId",
        "required": "required",
        "title": "BizId"
      },
      "tree": {
        "BizURL": {
          "tree": {},
          "attr": {
            "required": null,
            "title": "BizURL",
            "alias": "TA02.BizURL",
            "label": "BizURL"
          }
        },
        "BizName": {
          "tree": {},
          "attr": {
            "required": "required",
            "title": "BizName",
            "alias": "TA02.BizName",
            "label": "BizName"
          }
        },
        "BizId": {
          "tree": {},
          "attr": {
            "alias": "TA02.BizId",
            "label": "BizId",
            "required": null,
            "title": "BizId"
          }
        },
        "RootNode": {
          "attr": {
            "label": "RootNode",
            "alias": "TA02.RootNode",
            "title": "RootNode",
            "required": null
          },
          "tree": {}
        }
      }
    };
    this.imeta = {
      "Bond": {
        "tree": {},
        "attr": {
          "label": "Bond",
          "alias": "TB01.Bond",
          "required": null,
          "title": "Bond"
        }
      },
      "OfficeName": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "OfficeName",
          "alias": "TA01.OfficeName",
          "label": "OfficeName"
        }
      },
      "DOT": {
        "tree": {},
        "attr": {
          "label": "DOT",
          "alias": "TB01.DOT",
          "title": "DOT",
          "required": null
        }
      },
      "BrnchFax": {
        "attr": {
          "title": "BrnchFax",
          "required": null,
          "label": "BrnchFax",
          "alias": "TA01.BrnchFax"
        },
        "tree": {
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "alias": "TA07.PhnFaxId",
              "label": "PhnFaxId",
              "required": null,
              "title": "PhnFaxId"
            }
          },
          "Features": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "Features",
              "label": "Features",
              "alias": "TA07.Features"
            }
          },
          "Number": {
            "tree": {},
            "attr": {
              "label": "Number",
              "alias": "TA07.Number",
              "required": "required",
              "title": "Number"
            }
          },
          "Extension": {
            "tree": {},
            "attr": {
              "title": "Extension",
              "required": null,
              "alias": "TA07.Extension",
              "label": "Extension"
            }
          },
          "Mobility": {
            "tree": {},
            "attr": {
              "alias": "TA07.Mobility",
              "label": "Mobility",
              "title": "Mobility",
              "required": null
            }
          },
          "Notes": {
            "attr": {
              "label": "Notes",
              "alias": "TA07.Notes",
              "title": "Notes",
              "required": null
            },
            "tree": {}
          }
        }
      },
      "Terms": {
        "attr": {
          "required": null,
          "title": "Payment terms",
          "alias": "TB01.Terms",
          "label": "Terms"
        },
        "tree": {}
      },
      "BrnchAddress": {
        "attr": {
          "required": "required",
          "title": "BrnchAddress",
          "label": "BrnchAddress",
          "alias": "TA01.BrnchAddress"
        },
        "tree": {
          "State": {
            "attr": {
              "label": "State",
              "alias": "TA05.State",
              "title": "State",
              "required": "required"
            },
            "tree": {}
          },
          "GpsLng": {
            "attr": {
              "alias": "TA05.GpsLng",
              "label": "GpsLng",
              "title": "GpsLng",
              "required": null
            },
            "tree": {}
          },
          "City": {
            "attr": {
              "title": "City",
              "required": "required",
              "label": "City",
              "alias": "TA05.City"
            },
            "tree": {}
          },
          "AddrId": {
            "attr": {
              "alias": "TA05.AddrId",
              "label": "AddrId",
              "title": "AddrId",
              "required": null
            },
            "tree": {}
          },
          "Zip": {
            "attr": {
              "alias": "TA05.Zip",
              "label": "Zip",
              "title": "Zip",
              "required": "required"
            },
            "tree": {}
          },
          "Notes": {
            "attr": {
              "alias": "TA05.Notes",
              "label": "Notes",
              "required": null,
              "title": "Notes"
            },
            "tree": {}
          },
          "Street1": {
            "attr": {
              "title": "Street or P.O. Box",
              "required": "required",
              "alias": "TA05.Street1",
              "label": "Street1"
            },
            "tree": {}
          },
          "Street3": {
            "tree": {},
            "attr": {
              "alias": "TA05.Street3",
              "label": "Street3",
              "required": null,
              "title": "Street3"
            }
          },
          "Country": {
            "attr": {
              "required": null,
              "title": "Country",
              "label": "Country",
              "alias": "TA05.Country"
            },
            "tree": {}
          },
          "GpsLat": {
            "tree": {},
            "attr": {
              "label": "GpsLat",
              "alias": "TA05.GpsLat",
              "required": null,
              "title": "GpsLat"
            }
          },
          "Street2": {
            "attr": {
              "alias": "TA05.Street2",
              "label": "Street2",
              "required": null,
              "title": "Street"
            },
            "tree": {}
          }
        }
      },
      "SCAC": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "SCACC",
          "label": "SCAC",
          "alias": "TB01.SCAC"
        }
      },
      "DUNS": {
        "tree": {},
        "attr": {
          "alias": "TB01.DUNS",
          "label": "DUNS",
          "title": "DUNS",
          "required": null
        }
      },
      "CreditLimit": {
        "tree": {},
        "attr": {
          "title": "Credit Limit",
          "required": null,
          "label": "CreditLimit",
          "alias": "TB01.CreditLimit"
        }
      },
      "DontUse": {
        "attr": {
          "alias": "TB01.DontUse",
          "label": "DontUse",
          "title": "Do not use",
          "required": null
        },
        "tree": {}
      },
      "Factoring": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "Factoring",
          "label": "Factoring",
          "alias": "TB01.Factoring"
        }
      },
      "BrnchPhone": {
        "attr": {
          "alias": "TA01.BrnchPhone",
          "label": "BrnchPhone",
          "title": "BrnchPhone",
          "required": "required"
        },
        "tree": {
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "alias": "TA06.PhnFaxId",
              "label": "PhnFaxId",
              "title": "PhnFaxId",
              "required": null
            }
          },
          "Features": {
            "tree": {},
            "attr": {
              "alias": "TA06.Features",
              "label": "Features",
              "required": null,
              "title": "Features"
            }
          },
          "Number": {
            "tree": {},
            "attr": {
              "alias": "TA06.Number",
              "label": "Number",
              "title": "Number",
              "required": "required"
            }
          },
          "Mobility": {
            "attr": {
              "title": "Mobility",
              "required": null,
              "label": "Mobility",
              "alias": "TA06.Mobility"
            },
            "tree": {}
          },
          "Extension": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "Extension",
              "label": "Extension",
              "alias": "TA06.Extension"
            }
          },
          "Notes": {
            "attr": {
              "title": "Notes",
              "required": null,
              "label": "Notes",
              "alias": "TA06.Notes"
            },
            "tree": {}
          }
        }
      },
      "CstmrId": bizmeta,
      "BizId": bizmeta,
      "BrnchEMail": {
        "attr": {
          "required": null,
          "title": "BrnchEMail",
          "label": "BrnchEMail",
          "alias": "TA01.BrnchEMail"
        },
        "tree": {}
      },
      "WhyDontUse": {
        "attr": {
          "label": "WhyDontUse",
          "alias": "TB01.WhyDontUse",
          "required": null,
          "title": "Why do not use"
        },
        "tree": {}
      },
      "MC": {
        "attr": {
          "label": "MC",
          "alias": "TB01.MC",
          "title": "MC number",
          "required": null
        },
        "tree": {}
      },
      "BrnchId": {
        "attr": {
          "label": "BrnchId",
          "alias": "TA01.BrnchId",
          "title": "BrnchId",
          "required": null
        },
        "tree": {}
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