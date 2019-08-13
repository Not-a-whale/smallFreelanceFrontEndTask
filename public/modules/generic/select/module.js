class GenericSelectCtrl extends GenericInputCtrl {
  constructor(getid, $http) {
    super(getid);

    this.$http = $http;
    this.options = [];
  }

  $onInit() {
    var self = this;
    if (self.sample) {
      self.$http.get('/modules/temp/select_data.json').then(function (res) {
        self.options = res.data;
        self.value = self.options[0];
      }, function (res) {
        console.log("Class: Error loading sample values")
      });
    } else {
      self.$http.get(self.url).then(function (res) {
        self.options = res.data;
        if (self.default) {
          self.value = self.options[0];
        }

      }, function (res) {
        console.log("Could not load data for element #" + self.id);
      });
    }
  }
}

app.component('genericSelect', {
  templateUrl: '/modules/generic/select/default.html',
  controller: ['getid', '$http', GenericSelectCtrl],
  bindings: select_bindings
});