class GenericEditorCtrl {
  /*
    Toplevel module responsible to hold data that needs to be displayed and edited.
  */
  constructor(getid, scope) {
    this.id = getid();
    this.scope = scope;
    this.list = [];
    this.edit = undefined;
  }

  Update(item) {
    this.edit = item;
  }

  // Removes the current item from editing, discarding all changes
  Clear() {
    this.edit = undefined;
    this.scope.$broadcast("Clear");
  }

  // If you want to change how the data is sent in the request
  BuildObject(){
    return this.edit;
  }

  Create(item){
    this.edit = item;
    this.Submit();
  }

  // Grabs the data from the database and fills its structure
  FetchData() {
    console.error("FetchData not implemented for Editor " + this.id);
  }

  // Updates the model after a delete event happened
  Delete() {
    console.error("Delete not implemented for Editor " + this.id);
  }

  Submit() {
    console.error("Submit not implemented for Editor " + this.id);
  }

  // Sets the item to edit, usually sent by the Display module
  SetItemToEdit(item) {
    this.edit = item;
  }
}

app.controller("GenericEditorCtrl", ["getid", "$scope", "$http", GenericEditorCtrl]);

var editor_bindings = {
  list: '<?',
  createUrl: '@?',
  updateUrl: '@?',
  deleteUrl: '@?',
  fetchUrl: '@?'
};
