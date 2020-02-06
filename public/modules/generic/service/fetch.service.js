class GenericService {
  constructor(http) {
    this.http = http
  }

  Success(res) {
    if (IsObj(res.data)){
      if ('ERROR' in res.data){
        let error = res.data.ERROR;
        if (error != undefined && error != ""){
          return new ErrorObj(error);
        }
      }

      if ('DATA' in res.data){
        return res.data.DATA;
      }
    }

    return [];
  }

  // Default verbose alert
  // this is only for when there is a server error
  // application errors are handled in the success function
  Failure(res) {
    let messagestr = res.data.status + "\n";
    if (res.data.title != undefined) {
      messagestr += res.data.title + "\n";
    }
    if (res.data.message != undefined) {
      messagestr += res.data.message + "\n";
    }
    if (res.data.exception != undefined) {
      messagestr += res.data.exception + "\n";
    }
    alert(messagestr);
  }

  // builds query for url
  BuildQuery(query) {
    let query_str = "";
    if (query != undefined) {
      if (Object.keys(query).length > 0) {
        let queries = [];
        for (let key in query) {
          let val = query[key];
          if (val != undefined && val != '') {
            queries.push(key + "=" + encodeURIComponent(val));
          }

        }
        query_str = "?" + queries.join('&');
      }
    }
    return query_str;
  }

  // Builds the object to send to the server in request body
  BuildObject(object) {
    // default behavior is to clean out undefined and empty strings
    // this will only clean out toplevel attrs, all other attrs will not be cleaned
    // because you can have infinite loop with obj refs
    if (object !== undefined) {
      let newobj = CloneObj(object);
      for (let attr in newobj) {
        if (newobj[attr] === '' || newobj[attr] == undefined) {
          delete newobj[attr];
        }
      }
      return newobj;
    }
    return object;
  }

  // Deprecated
  Single(url, object, query) {
    query.rc = '1';
    return this.Request('get', url, object, query,
      function (res) {
        return res.data.DATA.item;
      },
      function (res) {
        console.error(res.statusText);
      });
  }

  // Deprecated
  List(url, object, query) {
    return this.Request('get', url, object, query,
      function (res) {
        return res.data.DATA.list;
      },
      function (res) {
        console.error(res.statusText);
      });
  }

  Request(method, url, object, query, success, failure) {
    if (method != 'get' && method != 'post') {
      return;
    }
    if (url == undefined) {
      return;
    }

    url += this.BuildQuery(query);
    var obj = this.BuildObject(object);
    var data = {
      POST: obj,
      ERROR: '',
      DATA: ''
    };

    let funSuccess = success || this.Success;
    let funFailure = failure || this.Failure;

    let config = {
      headers: {
        'Accept': 'application/json'
      }
    };

    return this.http[method](url, data, config).then(funSuccess, funFailure);
  }
}