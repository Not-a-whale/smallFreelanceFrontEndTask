class TemplateFormSectionCtrl {
  constructor() {

  }

  Remove(){
    if (this.onRemove instanceof Function){
      console.log("Removing form");
      this.onRemove();
    }
  }
}

app.component("insuranceForm", {
  templateUrl: "modules/insurance/form/default.html",
  controller: TemplateFormSectionCtrl,
  bindings: {
    onRemove: '&',
    onUpdate: '&',
    formData: '<'
  }
});