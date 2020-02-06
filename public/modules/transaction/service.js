class TransactionService extends GenericService {
  constructor(http) {
    super(http);
    this.url = "api/transactiontemplate";
  }

  List() {
    let url = this.url + "/list";
    let query = {
      rc: 10
    };
    return super.List(url, undefined, query);
  }

  Single(id) {
    let url = this.url + "/detail";
    let obj = {}
    let query = {
      'id': id
    };
    let item = super.Single(url, obj, query);
    // console.log(item);
    return item;
  }

  Children(id) {
    let url = this.url + "/children";
    let query = {
      id: id
    };
    let success = function (res) {
      console.log(res.data.DATA.children);
      return res.data.DATA.children;
    }
    let failure = function (res) {};
    return this.Request('post', url, undefined, query, success, failure);
  }
}

app.service('TransactionService', [
  '$http', TransactionService
]);