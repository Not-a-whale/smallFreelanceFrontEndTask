class APIService {
  constructor($http, $q, SessionService, APIQueryConstructor) {
    this.http = $http;
    this.q = $q;
    this.options_cache = {};
    this.session = SessionService;
    this.constructor = APIQueryConstructor;

    this.STRIP_COMMENTS = /((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg;
    this.ARGUMENT_NAMES = /([^\s,]+)/g;
  }

  Success(res) {
    if (IsObj(res.data)) {
      if ('ERROR' in res.data) {
        let error = res.data.ERROR;
        if (error != undefined && error != "") {
          console.error(error);
          return new ErrorObj(error, ErrorLevel.ERROR);
        }
      }
      // keep ERROR and DATA as separate if statements
      // empty ERROR will most likely be in the response
      // and therefore else if will never reach DATA portion
      if ('DATA' in res.data) {
        let data = res.data.DATA;
        if ('records_removed' in data) {
          if (data.records_removed == 'no') {
            return new ErrorObj('Could not delete the data requested.', ErrorLevel.WARNING);
          }
        }
        return data;
      }
    }

    return new ErrorObj('Nothing returned');
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
    // null is intentionally set blank value, undefined is unintentionally
    // default behavior is to clean out undefined and empty strings
    // this will only clean out toplevel attrs, all other attrs will not be cleaned
    // because you can have infinite loop with obj refs
    if (object !== undefined) {
      let newobj = CloneObj(object);
      for (let attr in newobj) {
        if (newobj[attr] === '' || newobj[attr] === undefined) {
          delete newobj[attr];
        }
      }
      return newobj;
    }
    return object;
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

  MakeSingle(data) {
    if (Array.isArray(data)) {
      if (data.length > 0) {
        return data[0];
      }
      return undefined;
    }
    return data;
  }

  Single(url, query) {
    return this.Request('post', url, query).then(this.MakeSingle);
  }

  MakeList(data) {
    if (Array.isArray(data)) {
      return data
    } else {
      return [data];
    }
  }
  List(url, query) {
    return this.Request('post', url, query).then(this.MakeList);
  }
  /**
   *  grabs the options for a select from a specific table column
   * @param {String} table
   * @param {String} column
   */
  Options(table, column) {
    let defer = this.q.defer();
    let promise = defer.promise;
    if (table != undefined && column != undefined) {
      let data_hash = table + column;
      if (data_hash in this.options_cache) {
        defer.resolve(this.options_cache[data_hash]);
        promise = defer.promise;
      } else {
        let self = this;
        let url = ['api', 'options', table, column].join('/');
        promise = this.Request('get', url, undefined).then(function (res) {
          self.options_cache[data_hash] = res;
          return res;
        });
      }
    } else {
      defer.reject('column and table names not provided');
    }
    return promise;
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

  /**
   *
   * @param {String} endpoint
   * @param {Object} query
   *
   *  query:
   * {
   *  search: [{ OR'd } AND'd],
   *  strict: [{ OR'd} AND'd],
   *  orderby: [{key: asc / desc}]
   *  page: int
   *  rows: int
   * }
   */
  Search(endpoint, query) {
    //do proper search query? or completely pointless?
    return this.Request('post', endpoint + '/search', query);
  }
  GetParamNames(func) {
    var fnStr = func.toString().replace(this.STRIP_COMMENTS, '');
    var result = fnStr.slice(fnStr.indexOf('(') + 1, fnStr.indexOf(')')).match(this.ARGUMENT_NAMES);
    if (result === null)
      result = [];
    return result;
  }
  CallFunction(func, params) {
    let deferred = this.q.defer();
    if (!(func in this)) {
      let error = 'calling non existent api call func: ' + func;
      deferred.reject(error);
      console.error(error);
      return deferred.promise;

    }
    if (!(this[func] instanceof Function)) {
      let error = 'calling not an api function func: ' + func;
      deferred.reject(error);
      console.error(error);
      return deferred.promise;
    }

    let paramnames = this.GetParamNames(this[func]);
    let values = [];
    for (let param of paramnames) {
      if (!(param in params)) {
        deferred.reject(undefined);
        console.error('MISSING PARAM IN FUNCTION CALL func: ' + func + ' param: ' + param);
        return deferred.promise;
      }
      values.push(params[param]);
    }

    return this[func](...values);
  }

  // because backend is so flexible, need to create API for talking to it outside of sending generic requests
  GetBusiness(businessId) {
    let endpoint = '/api/Business';
    let query = new APIQuery();
    query.strict.push({
      'me.BizId': businessId
    });
    return this.Single(endpoint, query);
  }

  CreateBusiness(businessData) {
    let endpoint = '/api/Business';
    return this.Create(endpoint, businessData);
  }

  UpdateBusiness(businessData) {
    let endpoint = '/api/Business';
    return this.Update(endpoint, businessData);
  }

  DeleteBusiness(businessData) {
    let endpoint = '/api/Business';
    return this.Delete(endpoint, {
      'BizId': businessData.BizId
    });
  }

  SearchBusiness(query) {
    let endpoint = '/api/Business';
    return this.Search(endpoint, query);
  }

  SearchBranch(user_query) {
    let endpoint = '/api/Branch/List';
    let query = new APIQuery();
    query.Combine(user_query);
    return this.Search(endpoint, user_query);
  }

  GetBusinessBranchList(businessId, user_query) {
    let endpoint = '/api/Branch/List';
    let query = new APIQuery();
    query.orderby.push({
      'me.OfficeName': 'asc'
    });
    if (businessId !== undefined) {
      query.strict.push({
        'me.BizId': businessId
      });
    }

    if (typeof user_query === 'string') {
      query.search.push({
        'me.OfficeName': user_query,
        'me.BrnchEMail': user_query
      });
    }
    return this.List(endpoint, query);
  }

  GetBusinessListByBranch(user_query) {
    let endpoint = '/api/Branch/Info';
    let query = new APIQuery();
    query.Combine(user_query);
    return this.List(endpoint, query);
  }

  GetBranch(branchId) {
    let promise = undefined;
    let defer = this.q.defer();
    if (branchId === 'new') {
      defer.resolve({});
      promise = defer.promise;
    } else {
      let endpoint = '/api/Branch/Info';
      let query = new APIQuery();
      query.strict.push({
        'me.BrnchId': branchId
      });
      promise = this.Single(endpoint, query);
    }
    return promise;
  }

  CreateBranch(branchData, businessId) {
    let promise = undefined;
    let defer = this.q.defer();
    if (businessId === 'new') {
      defer.reject('cant create a branch on a new business');
      promise = defer.promise;
    } else {
      let endpoint = '/api/Branch/Info';
      promise = this.Create(endpoint, branchData);
    }
    return promise;
  }

  UpdateBranch(branchData) {
    let promise = undefined;
    let endpoint = '/api/Branch/Info';
    promise = this.Update(endpoint, branchData);
    return promise;
  }

  DeleteBranch(branchId) {
    let promise = undefined;
    let defer = this.q.defer();
    let endpoint = '/api/Branch/Info';
    if (isNaN(branchId)) {
      defer.reject('trying to delete an invalid business branch');
      promise = defer.promise;
    } else {
      promise = this.Delete(endpoint, {
        BrnchId: branchId
      });
    }
    return promise;
  }

  PersonToAssociate(person) {
    let associate = {};
    if (person == undefined) {
      person = {};
    }
    if ('hr_associate' in person) {
      if (person.hr_associate != undefined) {
        associate = person.hr_associate;
        delete person.hr_associate;
      }
    }
    associate.ast = person;
    return associate;
  }

  DriverToAssociate(driver) {
    return driver.driver;
  }

  SetBranchPrimaryContact(branchId, contactId) {
    let self = this;
    let defer = this.q.defer();
    let endpoint = '/api/Branch/Info';
    let query = new APIQuery();
    query.strict.push({
      'me.BrnchId': branchId
    });
    query.orderby.push({
      'primary_contact.FirstName': 'asc'
    }, {
      'primary_contact.LastName': 'asc'
    }, {
      'primary_contact.NickName': 'asc'
    });
    this.Single(endpoint, query).then(function (result) {
      console.log("these are the primary contacts: ");
      console.log(result);
      for (let primary_contact of result.primary_contact) {
        // branch primary contacts are stored as  "ent_person"
        // primary contact is marked inside of "hr_associate" -_-
        let obj = {
          AstId: primary_contact.PrsnId,
          PrimaryContact: 0
        };
        if (obj.AstId == contactId) {
          obj.PrimaryContact = 1;
        }
        self.Update('/api/Business/Contact', obj).then(self.MakeSingle).then(function (result) {
          if (result.AstId == contactId) {
            defer.resolve(result);
          }
        });
      }
    });
    return defer.promise;
  }
  GetBranchPrimaryContact(branchId) {
    let self = this;
    let promise = undefined;
    let defer = this.q.defer();
    if (branchId === 'new') {
      defer.resolve({});
      promise = defer.promise;
    } else {
      let endpoint = '/api/Branch/Info';
      let query = new APIQuery();
      query.strict.push({
        'me.BrnchId': branchId
      }, {
        'hr_associate.PrimaryContact': 1
      });
      query.orderby.push({
        'primary_contact.FirstName': 'asc'
      }, {
        'primary_contact.LastName': 'asc'
      }, {
        'primary_contact.NickName': 'asc'
      });
      promise = this.Single(endpoint, query).then(function (result) {
        if (result != undefined) {
          let primary_contact = {};
          if ('primary_contact' in result && result.primary_contact != undefined) {
            if (result.primary_contact.length > 0) {
              primary_contact = result.primary_contact[0];
              primary_contact = self.PersonToAssociate(primary_contact);
            }
          }
          return primary_contact;
        }
        return {};
      });
    }
    return promise;
  }


  GetContact(user_query) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery(1, 1);

    query.strict.push({
      'ast.FirstName': user_query.ast.FirstName
    }, {
      'ast.LastName': user_query.ast.LastName
    }, {
      'ast.BrnchId': user_query.ast.BrnchId
    });


    return this.Search(endpoint, query);
  }

  UpdateContact(contactData) {
    let endpoint = '/api/Business/Contact';
    //do  not want anyone setting primary contact through this function
    delete contactData.PrimaryContact;

    return this.Update(endpoint, contactData);
  }

  CreateContact(contactData) {
    let endpoint = '/api/Business/Contact';
    //do not want anyone setting primary contact through this function
    delete contactData.PrimaryContact;
    return this.Create(endpoint, contactData);
  }

  DeleteContact(contactData) {
    let endpoint = '/api/Business/Contact';
    let query = {
      ast: {}
    }; // create a new object and clean it out
    // leaving any extra data will cause it to be deleted
    query.AstId = contactData.AstId;
    query.ast.FirstName = contactData.ast.FirstName;
    query.ast.LastName = contactData.ast.LastName;
    query.ast.MiddelName = contactData.ast.MiddelName;
    query.ast.PrsnId = contactData.ast.PrsnId;
    query.ast.Suffix = contactData.ast.Suffix;
    query.ast.Prefix = contactData.ast.Prefix;
    query.ast.NickName = contactData.ast.NickName;
    return this.Delete(endpoint, query);
  }


  GetBranchContact(branchId, contactId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'ast.BrnchId': branchId
    }, {
      'drv_driver.DriverId': 'NULL' // not a driver
    }, {
      'hr_hire_records.HireId': 'NULL' // not a hired staff
    });

    if (contactId !== undefined) {
      query.strict.push({
        'AstId': contactId
      });
    }
    return this.Single(endpoint, query);
  }

  GetBranchContactList(branchId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'ast.BrnchId': branchId
    }, {
      'drv_driver.DriverId': null // not a driver
    }, {
      'hr_hire_records.HireId': null // not a hired staff
    }, {
      'PrimaryContact': 0
    });

    return this.List(endpoint, query);
  }

  GetBusinessContact(businessId, contactId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'brnch.BizId': businessId
    }, {
      'drv_driver.DriverId': null // not a driver
    }, {
      'hr_hire_records.HireId': null // not a hired staff
    });
    query.strict.push({
      'me.AstId': contactId
    });

    return this.Single(endpoint, query);
  }

  SearchBusinessContact(query) {
    let endpoint = '/api/Business/Contact';
    return this.Search(endpoint, query);
  }

  GetBusinessContactList(businessId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'brnch.BizId': businessId
    }, {
      'drv_driver.DriverId': null // not a driver
    }, {
      'hr_hire_records.HireId': null // not a hired staff
    }, {
      'PrimaryContact': 0
    });

    return this.List(endpoint, query);
  }

  // not sure how to distinguish just contacts vs staff with current API
  GetBusinessStaffList(businessId, staffId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'brnch.BizId': businessId
    }, {
      'drv_driver.DriverId': null
    });

    query.orderby.push({
      'ast.FirstName': 'asc'
    }, {
      'ast.LastName': 'asc'
    });

    if (staffId != undefined) {
      query.strict.push({
        'me.AstId': staffId
      });
    }

    return this.List(endpoint, query);
  }


  GetBusinessStaff(businessId, staffId) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();

    query.strict.push({
      'brnch.BizId': businessId
    }, {
      'me.AstId': staffId
    }, {
      'drv_driver.DriverId': null // not a driver
    });

    return this.Single(endpoint, query);
  }

  GetBusinessDriverList(businessId, user_query) {
    let endpoint = '/api/Business/Contact';
    let query = new APIQuery();
    query.strict.push({
      'brnch.BizId': businessId
    });


    return this.List(endpoint, query);
  }

  GetBusinessDriverDetail(businessId) {
    let endpoint = '/api/Business/Driver';
    let query = new APIQuery();

    return this.Single(endpoint, query);
  }

  GetDriverLicense(driverId) {
    let endpoint = '/api/Business/Driver/License/Detail';
    let query = new APIQuery();

    query.strict.push({
      'DriverId': driverId
    });

    return this.Single(endpoint, query);
  }

  GetBusinessInsuranceEntityList(entityId) {
    let endpoint = '/api/Insurance/Entity/Info';
    let query = new APIQuery();

    query.strict.push({
      'me.EntityId': entityId
    });

    query.search.push({
      RemovedBy: null
    });

    return this.List(endpoint, query);
  }

  GetBusinessInsuranceEntityRemovedList(businessId) {
    let endpoint = '/api/Insurance/Entity/Info';
    let query = new APIQuery();

    query.strict.push({
      'me.EntityId': businessId
    });

    query.search.push({
      RemovedBy: ''
    });

    return this.List(endpoint, query);
  }

  UpdateInsuranceEntity(insuranceData) {
    let endpoint = '/api/Insurance/Entity/Info';
    delete insuranceData.RemovedBy;
    delete insuranceData.DateRemoved;
    return this.Update(endpoint, insuranceData);
  }

  DeleteInsuranceEntity(insuranceId, entityId, insToEntityId) {
    let endpoint = '/api/Insurance/Entity/Info';

    let query = {
      InsEntId: insToEntityId,
      InsId: insuranceId,
      EntityId: entityId,
      RemovedBy: this.session.id,
      DateRemoved: new Date()
    };

    return this.Update(endpoint, query);
  }

  CreateInsuranceEntity(insuranceData) {
    let endpoint = '/api/Insurance/Entity/Info';

    insuranceData.AddedBy = this.session.id;
    insuranceData.DateRemoved = null;
    insuranceData.RemovedBy = null;

    return this.Create(endpoint, insuranceData);
  }

  CreateIFTAAccount(iftaData) {
    let endpoint = '/api/IFTA/Account';

    return this.Create(endpoint, iftaData);
  }

  UpdateIFTAAccount(iftaData) {
    let endpoint = '/api/IFTA/Account';
    return this.Update(endpoint, iftaData);
  }
  DeleteIFTAAccount(iftaData) {
    let endpoint = '/api/IFTA/Account';
    let query = CloneObj(iftaData);

    delete query.BizId; // do not want to delete the business
    delete query.biz; // do not want to delete the business
    delete query.biz_ifta; // do not want to delete the business

    return this.Delete(endpoint, query);
  }

  GetIFTAAccount(user_query) {
    let endpoint = '/api/IFTA/Account';
    let constructor = this.constructor('IFTAAccount');
    let query = constructor.ConstructQuery(user_query);
    return this.Search(endpoint, query);
  }

  GetCarrierStatePermit(user_query) {
    let endpoint = '/api/Permit/State';
    let constructor = this.constructor('CarrierStatePermit');
    let query = constructor.ConstructQuery(user_query);
    return this.Search(endpoint, query);
  }

  CreateCarrierStatePermit(permitData, carrierId) {
    let endpoint = '/api/Permit/State';
    if (isNaN(parseInt(carrierId)) == false) {
      permitData.crr_prmt_acc.CarrierId = carrierId;
    }
    return this.Create(endpoint, permitData);
  }

  UpdateCarrierStatePermit(permitData) {
    let endpoint = '/api/Permit/State';
    return this.Update(endpoint, permitData);
  }

  DeleteCarrierStatePermit(permitData) {
    //clean up the input
    let endpoint = '/api/Permit/State';

    delete permitData.carrier; //dont want to delete the carrier
    delete permitData.CarrierId;

    return this.Delete(endpoint, permitData);

  }

}

