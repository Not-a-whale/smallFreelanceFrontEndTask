class MetaBizFormCtrl extends MetaGateCtrl {
  constructor() {
    super();
    this.imeta = {
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
          "label": "BizName",
          "required": "required",
          "title": "BizName"
        }
      },
      "BizId": {
        "attr": {
          "title": "BizId",
          "required": null,
          "label": "BizId"
        },
        "tree": {}
      },
      "BizURL": {
        "attr": {
          "title": "BizURL",
          "label": "BizURL",
          "required": null
        },
        "tree": {}
      }
    };
  }
}

app.controller('MetaBizFormCtrl', MetaBizFormCtrl);
app.component('metaBizForm', {
  templateUrl: 'modules/business/biz/form/meta.template.html',
  controller: 'MetaBizFormCtrl',
  bindings: meta_bindings
});