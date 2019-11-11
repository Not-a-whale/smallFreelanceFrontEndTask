class GenericFormTemplateCtrl {
  constructor() {
    this.CLEAN = 0;
    this.DIRTY = 1;
    this.COMPLETE = 2;
    this.scrollContainer = angular.element(document.getElementById('scrollContainer'));

    // used for determining which form to scroll to
    this.currf = undefined;
    this.prevf = undefined;
    this.nextf = undefined;

    // position of the forms in the list is very important!
    // keep save + submit at the very end
    // forms will display in the order they are received
    /* expected fields:
        title: string, the name of the form
        optional: boolean, if its an optional form
        status: [0,1,2], 0 is clean, 1 is dirty, 2 complete
        enabled: boolean, if it can be filled out
        viewname: string, view name used in configstates to indicate the templateUrl
        data: objects, the data to pass to the view which will manipulate it
        ** inner forms should have a binding to formData as thier inputs
        ** inner forms should know how to update the data back to the template form via onUpdate binding
    */
    this.forms = [];
  }

  ScrollToForm(form) {
    this.SetAnchor(form);
    this.ScrollTo(form);
  }





  SetAnchor(form) {
    let index = this.forms.indexOf(form);

    if (form != undefined && form.enabled) {

      if (index != -1) {
        this.currf = form;
        let nextf = undefined;
        let prevf = undefined;
        let nindex = index + 1;
        if (nindex < this.forms.length) {
          do {
            if (this.forms[nindex].enabled) {
              nextf = this.forms[nindex];
            }
          } while (nextf == undefined && nindex++ < this.forms.length);
        }
        nindex = index - 1;
        if (nindex > -1) {
          do {
            if (this.forms[nindex].enabled) {
              prevf = this.forms[nindex];
            }
          } while (prevf == undefined && nindex-- < this.forms.length);
        }

        this.nextf = nextf;
        this.prevf = prevf;
      }
    }
  }

  ScrollToNext() {
    this.ScrollToForm(this.nextf);
  }

  ScrollToPrev() {
    this.ScrollToForm(this.prevf);
  }

  ScrollTo(form) {
    let scrolltime = 500;
    let anchor = angular.element(document.getElementById(form.viewname));
    if (anchor != undefined) {
      let offset = 0;
      if (form.viewname === this.forms[0].viewname) {
        offset = 16;
      }
      this.scrollContainer.scrollTo(anchor, offset, scrolltime);
    }
  }

  _ScrollTo(form) {
    let anchor = form.viewname;
    if (this.location.hash() !== anchor) {
      this.location.hash(anchor);
    } else {
      this.anchorscroll();
    }
  }

  EnableForm(form) {
    if (form != undefined) {
      form.enabled = true;
      this.SetAnchor(this.currf);
    }
  }

  DisableForm(form) {
    if (form != undefined) {
      form.enabled = false;
      this.SetAnchor(this.currf);
    }
  }

  Status(form) {
    switch (form.status) {
      case this.CLEAN:
        return 'O';
      case this.DIRTY:
        return '!';
      case this.COMPLETE:
        return '#';
    }
  }

  Update(form, data){
    let index = this.forms.indexOf(form);
    if (this.index != -1){
      this.forms[index].data = data;
    } else {
      console.error("Invalid form passed to template form");
    }
  }

  $onInit() {
    if (this.forms != undefined) {
      if (this.forms.length != 0) {
        this.SetAnchor(this.forms[0]);
      }
    }
  }
}

var formtemplate_bindings = {
  forms: '<'
};

app.controller("GenericFormTemplateCtrl", [GenericFormTemplateCtrl]);
app.component("genericForm", {
  templateUrl: "modules/generic/form/template/default.html",
  controller: "GenericFormTemplateCtrl",
  bindings: formtemplate_bindings
});