app.service('APIService', APIService);


app.factory('APIQueryConstructor', function ($http) {
  // fetches the api constructors for searching and what not
  let constructors = [];

  $http.get('/api_constructors.json').then(function (result) {
    let constrs = result.data;
    for (let c of constrs) {
      constructors.push(new APIQueryConstructor(c));
    }
  });


  return function (name) {
    return constructors.find(x => x.name === name);
  }

});

// constructs a search query
// used in tables for searching columns data
class APIQueryConstructor {
  constructor(config) {
    this.name = config.name;
    this.strict = config.strict;
    this.search = config.search;
    this.orderby = config.orderby;
    this.page = config.page;
    this.rows = config.rows;

    this.config = {
      'strict': 'ConstructStrict',
      'search': 'ConstructSearch',
      'orderby': 'ConstructOrderBy'
    };
  }
  ConstructQuery(query) {
    if (query == undefined) {
      return undefined;
    }
    let apiQuery = new APIQuery(query.rows, query.page);

    for (let indicator in this.config) {
      if (indicator in query) {
        let func = this.config[indicator];
        apiQuery[indicator].push(...this[func](query[indicator]));
      }
    }
    return apiQuery;
  }
  ConstructSearch(query) {
    return this.ConstructGeneric('search', query);
  }
  ConstructStrict(query) {
    return this.ConstructGeneric('strict', query);
  }
  ConstructGeneric(attr, query) {
    let result = [];
    for (let s in this[attr]) {
      if (s in query) {
        let obj = {};
        for (let f of this[attr][s]) {
          obj[f] = query[s];
        }
        result.push(obj);
      }
    }
    return result;
  }
  ConstructOrderBy(query) {
    let result = [];
    for (let s in this.orderby) {

      let direction = 'asc';
      if (s in query) {
        direction = query[s];
      }

      if (direction !== 'asc' || direction !== 'desc') {
        if (direction) {
          direction = 'asc';
        } else {
          direction = 'desc';
        }
      }
      // order by will always apply all the config fields in asc
      for (let f of this.orderby) {
        let obj = {};
        obj[f] = direction;
        result.push(obj);
      }
    }
    return result;
  }
}

class APIQuery {
  constructor(rows, page) {
    this.rows = rows || 25;
    this.page = page || 1;
    this.strict = [];
    this.search = [];
    this.orderby = [];
  }

  Combine(user_query) {
    if (user_query == undefined) {
      return;
    }
    if ('rows' in user_query) {
      this.rows = user_query.rows;
    }

    if ('page' in user_query) {
      this.page = user_query.page;
    }

    if ('strict' in user_query) {
      this.strict = this.strict.concat(user_query.strict);
    }

    if ('search' in user_query) {
      this.search = this.search.concat(user_query.search);
    }

    if ('orderby' in user_query) {
      this.orderby = this.orderby.concat(user_query.orderby);
    }
  }
}