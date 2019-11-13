class MetaAddressCtrl extends MetaGateCtrl{
  constructor() {
    super();
    this.imeta = {
      "GpsLat": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "GpsLat",
          "label": "GpsLat"
        }
      },
      "Zip": {
        "attr": {
          "required": "required",
          "title": "Zip",
          "label": "Zip"
        },
        "tree": {}
      },
      "State": {
        "attr": {
          "label": "State",
          "required": "required",
          "title": "State"
        },
        "tree": {}
      },
      "AddrId": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "AddrId",
          "label": "AddrId"
        }
      },
      "Street2": {
        "tree": {},
        "attr": {
          "label": "Street2",
          "required": null,
          "title": "Street"
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
      "Street3": {
        "attr": {
          "label": "Street3",
          "required": null,
          "title": "Street3"
        },
        "tree": {}
      },
      "City": {
        "attr": {
          "label": "City",
          "title": "City",
          "required": "required"
        },
        "tree": {}
      },
      "Notes": {
        "attr": {
          "label": "Notes",
          "required": null,
          "title": "Notes"
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
      "Street1": {
        "attr": {
          "label": "Street1",
          "title": "Street or P.O. Box",
          "required": "required"
        },
        "tree": {}
      }
    };
  }
}

app.component("metaAddressForm", {
  templateUrl: "modules/address/form/meta.template.html",
  controller: MetaAddressCtrl,
  bindings: meta_bindings
});