class MetaPersonnelAssociateFormCtrl extends MetaGateCtrl {
  constructor() {
    super();
    this.imeta = {
      "AstId": {
        "tree": {
          "Suffix": {
            "attr": {
              "label": "Suffix",

              "title": "Suffix",
              "required": null
            },
            "tree": {}
          },
          "BrnchId": {
            "tree": {
              "BizId": {
                "tree": {
                  "BizURL": {
                    "attr": {
                      "required": null,
                      "title": "BizURL",

                      "label": "BizURL"
                    },
                    "tree": {}
                  },
                  "RootNode": {
                    "tree": {},
                    "attr": {
                      "required": null,
                      "label": "RootNode",
                      "title": "RootNode",

                    }
                  },
                  "BizId": {
                    "attr": {

                      "title": "BizId",
                      "label": "BizId",
                      "required": null
                    },
                    "tree": {}
                  },
                  "BizName": {
                    "tree": {},
                    "attr": {
                      "required": "required",
                      "label": "BizName",

                      "title": "BizName"
                    }
                  }
                },
                "attr": {
                  "label": "BizId",
                  "title": "BizId",

                  "required": "required"
                }
              },
              "BrnchPhone": {
                "attr": {
                  "required": "required",
                  "label": "BrnchPhone",

                  "title": "BrnchPhone"
                },
                "tree": {
                  "Features": {
                    "attr": {
                      "label": "Features",

                      "title": "Features",
                      "required": null
                    },
                    "tree": {}
                  },
                  "PhnFaxId": {
                    "tree": {},
                    "attr": {
                      "label": "PhnFaxId",

                      "title": "PhnFaxId",
                      "required": null
                    }
                  },
                  "Extension": {
                    "tree": {},
                    "attr": {
                      "required": null,
                      "title": "Extension",

                      "label": "Extension"
                    }
                  },
                  "Notes": {
                    "tree": {},
                    "attr": {
                      "title": "Notes",

                      "label": "Notes",
                      "required": null
                    }
                  },
                  "Mobility": {
                    "attr": {
                      "label": "Mobility",

                      "title": "Mobility",
                      "required": null
                    },
                    "tree": {}
                  },
                  "Number": {
                    "tree": {},
                    "attr": {
                      "title": "Branch Company Phone Number",
                      "label": "Company Phone Number",
                      "required": "required"
                    }
                  }
                }
              },
              "BrnchId": {
                "tree": {},
                "attr": {
                  "required": null,
                  "title": "BrnchId",

                  "label": "BrnchId"
                }
              },
              "BrnchAddress": {
                "attr": {
                  "required": "required",
                  "label": "BrnchAddress",
                  "title": "BrnchAddress",

                },
                "tree": {
                  "Street3": {
                    "attr": {
                      "required": null,
                      "label": "Street3",
                      "title": "Street3",

                    },
                    "tree": {}
                  },
                  "City": {
                    "tree": {},
                    "attr": {

                      "title": "City",
                      "label": "City",
                      "required": "required"
                    }
                  },
                  "AddrId": {
                    "attr": {
                      "title": "AddrId",

                      "label": "AddrId",
                      "required": null
                    },
                    "tree": {}
                  },
                  "GpsLat": {
                    "attr": {
                      "title": "GpsLat",

                      "label": "GpsLat",
                      "required": null
                    },
                    "tree": {}
                  },
                  "Zip": {
                    "attr": {
                      "required": "required",
                      "label": "Zip",
                      "title": "Zip",

                    },
                    "tree": {}
                  },
                  "Street2": {
                    "tree": {},
                    "attr": {
                      "title": "Street",

                      "label": "Street2",
                      "required": null
                    }
                  },
                  "Street1": {
                    "tree": {},
                    "attr": {
                      "required": "required",

                      "title": "Street or P.O. Box",
                      "label": "Street1"
                    }
                  },
                  "Notes": {
                    "tree": {},
                    "attr": {
                      "label": "Notes",
                      "title": "Notes",

                      "required": null
                    }
                  },
                  "Country": {
                    "attr": {
                      "required": null,
                      "label": "Country",

                      "title": "Country"
                    },
                    "tree": {}
                  },
                  "GpsLng": {
                    "attr": {
                      "required": null,

                      "title": "GpsLng",
                      "label": "GpsLng"
                    },
                    "tree": {}
                  },
                  "State": {
                    "attr": {
                      "required": "required",

                      "title": "State",
                      "label": "State"
                    },
                    "tree": {}
                  }
                }
              },
              "BrnchEMail": {
                "tree": {},
                "attr": {
                  "required": null,
                  "title": "BrnchEMail",

                  "label": "BrnchEMail"
                }
              },
              "BrnchFax": {
                "attr": {
                  "required": null,
                  "label": "BrnchFax",
                  "title": "BrnchFax"
                },
                "tree": {
                  "Notes": {
                    "tree": {},
                    "attr": {
                      "required": null,
                      "title": "Notes",
                      "label": "Notes"
                    }
                  },
                  "Number": {
                    "tree": {},
                    "attr": {
                      "required": "required",
                      "label": "Company Fax Number",
                      "title": "Branch Company Fax Number"
                    }
                  },
                  "Mobility": {
                    "attr": {
                      "required": null,
                      "label": "Mobility",
                      "title": "Mobility"
                    },
                    "tree": {}
                  },
                  "Extension": {
                    "attr": {
                      "required": null,
                      "label": "Extension",
                      "title": "Extension"
                    },
                    "tree": {}
                  },
                  "PhnFaxId": {
                    "tree": {},
                    "attr": {
                      "label": "PhnFaxId",
                      "title": "PhnFaxId",
                      "required": null
                    }
                  },
                  "Features": {
                    "tree": {},
                    "attr": {
                      "required": null,
                      "label": "Features",
                      "title": "Features"
                    }
                  }
                }
              },
              "OfficeName": {
                "tree": {},
                "attr": {
                  "required": null,
                  "label": "OfficeName",
                  "title": "OfficeName"
                }
              }
            },
            "attr": {
              "required": "required",
              "title": "BrnchId",
              "label": "BrnchId"
            }
          },
          "PrsnId": {
            "tree": {},
            "attr": {
              "label": "PrsnId",
              "title": "PrsnId",
              "required": null
            }
          },
          "LastName": {
            "tree": {},
            "attr": {
              "title": "LastName",
              "label": "LastName",
              "required": "required"
            }
          },
          "MiddleName": {
            "tree": {},
            "attr": {
              "label": "MiddleName",
              "title": "MiddleName",
              "required": null
            }
          },
          "FirstName": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "FirstName",
              "title": "FirstName"
            }
          },
          "Prefix": {
            "attr": {
              "title": "Prefix",
              "label": "Prefix",
              "required": null
            },
            "tree": {}
          },
          "NickName": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "NickName",
              "title": "NickName"
            }
          }
        },
        "attr": {
          "title": "AstId",
          "label": "AstId",
          "required": null
        }
      },
      "BizEmail": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "BizEmail",
          "label": "BizEmail"
        }
      },
      "BizPhone": {
        "attr": {
          "title": "BizPhone",
          "label": "BizPhone",
          "required": null
        },
        "tree": {
          "Features": {
            "tree": {},
            "attr": {
              "label": "Features",
              "title": "Features",
              "required": null
            }
          },
          "PhnFaxId": {
            "attr": {
              "label": "PhnFaxId",
              "title": "PhnFaxId",
              "required": null
            },
            "tree": {}
          },
          "Extension": {
            "attr": {
              "required": null,
              "title": "Extension",
              "label": "Extension"
            },
            "tree": {}
          },
          "Notes": {
            "attr": {
              "required": null,
              "title": "Notes",
              "label": "Notes"
            },
            "tree": {}
          },
          "Mobility": {
            "attr": {
              "required": null,
              "title": "Mobility",

              "label": "Mobility"
            },
            "tree": {}
          },
          "Number": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "Number",

              "title": "Number"
            }
          }
        }
      },
      "DateCreated": {
        "tree": {},
        "attr": {

          "title": "DateCreated",
          "label": "DateCreated",
          "required": null
        }
      },
      "CurrentTitle": {
        "tree": {},
        "attr": {
          "label": "CurrentTitle",

          "title": "CurrentTitle",
          "required": null
        }
      },
      "BizFax": {
        "tree": {
          "Extension": {
            "tree": {},
            "attr": {
              "required": null,

              "title": "Extension",
              "label": "Extension"
            }
          },
          "Features": {
            "attr": {
              "label": "Features",
              "title": "Features",

              "required": null
            },
            "tree": {}
          },
          "PhnFaxId": {
            "attr": {
              "required": null,
              "label": "PhnFaxId",

              "title": "PhnFaxId"
            },
            "tree": {}
          },
          "Number": {
            "tree": {},
            "attr": {
              "required": "required",
              "label": "Fax",
              "title": "Fax Number"
            }
          },
          "Mobility": {
            "attr": {

              "title": "Mobility",
              "label": "Mobility",
              "required": null
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
          }
        },
        "attr": {
          "label": "BizFax",
          "title": "BizFax",

          "required": null
        }
      },
      "DateRemoved": {
        "attr": {
          "title": "DateRemoved",

          "label": "DateRemoved",
          "required": null
        },
        "tree": {}
      },
      "AuthorityLevel": {
        "attr": {
          "required": null,
          "title": "AuthorityLevel",

          "label": "AuthorityLevel"
        },
        "tree": {}
      },
      "Notes": {
        "attr": {
          "required": null,
          "title": "Notes",

          "label": "Notes"
        },
        "tree": {}
      },
      "NodeId": {
        "tree": {
          "ParentId": {
            "tree": {
              "ParentId": {
                "tree": {},
                "attr": {
                  "label": "ParentId",
                  "title": "ParentId",

                  "required": null
                }
              },
              "NodeId": {
                "attr": {

                  "title": "NodeId",
                  "label": "NodeId",
                  "required": null
                },
                "tree": {}
              },
              "UnitName": {
                "attr": {
                  "required": "required",
                  "title": "UnitName",

                  "label": "UnitName"
                },
                "tree": {}
              },
              "Type": {
                "tree": {},
                "attr": {
                  "label": "Type",
                  "title": "Type",

                  "required": null
                }
              }
            },
            "attr": {

              "title": "ParentId",
              "label": "ParentId",
              "required": null
            }
          },
          "NodeId": {
            "tree": {},
            "attr": {
              "required": null,
              "label": "NodeId",
              "title": "NodeId",

            }
          },
          "UnitName": {
            "attr": {
              "label": "UnitName",
              "title": "UnitName",

              "required": "required"
            },
            "tree": {}
          },
          "Type": {
            "tree": {},
            "attr": {
              "required": null,

              "title": "Type",
              "label": "Type"
            }
          }
        },
        "attr": {
          "required": null,

          "title": "NodeId",
          "label": "NodeId"
        }
      }
    };
  }
}

app.controller('MetaPersonnelAssociateFormCtrl', MetaPersonnelAssociateFormCtrl);
app.component('metaAssociateForm', {
  templateUrl: 'modules/personnel/associate/form/meta.template.html',
  controller: 'MetaPersonnelAssociateFormCtrl',
  bindings: meta_bindings
});