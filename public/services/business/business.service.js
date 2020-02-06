class BusinessService extends GenericService {
  constructor(http) {
    super(http);
  }

  _set_primary_contact(branch) {
    for (let person of branch.ent_people) {
      if (person.hr_associate) {
        if (person.hr_associate.PrimaryContact) {
          branch.primary_contact = person;
        }
      }
    }
  }

  BusinessSearch(query) {
    let self = this;
    return this.Request('post', '/api/business/branches/search', query, undefined, function (res) {
      if (IsObj(res.data)) {
        if ('DATA' in res.data) {
          for (let branch of res.data.DATA) {
            self._set_primary_contact(branch);
          }
          return res.data.DATA;
        }
      }

      return [];

    }, function (res) {
      console.error(res.statusText);
      return [];
    });
  }

  BusinessFind(query) {
    let self = this;
    return this.Request('post', '/api/business/branches/search', query, undefined, function (res) {
      if (res.data.DATA.length > 0) {
        //set the primary contact:
        let branch = res.data.DATA[0];
        self._set_primary_contact(branch);
        return res.data.DATA[0];
      }
      return res.data.DATA;
    });
  }

  CarrierSearch(query) {
    let self = this;
    if (query != undefined && !('search' in query)){
      query.search = [{}];
    }
    return this.Request('post', '/api/carrierbranches/search', query);
  }

  CarrierFind(query) {
    query.rows = 1;
    return this.Request('post', '/api/carrierfullinfo', query).then(function(data){
      if (data instanceof ErrorObj){

      } else {
        if (data.length > 0){
          return data[0];
        }
      }
    });
  }

  TableOfCarriers() {
    let query = {search: [{}], page : 1};
    return this.CarrierSearch(query);
  }

  TableOfBusinesses() {
    let query = {
      orderby: [{
        'biz.BizName': 'asc'
      }]
    };
    let self = this;
    return this.Request('post', '/api/business/branches/search', query, undefined, function (res) {
      console.log(res.data);
      for (let branch of res.data.DATA) {
        self._set_primary_contact(branch);
      }
      return res.data.DATA;
    });
  }
}

app.service('BusinessService', ['$http', BusinessService]);