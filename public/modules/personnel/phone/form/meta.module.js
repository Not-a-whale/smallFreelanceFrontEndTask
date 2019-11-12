class MetaPhoneInputCtrl {
   constructor() {
      this.meta = {
         "Number": {
            "attr": {
               "label": "Number",
               "title": "Number",
               "required": "required"
            },
            "tree": {}
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
               "label": "Notes",
               "required": null,
               "title": "Notes"
            }
         },
         "Features": {
            "tree": {
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
            },
            "attr": {
               "required": null,
               "title": "Features",
               "label": "Features"
            }
         },
         "Mobility": {
            "tree": {},
            "attr": {
               "required": null,
               "title": "Mobility",
               "label": "Mobility"
            }
         },
         "PhnFaxId": {
            "tree": {},
            "attr": {
               "label": "PhnFaxId",
               "title": "PhnFaxId",
               "required": null
            }
         }
      };
   }
}


app.controller('MetaPhoneInputCtrl', MetaPhoneInputCtrl);
app.component('metaPhoneForm', {
   templateUrl: 'modules/personnel/phone/form/meta.template.html',
   controller: 'MetaPhoneInputCtrl',
   bindings: meta_bindings
});