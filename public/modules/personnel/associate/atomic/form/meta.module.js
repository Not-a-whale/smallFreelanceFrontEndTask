class MetaPersonnelAssociatePartFormCtrl extends MetaGateCtrl {
  constructor() {
    super();
    this.imeta = {
      "AstId": {
        "attr": {
          "alias": "TA01.AstId",
          "label": "AstId",
          "required": null,
          "title": "AstId"
        },
        "tree": {}
      },
      "Notes": {
        "attr": {
          "label": "Notes",
          "alias": "TA01.Notes",
          "required": null,
          "title": "Notes"
        },
        "tree": {}
      },
      "BizFax": {
        "attr": {
          "label": "BizFax",
          "alias": "TA01.BizFax",
          "required": null,
          "title": "BizFax"
        },
        "tree": {}
      },
      "NodeId": {
        "tree": {},
        "attr": {
          "title": "NodeId",
          "alias": "TA01.NodeId",
          "label": "NodeId",
          "required": null
        }
      },
      "BizPhone": {
        "tree": {},
        "attr": {
          "title": "BizPhone",
          "alias": "TA01.BizPhone",
          "label": "BizPhone",
          "required": null
        }
      },
      "AuthorityLevel": {
        "attr": {
          "title": "AuthorityLevel",
          "label": "AuthorityLevel",
          "alias": "TA01.AuthorityLevel",
          "required": null
        },
        "tree": {}
      },
      "BizEmail": {
        "tree": {},
        "attr": {
          "label": "BizEmail",
          "alias": "TA01.BizEmail",
          "required": null,
          "title": "BizEmail"
        }
      },
      "DateCreated": {
        "attr": {
          "title": "DateCreated",
          "alias": "TA01.DateCreated",
          "required": null,
          "label": "DateCreated"
        },
        "tree": {}
      },
      "DateRemoved": {
        "tree": {},
        "attr": {
          "title": "DateRemoved",
          "label": "DateRemoved",
          "alias": "TA01.DateRemoved",
          "required": null
        }
      },
      "CurrentTitle": {
        "tree": {},
        "attr": {
          "title": "CurrentTitle",
          "label": "CurrentTitle",
          "alias": "TA01.CurrentTitle",
          "required": null
        }
      }
    };
  }
}
app.controller('MetaPersonnelAssociatePartFormCtrl', MetaPersonnelAssociatePartFormCtrl);
app.component('metaAssociatePartForm', {
  templateUrl: 'modules/personnel/associate/atomic/form/meta.template.html',
  controller: 'MetaPersonnelAssociatePartFormCtrl',
  bindings: meta_bindings
});