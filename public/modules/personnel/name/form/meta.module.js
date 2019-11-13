class MetaPersonnelNameCtrl {
  constructor() {
    this.meta = {
      "NickName": {
        "attr": {
          "label": "NickName",
          "title": "NickName",
          "required": null
        },
        "tree": {}
      },
      "FirstName": {
        "attr": {
          "label": "FirstName",
          "required": "required",
          "title": "FirstName"
        },
        "tree": {}
      },
      "Prefix": {
        "attr": {
          "required": null,
          "title": "Prefix",
          "label": "Prefix"
        },
        "tree": {}
      },
      "LastName": {
        "attr": {
          "title": "LastName",
          "required": "required",
          "label": "LastName"
        },
        "tree": {}
      },
      "BrnchId": {
        "tree": {},
        "attr": {
          "title": "BrnchId",
          "required": "required",
          "label": "BrnchId"
        }
      },
      "MiddleName": {
        "tree": {},
        "attr": {
          "label": "MiddleName",
          "required": null,
          "title": "MiddleName"
        }
      },
      "Suffix": {
        "tree": {},
        "attr": {
          "title": "Suffix",
          "required": null,
          "label": "Suffix"
        }
      },
      "PrsnId": {
        "tree": {},
        "attr": {
          "required": null,
          "title": "PrsnId",
          "label": "PrsnId"
        }
      }
    };
  }
}

app.component('metaNameForm', {
  templateUrl: 'modules/personnel/name/form/meta.template.html',
  controller: MetaPersonnelNameCtrl,
  bindings: meta_bindings
});