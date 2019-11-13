class MetaComponentPostCtrl extends GenericService {
  constructor(http) {
    super(http);
    this.http = http;
    this.url = "/echo";
    this.gate = {};
  }

  ResetData(){
    this.gate = {};
  }

  Post() {
    var self = this;

    this.Request('post', this.url, this.gate, undefined, function (res) {
      self.response = JSON.stringify(res.data,undefined, '    ');
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