class NavigationCtrl {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.tree = {};
    this.editing = {};
  }

  $onInit() {
    var self = this;

    this.$http.get('/api/navigation/menu_item/all').then(
      function (res) {
        console.log(res.data.DATA);
        self.tree = res.data.DATA.app_menu_items;
      },
      function (res) {

      });

    this.$scope.$on("NavEdit", function (event, args) {
      console.log("Heard Emit: ");
      console.log(args);
      self.edit = args;

      self.$scope.$broadcast("NavEditForm");
    });
  }

}

class NavigationFormCtrl {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.new = true;
  }

  New() {
    console.log("Submit function called");
    this.Submit("/api/navigation/menu_item/add");
  }

  Reset() {
    console.log("Reset function called");

    this.label = '';
    this.title = '';
    this.route = '';
    this.parent = '';
    this.sortindex = '';
    this.enabled = '';
    this.new = true;
  }

  Update() {
    console.log("Update function called");
    this.Submit("/api/navigation/menu_item/add");
  }

  Submit(url) {
    var self = this;
    var data = {
      POST: self.edit,
      ERROR: undefined,
      DATA: undefined
    };

    this.$http.post(url, data).then(
      function (res) {
        console.log(res.status);
        console.log(res.message);
      },
      function (res) {
        console.log(res.status);
        console.log(res.messsage);
      }
    );
  }


  $onInit() {
    var self = this;
    this.$scope.$on("NavEditForm", function (event, args) {
      self.new = false;
    });
  }

}

class NavigationHierarchyCtrl {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.edit = {};
  }

  Console() {
    console.log(this.tree);
  }

  SetActive(item) {
    console.log("Emitting: " + item);
    this.edit = item;
    this.$scope.$emit("NavEdit", item);
  }

}



app.controller("navigationEditorCtrl", ['getid', '$scope', '$http', NavigationCtrl]);

app.component("navigationForm", {
  controller: ['getid', '$scope', '$http', NavigationFormCtrl],
  templateUrl: "/modules/navigation/form.html",
  bindings: {
    label: '<',
    title: '<',
    route: '<',
    parent: '<',
    sortindex: '<',
    enabled: '<'

  }
});

app.component("navigationHierarchy", {
  controller: ['getid', '$scope', '$http', NavigationHierarchyCtrl],
  templateUrl: "/modules/navigation/hierarchy.html",
  bindings: {
    tree: "<"
  }
});

/* ---------------- TESTING WITH INTERCOMMUNICATION INSTEAD OF BROADCASTING --------------- */

class NavigationCtrl2 {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.tree = {};
    this.edit = {};
  }

  Reset(){
    this.edit = undefined;
  }

  Console(){
    console.log(this.edit);
  }

  ItemToEdit(item){
    this.edit = item;
    this.Console();
  }

  $onInit() {
    var self = this;

    this.$http.get('/api/navigation/menu_item/all').then(
      function (res) {
        console.log(res.data.DATA);
        self.tree = res.data.DATA.app_menu_items;
      },
      function (res) {

      });
  }

}

class NavigationFormCtrl2 {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.new = true;
  }

  New() {
    console.log("Submit function called");
    this.Submit("/api/navigation/menu_item/add");
  }

  Reset() {
    console.log("Reset function called");
    //this.$scope.$broadcast("ResetData");
    this.editorCtrl.Reset();
    this.new = true;
  }

  Update() {
    console.log("Update function called");
    this.Submit("/api/navigation/menu_item/add");
  }

  Submit(url) {
    var self = this;
    var data = {
      POST: self.edit,
      ERROR: undefined,
      DATA: undefined
    };

    this.$http.post(url, data).then(
      function (res) {
        console.log(res.status);
        console.log(res.message);
      },
      function (res) {
        console.log(res.status);
        console.log(res.messsage);
      }
    );
  }

  Console(){
    console.log(this);
  }


}

class NavigationHierarchyCtrl2 {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.tree = {};
  }

  Console() {
    console.log(this.tree);
  }

  SetActive(item) {
    console.log("Setting item to edit");
    console.log(item);
    this.editorCtrl.ItemToEdit(item);
  }
}



app.component("navigationEditor2", {
  transclude: {
    form: "navigationForm2",
    hierarchy: "navigationHierarchy2"
  },
  templateUrl: "/modules/navigation/editor2.html",
  controller: ['getid', '$scope', '$http', NavigationCtrl2]
});

app.component("navigationForm2", {
  controller: ['getid', '$scope', '$http', NavigationFormCtrl2],
  templateUrl: "/modules/navigation/form2.html",
  bindings: {
    label: '<',
    title: '<',
    route: '<',
    parent: '<',
    sortindex: '<',
    enabled: '<'
  },
  require: {
    editorCtrl: '^navigationEditor2'
  }
});

app.component("navigationHierarchy2", {
  controller: ['getid', '$scope', '$http', NavigationHierarchyCtrl2],
  templateUrl: "/modules/navigation/hierarchy2.html",
  require: {
    editorCtrl: '^navigationEditor2'
  },
  bindings: {
    tree: '<'
  }
});