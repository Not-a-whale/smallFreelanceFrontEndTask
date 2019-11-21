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
    this.meta = undefined;
    this.response = undefined;
  }

  Post(url, data) {
    if (url == undefined || url == null) {
      url = this.url;
    }

    if (data == undefined || data == null) {
      data = this.gate;
    }
    var self = this;

    let resfun = function (res) {
      self.response = JSON.stringify(res.data, undefined, '    ');
      console.log(res.status);
    };
    this.Request('post', url, data, undefined, resfun, resfun);
  }

  Pull() {
    var self = this;
    this.Request('post', this.geturl + '/search', this.gate, undefined, function (res) {
      self.gate = res.data.DATA;
    });

    this.Request('post', this.geturl + '/meta', this.gate, undefined, function (res) {
      self.meta = res.data.META;
    });

  }

  Get() {
    var self = this;
    this.Request('get', this.geturl, undefined, undefined, function (res) {
      self.gate = res.data.DATA;
    });
    this.Request('get', this.geturl + '/meta', this.gate, undefined, function (res) {
      self.meta = res.data.META;
    });
  }

  Search(url, query) {
    let self = this;
    // query is going as the "object" because its a post and body is where the params are expected....
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