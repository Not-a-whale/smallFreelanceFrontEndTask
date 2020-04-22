class APIService {
  constructor($http, $q) {
    this.http = $http;
    this.q = $q;
    this.options_cache = {};
  }

  Success(res) {
    if (IsObj(res.data)) {
      if ('ERROR' in res.data) {
        let error = res.data.ERROR;
        if (error != undefined && error != "") {
          return new ErrorObj(error, ErrorLevel.ERROR);
        }
      }
      // keep as separate if statements
      // ERROR will most likely be in the response
      // and therefore else if will never reach DATA portion
      if ('DATA' in res.data) {
        return res.data.DATA;
      }
    }

    return new ErrorObj('Nothing returned');;
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
    console.error(res);
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

  Single(url, query) {
    return this.Request('post', url, query).then(function (data) {
      let retdata = data;
      if (Array.isArray(retdata) && retdata.length > 0) {
        retdata = retdata[0];
      }
      return retdata;
    });
  }

  Table(url, query) {
    return this.Request('post', url, query);
  }



  Request(method, url, object, query) {
    if (method != 'get' && method != 'post') {
      console.error('not correct method used ' + method);
      return;
    }
    if (url == undefined) {
      console.error('no url provided to request');
      return;
    }

    url += this.BuildQuery(query);
    var obj = this.BuildObject(object);
    var data = {
      POST: obj,
      ERROR: '',
      DATA: ''
    };

    let config = {
      headers: {
        'Accept': 'application/json'
      }
    };

    return this.http[method](url, data, config).then(this.Success, this.Failure);
  }

  List(url, query) {
    return this.Request('post', url, query);
  }

  Options(table, column) {
    if (table + column in this.options_cache) {
      let defer = this.q.defer();
      defer.resolve(this.options_cache[table + column]);
      return defer.promise;
    } else {
      let self = this;
      let url = ['api', 'options', table, column].join('/');
      return this.Request('get', url, undefined).then(function (res) {
        self.options_cache[table + column] = res;
        return res;
      });
    }

  }

  Create(endpoint, query) {
    return this.Request('post', endpoint + '/create', query);
  }

  Update(endpoint, query) {
    return this.Request('post', endpoint + '/update', query);
  }

  Delete(endpoint, query) {
    return this.Request('post', endpoint + '/delete', query);
  }

  First(data) {
    let retdata = data;
    if (Array.isArray(data) && data.length > 0) {
      retdata = data[0];
    }
    return retdata;
  }
}

app.service('APIService', APIService);