/* DEPRECATED */

class GenericFormCtrl {
  constructor(getid, scope) {
    this.id = getid();
    this.scope = scope;
  }

  UpdateField(field, value) {
    this.item[field] = value;
  }

  Submit() {
    this.Update();

    if (this.onSubmit instanceof Function) {
      this.onSubmit();
    }
  }

  Delete() {
    if (this.onDelete instanceof Function) {
      this.onDelete();
    }
  }

  Create() {

    if (this.onCreate instanceof Function) {
      this.item = {};
      this.scope.$broadcast("Update");
      this.onCreate({item: this.item});
    } else {
      console.error("Create feature not supported");
    }
  }

  Update() {
    this.scope.$broadcast("Update");
    if (this.onUpdate instanceof Function) {
      this.onUpdate({item: this.item});
    }
  }

  Reset() {
    this.scope.$broadcast("Reset");
  }

  Clear() {
    if (this.onClear instanceof Function) {
      this.onClear();
    }
  }
}

var form_bindings = {
  item: '<',
  onReset: '&?',
  onUpdate: '&?',
  onCreate: '&?',
  onSubmit: '&?',
  onDelete: '&?',
  onClear: '&?'
};

app.controller("GenericFormCtrl", [
  "getid", "$scope", GenericFormCtrl
]);