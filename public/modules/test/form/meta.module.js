class MetaComponentPostCtrl extends GenericService {
  constructor(http, mcs) {
    super(http);
    this.mcs = mcs;
    this.http = http;
    this.url = "/echo";
    this.gate = {};

    this.geturl = "";
    this.posturl = "";
  }

  SelectMe(item){
    this.mcs.SelectItem(item);
    this.mcs.Transition();
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

  Pull() {
    var self = this;
    this.Request('post', this.geturl, this.gate, undefined, function (res) {
      self.gate = res.data.DATA;
    });

  }

  Get() {
    var self = this;
    this.Request('get', this.geturl, undefined, undefined, function (res) {
      self.gate = res.data.DATA;
    });
  }

  Search(url, query) {
    console.log("this is the form doing search");
    console.log("this is the url " + url);
    console.log(query);
    let self = this;
    // because its a post and body is where the params are expected....
    this.Request('post', url, query, undefined, function (res) {
      self.gate = res.data.DATA;
    }, undefined);
  }
}

app.component("metaComponentPost", {
  templateUrl: 'modules/test/form/meta.template.html',
  controller: ['$http','MetaComponentService', MetaComponentPostCtrl],
  bindings: {
    gate: '=',
    meta: '=?',
    components: '<?'
  }
});