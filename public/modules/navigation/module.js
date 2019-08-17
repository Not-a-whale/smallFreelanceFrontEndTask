class NavigationEditorCtrl {
  /*
    Top level module that is reponsible for fetching data and submitting it
    Attach a Display module and an Edit module to manipulate the data within
  */
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.tree = {};
    this.edit = undefined;
  }

  // Resets the data that is being edit, clearing all the fields
  // Should technically reset to the previous values
  Reset() {
    this.edit = undefined;
  }

  // Grabs the data from the database and fills its structure
  FetchData() {
    var self = this;
    this.$http.get('/api/navigation/menu_item/all').then(
      function (res) {
        console.log(res.data.DATA);
        self.tree = res.data.DATA.app_menu_items;
      },
      function (res) {

      });
  }

  // Updates the model in the structure from the Edit module
  Update(object) {
    if (object) {
      for (let [key, value] of Object.entries(object)) {
        this.edit[key] = value;
      }
      console.log(this.edit);
    } else {
      console.log("Failed to update object");
    }
  }

  // for debugging
  Console() {
    console.log(this.edit);
  }

  // Sets the item to edit, usually sent by the Display module
  ItemToEdit(item) {
    console.log("This is the item");
    console.log(item);
    this.edit = item;
  }

  // Life cycle hook for angularjs component
  $onInit() {
    // grab the data after the component is ready for it
    this.FetchData();
  }
}

class NavigationFormCtrl {
  /*
    Edit module that receives data from a top level module to edit it
    Changes are not live and only propagate to top level when user submits them
  */
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
  }

  // When a new item is created by the user
  // calls bound onNew function
  New() {
    console.log("Submit function called");
    console.log(this.Object());
    this.Submit("/api/navigation/menu_item/add");
    this.onNew();
  }

  // Asks the top level module to reset the edited item
  Reset() {
    console.log("Reset function called");
    this.onReset();
  }

  // Propagates the changes to the current item to the top level module
  // HTTP request is still in debate of who is responsible for it
  Update() {
    console.log("Update function called");
    console.log(this.Object());
    this.onUpdate({
      object: this.Object()
    });
    this.Submit("/api/navigation/menu_item/add");
  }

  // Because of 1 way data bindings and how we are sending the
  // content to the server, need an object function that maps fields to values
  Object() {
    return {
      MenuItemId: this.id,
      Label: this.label,
      Title: this.title,
      Route: this.route,
      ParentId: this.parent,
      SortIndex: this.sortindex,
      Enabled: this.enabled
    };
  }

  // Work in progress, will call an onDelete function of Top Level module
  Delete() {
    console.log("delete function called");
    this.$http.delete("/api/navigation/menu_item").then(function (res) {
      console.log(res.statusText);

    }, function (res) {
      console.log(res.statusText);
    });
  }

  // Generic HTTP submit, debating on who has responsibility of submitting data
  // Top level module vs Edit module. WIP, TODO
  Submit(url) {
    var self = this;
    var data = {
      POST: self.Object(),
      ERROR: undefined,
      DATA: undefined
    };

    this.$http.post(url, data).then(
      function (res) {
        console.log(res.status);
        console.log(res.statusText);
      },
      function (res) {
        console.log(res.status);
        console.log(res.messsage);
      }
    );
  }
}

class NavigationHierarchyCtrl {
  /*
    Display module that is hooked up to a top level module with data
    Communicates with top level module about user interaction
  */
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.tree = {};
  }

  // Tells the top level module which item was selected
  SelectItem(item) {
    this.selectItem({
      item: item
    });
  }
}


/* For now top level module will only be a controller*/
app.controller("navigationEditor", ['getid', '$scope', '$http', NavigationEditorCtrl]);


app.component("navigationForm", {
  controller: ['getid', '$scope', '$http', NavigationFormCtrl],
  templateUrl: "/modules/navigation/form.html",
  bindings: {
    id: '<',
    label: '<',
    title: '<',
    route: '<',
    parent: '<',
    sortindex: '<',
    enabled: '<',
    onUpdate: '&',
    onReset: '&',
    onNew: '&',
    editing: '<'
  }
});

app.component("navigationHierarchy", {
  controller: ['getid', '$scope', '$http', NavigationHierarchyCtrl],
  templateUrl: "/modules/navigation/hierarchy.html",
  bindings: {
    tree: '<',
    selectItem: '&'
  }
});