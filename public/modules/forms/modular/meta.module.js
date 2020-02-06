/* class to control the distribution of data inside of the New Truck form via meta/gate */
class MetaModularFormCtrl extends MetaGateCtrl {
  constructor(scope, element, compile, formservice) {
    super();
    this.scope = scope;
    this.element = element;
    this.compile = compile;
    this.formservice = formservice;

    this.compiledForms = [];
    this.forms = [];
    this.gate = { tomato: 999};
    this.meta = {};
  }

  DisableForm(form) {
    console.log("Sectional form disabling form: " + form.title);
    console.log(form);
    if (this.onDisable instanceof Function) {
      this.onDisable({
        form: form
      });
    }
  }

  CompileForms() {
    let index = 0;
    let formroot = angular.element(this.element[0].getElementsByClassName('form')[0]);
    for (let form of this.forms.sectionals) {

      let comp = form.component;
      let cstr = '<' + comp;
      cstr += ' ng-show="$ctrl.forms.sectionals[' + index + '].enabled" form="$ctrl.forms.sectionals[' + index + ']"';
      cstr += ' gate="$ctrl.gate" meta="$ctrl.meta" ';
      if (form.optional) {
        cstr += ' on-disable="$ctrl.DisableForm(form)"';
      }

      if (form.component === 'meta-review-form') {
        cstr += ' on-submit="$ctrl.SubmitForm()" ';
      }
      cstr += '></' + comp + '>';
      let scope = this.scope.$new();
      let newel = this.compile(cstr)(scope);

      formroot.append(newel);
      index += 1;

    }
  }

  GetForm() {
    if (this.getForm instanceof Function) {
      this.getForm({
        form: this.forms
      });
    } else {
      let formname = "Modular";
      if (this.forms !== undefined && this.forms.title !== undefined) {
        formname = this.forms.title;
      }
      console.error(formname + ' form getform function not bound');
    }
  }

  $onInit() {
    super.$onInit();
    this.CompileForms();
    this.GetForm();
  }

  $onDestroy() {
    if (this.compiledForms !== undefined) {
      this.compiledForms.forEach(x => {
        x.remove();
      });
    }
  }
}

let meta_modular_form_bindings = CloneObj(meta_bindings);
meta_modular_form_bindings.getForm = '&?';
meta_modular_form_bindings.forms = '<?';

app.controller('MetaModularFormCtrl', ['$scope', '$element', '$compile', 'MetaFormService', MetaModularFormCtrl]);