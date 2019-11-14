class MetaPersonnelPersonCtrl extends MetaGateCtrl {
  constructor() {
    super();
    this.imeta = {
      "BrnchId": {
        "attr": {
          "required": "required",
          "label": "BrnchId",
          "title": "BrnchId"
        },
        "tree": {}
      },
      "Suffix": {
        "attr": {
          "required": null,
          "label": "Suffix",
          "title": "Suffix"
        },
        "tree": {}
      },
      "Prefix": {
        "tree": {},
        "attr": {
          "required": null,
          "label": "Prefix",
          "title": "Prefix"
        }
      },
      "PrsnId": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "PrsnId",
          "label": "PrsnId"
        }
      },
      "FirstName": {
        "attr": {
          "required": "required",
          "title": "FirstName",
          "label": "FirstName"
        },
        "tree": {}
      },
      "LastName": {
        "attr": {
          "required": "required",
          "label": "LastName",
          "title": "LastName"
        },
        "tree": {}
      },
      "MiddleName": {
        "attr": {
          "label": "MiddleName",
          "title": "MiddleName",
          "required": null
        },
        "tree": {}
      },
      "NickName": {
        "attr": {
          "required": null,
          "label": "NickName",
          "title": "NickName"
        },
        "tree": {}
      }
    };
  }
}

app.controller('MetaPersonnelPersonCtrl', MetaPersonnelPersonCtrl);
app.component('metaPersonForm', {
  templateUrl: 'modules/personnel/person/form/meta.template.html',
  controller: 'MetaPersonnelPersonCtrl',
  bindings: meta_bindings
});