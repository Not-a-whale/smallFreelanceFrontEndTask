class MetaComponentPostCtrl {
  constructor(http) {
    this.http = http;
    this.url = "/echo";
    this.gate = {};
  }

  ResetData(){
    this.gate = {};
  }

  Post() {
    var self = this;
    this.http.post(this.url, this.gate).then(function (res) {
      self.response = res.data;
      console.log(res.status);
    });
  }
}

app.component("metaComponentPost", {
  templateUrl: 'modules/test/form/meta.template.html',
  controller: ['$http', MetaComponentPostCtrl],
  bindings: {
    url : '@?'
  }
});