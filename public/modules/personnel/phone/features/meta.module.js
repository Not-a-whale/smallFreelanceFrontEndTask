class MetaPhoneFeaturesInputCtrl {
  constructor() {

    this.meta = {
      "VOICE": {
        "tree": {},
        "attr": {
          "required": null,
          "label": "VOICE",
          "title": "VOICE",
          "onvalue": true
        }
      },
      "SMS": {
        "attr": {
          "label": "SMS",
          "title": "SMS",
          "required": null,
          "onvalue": true
        },
        "tree": {}
      },
      "MMS": {
        "attr": {
          "label": "MMS",
          "title": "MMS",
          "required": null,
          "onvalue": true
        },
        "tree": {}
      },
      "FAX": {
        "attr": {
          "label": "FAX",
          "title": "FAX",
          "required": null,
          "onvalue": true
        },
        "tree": {}
      }
    };
  }
}


app.controller('MetaPhoneFeaturesInputCtrl', MetaPhoneFeaturesInputCtrl);
app.component('metaPhoneFeaturesForm', {
  templateUrl: 'modules/personnel/phone/features/meta.template.html',
  controller: 'MetaPhoneFeaturesInputCtrl',
  bindings: meta_bindings
});