class MenuTwoTierCtrl {
  constructor($scope, $http, getid) {
    this.id = getid();
    this.items = [];
    this.$scope = $scope;
    this.$http = $http;
  }

  SetActive(activeItem) {
    this.items.app_menu_items.forEach(
      item => {
        item.app_menu_items.forEach(
          item => {
            item.active = undefined;
          })
      }
    );
    activeItem.active = 1;
  }

  $onInit() {
    var self = this;
    this.$http.get(self.url).then(
      function (res) {
        self.items = res.data.DATA;
      },
      function (res) {
        console.log(res.message);
      }
    );
  }
}

class MenuOneTierCtrl {
  constructor($scope, $http, getid) {
    this.id = getid();
    this.items = [];
    this.$scope = $scope;
    this.$http = $http;
  }

  SetActive(activeItem) {
    this.items.app_menu_items.forEach(
      item => {
        item.active = undefined;
      }
    );
    activeItem.active = 1;
  }

  $onInit() {
    var self = this;
    this.$http.get(self.url).then(
      function (res) {
        self.items = res.data.DATA;
      },
      function (res) {
        console.log(res.message);
      }
    );
  }
}

app.controller('MenuTwoTierCtrl', MenuTwoTierCtrl);
app.controller('MenuOneTierCtrl', MenuOneTierCtrl);