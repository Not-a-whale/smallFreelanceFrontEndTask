class MetaBusinessMCFormCtrl extends MetaGateCtrl {
  constructor() {
    super();
    let bizmeta = {
      "BizName": {
        "attr": {
          "required": "required",
          "title": "BizName",
          "label": "BizName",
          "alias": "TB02.BizName"
        },
        "tree": {}
      },
      "BizId": {
        "attr": {
          "alias": "TB02.BizId",
          "label": "BizId",
          "title": "BizId",
          "required": null
        },
        "tree": {}
      },
      "BizURL": {
        "tree": {},
        "attr": {
          "title": "BizURL",
          "required": null,
          "alias": "TB02.BizURL",
          "label": "BizURL"
        }
      },
      "RootNode": {
        "attr": {
          "alias": "TB02.RootNode",
          "label": "RootNode",
          "title": "RootNode",
          "required": null
        },
        "tree": {}
      }
    };

    this.imeta = {
      "IFTA_State": {
        "attr": {
          "label": "IFTA_State",
          "alias": "TB01.IFTA_State",
          "title": "IFTA_State",
          "required": null
        },
        "tree": {}
      },
      "DOT": {
        "attr": {
          "alias": "TB01.DOT",
          "label": "DOT",
          "title": "DOT",
          "required": null
        },
        "tree": {}
      },
      "MC": {
        "attr": {
          "label": "MC",
          "alias": "TB01.MC",
          "title": "MC",
          "required": null
        },
        "tree": {}
      },
      "state_NM": {
        "tree": {},
        "attr": {
          "title": "state_NM",
          "required": null,
          "label": "state_NM",
          "alias": "TB01.state_NM"
        }
      },
      "BrnchPhone": {
        "tree": {
          "Notes": {
            "attr": {
              "required": null,
              "title": "Notes",
              "alias": "TA06.Notes",
              "label": "Notes"
            },
            "tree": {}
          },
          "Extension": {
            "tree": {},
            "attr": {
              "title": "Extension",
              "required": null,
              "label": "Extension",
              "alias": "TA06.Extension"
            }
          },
          "Number": {
            "attr": {
              "required": "required",
              "title": "Number",
              "alias": "TA06.Number",
              "label": "Number"
            },
            "tree": {}
          },
          "Features": {
            "attr": {
              "required": null,
              "title": "Features",
              "alias": "TA06.Features",
              "label": "Features"
            },
            "tree": {}
          },
          "Mobility": {
            "tree": {},
            "attr": {
              "label": "Mobility",
              "alias": "TA06.Mobility",
              "required": null,
              "title": "Mobility"
            }
          },
          "PhnFaxId": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "PhnFaxId",
              "label": "PhnFaxId",
              "alias": "TA06.PhnFaxId"
            }
          }
        },
        "attr": {
          "label": "BrnchPhone",
          "alias": "TA01.BrnchPhone",
          "required": "required",
          "title": "BrnchPhone"
        }
      },
      "state_NC": {
        "tree": {},
        "attr": {
          "alias": "TB01.state_NC",
          "label": "state_NC",
          "title": "state_NC",
          "required": null
        }
      },
      "McCertificatePhoto": {
        "tree": {
          "ExpiredDate": {
            "tree": {},
            "attr": {
              "label": "ExpiredDate",
              "alias": "TB05.ExpiredDate",
              "required": null,
              "title": "ExpiredDate"
            }
          },
          "Keywords": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "Keywords",
              "alias": "TB05.Keywords",
              "label": "Keywords"
            }
          },
          "FileId": {
            "tree": {},
            "attr": {
              "label": "FileId",
              "alias": "TB05.FileId",
              "required": null,
              "title": "FileId"
            }
          },
          "DocumentTitle": {
            "attr": {
              "title": "DocumentTitle",
              "required": null,
              "alias": "TB05.DocumentTitle",
              "label": "DocumentTitle"
            },
            "tree": {}
          },
          "UploadDate": {
            "attr": {
              "required": null,
              "title": "UploadDate",
              "alias": "TB05.UploadDate",
              "label": "UploadDate"
            },
            "tree": {}
          },
          "SHASIG": {
            "attr": {
              "title": "SHASIG",
              "required": "required",
              "label": "SHASIG",
              "alias": "TB05.SHASIG"
            },
            "tree": {}
          },
          "MIMEType": {
            "tree": {},
            "attr": {
              "title": "MIMEType",
              "required": null,
              "label": "MIMEType",
              "alias": "TB05.MIMEType"
            }
          },
          "FileData": {
            "attr": {
              "alias": "TB05.FileData",
              "label": "FileData",
              "title": "FileData",
              "required": "required"
            },
            "tree": {}
          },
          "FileName": {
            "attr": {
              "label": "FileName",
              "alias": "TB05.FileName",
              "required": null,
              "title": "FileName"
            },
            "tree": {}
          },
          "Notes": {
            "attr": {
              "label": "Notes",
              "alias": "TB05.Notes",
              "required": null,
              "title": "Notes"
            },
            "tree": {}
          }
        },
        "attr": {
          "title": "McCertificatePhoto",
          "required": null,
          "alias": "TB01.McCertificatePhoto",
          "label": "McCertificatePhoto"
        }
      },
      "BrnchId": {
        "attr": {
          "title": "BrnchId",
          "required": null,
          "label": "BrnchId",
          "alias": "TA01.BrnchId"
        },
        "tree": {}
      },
      "BrnchFax": {
        "tree": {
          "PhnFaxId": {
            "attr": {
              "title": "PhnFaxId",
              "required": null,
              "alias": "TA07.PhnFaxId",
              "label": "PhnFaxId"
            },
            "tree": {}
          },
          "Mobility": {
            "attr": {
              "required": null,
              "title": "Mobility",
              "label": "Mobility",
              "alias": "TA07.Mobility"
            },
            "tree": {}
          },
          "Features": {
            "tree": {},
            "attr": {
              "alias": "TA07.Features",
              "label": "Features",
              "required": null,
              "title": "Features"
            }
          },
          "Number": {
            "attr": {
              "alias": "TA07.Number",
              "label": "Number",
              "title": "Number",
              "required": "required"
            },
            "tree": {}
          },
          "Extension": {
            "attr": {
              "required": null,
              "title": "Extension",
              "alias": "TA07.Extension",
              "label": "Extension"
            },
            "tree": {}
          },
          "Notes": {
            "attr": {
              "alias": "TA07.Notes",
              "label": "Notes",
              "title": "Notes",
              "required": null
            },
            "tree": {}
          }
        },
        "attr": {
          "alias": "TA01.BrnchFax",
          "label": "BrnchFax",
          "title": "BrnchFax",
          "required": null
        }
      },
      "state_KY": {
        "attr": {
          "title": "state_KY",
          "required": null,
          "label": "state_KY",
          "alias": "TB01.state_KY"
        },
        "tree": {}
      },
      "CrType": {
        "tree": {},
        "attr": {
          "alias": "TB01.CrType",
          "label": "CrType",
          "required": null,
          "title": "CrType"
        }
      },
      "CarrierId": {
        "attr": {
          "alias": "TB01.CarrierId",
          "label": "CarrierId",
          "title": "CarrierId",
          "required": null
        },
        "tree": bizmeta
      },
      "BrnchEMail": {
        "tree": {},
        "attr": {
          "title": "BrnchEMail",
          "required": null,
          "alias": "TA01.BrnchEMail",
          "label": "BrnchEMail"
        }
      },
      "state_SC": {
        "tree": {},
        "attr": {
          "title": "state_SC",
          "required": null,
          "label": "state_SC",
          "alias": "TB01.state_SC"
        }
      },
      "SCAC": {
        "attr": {
          "label": "SCAC",
          "alias": "TB01.SCAC",
          "required": null,
          "title": "SCAC"
        },
        "tree": {}
      },
      "state_OR": {
        "tree": {},
        "attr": {
          "alias": "TB01.state_OR",
          "label": "state_OR",
          "required": null,
          "title": "state_OR"
        }
      },
      "state_NY": {
        "tree": {},
        "attr": {
          "label": "state_NY",
          "alias": "TB01.state_NY",
          "title": "state_NY",
          "required": null
        }
      },
      "BrnchAddress": {
        "tree": {
          "Notes": {
            "tree": {},
            "attr": {
              "label": "Notes",
              "alias": "TA05.Notes",
              "title": "Notes",
              "required": null
            }
          },
          "City": {
            "tree": {},
            "attr": {
              "alias": "TA05.City",
              "label": "City",
              "title": "City",
              "required": "required"
            }
          },
          "GpsLng": {
            "tree": {},
            "attr": {
              "required": null,
              "title": "GpsLng",
              "alias": "TA05.GpsLng",
              "label": "GpsLng"
            }
          },
          "Zip": {
            "attr": {
              "title": "Zip",
              "required": "required",
              "alias": "TA05.Zip",
              "label": "Zip"
            },
            "tree": {}
          },
          "GpsLat": {
            "attr": {
              "label": "GpsLat",
              "alias": "TA05.GpsLat",
              "required": null,
              "title": "GpsLat"
            },
            "tree": {}
          },
          "Country": {
            "attr": {
              "required": null,
              "title": "Country",
              "alias": "TA05.Country",
              "label": "Country"
            },
            "tree": {}
          },
          "Street2": {
            "attr": {
              "title": "Street",
              "required": null,
              "label": "Street2",
              "alias": "TA05.Street2"
            },
            "tree": {}
          },
          "Street3": {
            "tree": {},
            "attr": {
              "alias": "TA05.Street3",
              "label": "Street3",
              "title": "Street3",
              "required": null
            }
          },
          "Street1": {
            "attr": {
              "label": "Street1",
              "alias": "TA05.Street1",
              "required": "required",
              "title": "Street or P.O. Box"
            },
            "tree": {}
          },
          "State": {
            "attr": {
              "required": "required",
              "title": "State",
              "alias": "TA05.State",
              "label": "State"
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
          }
        },
        "attr": {
          "label": "BrnchAddress",
          "alias": "TA01.BrnchAddress",
          "title": "BrnchAddress",
          "required": "required"
        }
      },
      "BizId": {
        "attr": {
          "required": "required",
          "title": "BizId",
          "label": "BizId",
          "alias": "TA01.BizId"
        },
        "tree": bizmeta
      },
      "IFTA_Acc": {
        "attr": {
          "alias": "TB01.IFTA_Acc",
          "label": "IFTA_Acc",
          "title": "IFTA_Acc",
          "required": null
        },
        "tree": {}
      },
      "state_FL": {
        "attr": {
          "alias": "TB01.state_FL",
          "label": "state_FL",
          "title": "state_FL",
          "required": null
        },
        "tree": {}
      },
      "OfficeName": {
        "tree": {},
        "attr": {
          "label": "OfficeName",
          "alias": "TA01.OfficeName",
          "required": null,
          "title": "OfficeName"
        }
      }
    };
  }
}

app.controller('MetaBusinessMCFormCtrl', MetaBusinessMCFormCtrl);
app.component('metaBusinessMcForm', {
  templateUrl: 'modules/business/mc/form/meta.template.html',
  controller: 'MetaBusinessMCFormCtrl',
  bindings: meta_bindings
});