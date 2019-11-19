class MetaComponentPostCtrl extends GenericService {
  constructor(http) {
    super(http);
    this.http = http;
    this.url = "/echo";
    this.gate = {};
  }

  ResetData() {
    this.gate = {};
  }

  Post(url, data) {
    if (url == undefined || url == null) {
      url = this.url;
    }

    if (data == undefined || data == null) {
      data = this.gate;
    }
    var self = this;

    this.Request('post', url, data, undefined, function (res) {
      self.response = JSON.stringify(res.data, undefined, '    ');
      console.log(res.status);
    });
  }

  Search(url, query) {
    console.log("this is the form doing search");
    console.log("this is the url " + url);
    console.log(query);
    let self = this;
    // because its a post and body is where the params are expected....
    this.Request('post', url, query, undefined , function (res) {
      self.gate = res.data.DATA;
    }, undefined);
  }
}

app.component("metaComponentPost", {
  templateUrl: 'modules/test/form/meta.template.html',
  controller: ['$http', MetaComponentPostCtrl],
  bindings: {
    url: '@?',
    gate: '=?'
  }
});