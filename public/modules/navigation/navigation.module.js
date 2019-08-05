var app = angular.module("tms", ["ui.router"]);

app.config(["$stateProvider", "$urlRouterProvider", function ($stateProvider, $urlRouterProvider) {
  $urlRouterProvider.otherwise("/");

  var navbar = {
    templateUrl: "modules/navigation/navmenu.html",
    controller: ['$scope', '$http', NavbarCtrl]
  };



  $stateProvider.state("tmsapp", {
    url: "/",
    views: {
      main: {
        templateUrl: "modules/navigation/main.html"
      },
      "content@tmsapp": {
        templateUrl: "modules/navigation/content.html"
      },
      "navbar@tmsapp": navbar
    }
  });
}]);


var NavbarCtrl = function ($scope, $http) {

  $scope.app_menu_items;

  $scope.LoadData = function () {
    $http.get("/api/navigation/menu_item/all")
      .then(function (response) {
        console.log(response);
        console.log(response.status);
        if ((response.status == 200 || response.status == 304)) {
          if (response.headers('content-type') == 'application/json') {
            let data = response.data.DATA;
            $scope.app_menu_items = data.app_menu_items;
            console.log(data);
          }
        }
      });
  };

  $scope.LoadData();

  $scope.Console = function () {
    console.log($scope.app_menu_items);
  }


  $scope.MenuAction = function (post) {
    if (post.app_menu_actions) {
      post.app_menu_actions.forEach(function (element) {
        console.log(element.Route + ' => ' + element.TargetNode);
        $scope[element.TargetNode] = element.Route;
      });
    } else {
      console.log(post.Label + 'has no action');
    }
  };
}

app.controller('navbarctrl', ['$scope', '$http', NavbarCtrl]);

/* --------------------------------------------------------------------------------------------- */
app.controller(
  "EditMainMenuTree",
  function ($scope, $http) {

    $scope.rec = {
      "ParentId": {
        "Label": null,
      },
      "Label": null,
      "Title": null,
      "Icon": null,
      "Enabled": null,
      "SortIndex": null,
      "app_menu_actions": [{
        "MenuActionId": null,
        "MenuItemId": null,
        "TargetType": null,
        "ParentAction": null,
        "Route": null,
        "Comments": null,
        "TargetNode": null
      }, {
        "MenuActionId": null,
        "MenuItemId": null,
        "TargetType": null,
        "ParentAction": null,
        "Route": null,
        "Comments": null,
        "TargetNode": null
      }]
    };

    $http.get("navigation/AppMenuItemsAll.fcgi")
      .then(function (response) {

        if (response.status == 200 || response.status == 304) {
          if (response.headers('content-type') == 'application/json') {
            let data = response.data.DATA;
            $scope.app_menu_items = data.app_menu_items;
          }
        }
      });
    /* --------------------------------------------------------------------------------------------- */
    $scope.ShowTreeOnTheConsole = function () {
      console.log($scope.app_menu_items);
    };

    /* --------------------------------------------------------------------------------------------- */
    $scope.EditMenuItem = function (post) {
      $http.post("/navigation/SingleItem.fcgi", JSON.stringify({
          "POST": {
            "MenuItemId": post.MenuItemId
          }
        }))
        .then(function (response) {
          if (response.status == 200 || response.status == 304) {
            let data = response.data.DATA;
            data.app_menu_actions.push({
              "MenuActionId": null,
              "MenuItemId": null,
              "TargetType": null,
              "ParentAction": null,
              "Route": null,
              "Comments": null,
              "TargetNode": null
            }, {
              "MenuActionId": null,
              "MenuItemId": null,
              "TargetType": null,
              "ParentAction": null,
              "Route": null,
              "Comments": null,
              "TargetNode": null
            });
            $scope.rec = data;
          }
        });
    };
    /* --------------------------------------------------------------------------------------------- */
    $scope.SubmitMenuItem = function () {
      console.log($scope.rec);
      $http.post("navigation/SubmitItemAndActions.fcgi", JSON.stringify($scope.rec))
        .then(function (response) {
          if (response.status == 200) { // || response.status == 304
            if (response.headers('content-type') == 'application/json') {
              let data = response.data.DATA;

              $scope.app_menu_items = data.app_menu_items;
              $scope.ResetMenuItem();

            } else {
              console.log("Error:" + response.status);
            }
          }
        });
    };
    /* --------------------------------------------------------------------------------------------- */
    $scope.DeleteMenuItem = function () {
      console.log($scope.rec);
      $http.post("navigation/DeleteItemAndActions.fcgi", JSON.stringify($scope.rec))
        .then(function (response) {
          if (response.status == 200) { // || response.status == 304
            if (response.headers('content-type') == 'application/json') {
              let data = response.data.DATA;

              $scope.app_menu_items = data.app_menu_items;
              $scope.ResetMenuItem();

            } else {
              console.log("Error:" + response.status);
            }
          }
        });
    };

    /* --------------------------------------------------------------------------------------------- */
    $scope.ResetMenuItem = function () {
      $scope.rec = {
        "ParentId": {
          "Label": null,
        },
        "Label": null,
        "Title": null,
        "Icon": null,
        "Enabled": null,
        "SortIndex": null,
        "app_menu_actions": [{
          "MenuActionId": null,
          "MenuItemId": null,
          "TargetType": null,
          "ParentAction": null,
          "Route": null,
          "Comments": null,
          "TargetNode": null
        }, {
          "MenuActionId": null,
          "MenuItemId": null,
          "TargetType": null,
          "ParentAction": null,
          "Route": null,
          "Comments": null,
          "TargetNode": null
        }]
      };
    }

  }
);