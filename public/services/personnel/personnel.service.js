class PersonnelService extends GenericService {
  constructor(http) {
    super(http);
  }

  PersonnelSearch(query) {
    let self = this;
    return this.Request('post', '/api/associates/search', query, undefined, function (res) {
      if (IsObj(res.data)) {
        return res.data.DATA;
      }

      return [];

    }, function (res) {
      console.error(res.statusText);
      return [];
    });
  }

  PersonnelFind(query) {
    let self = this;
    return this.Request('post', '/api/associates/search', query, undefined, function (res) {
      if (res.data.DATA.length > 0) {
        return res.data.DATA[0];
      }
      return res.data.DATA;
    });
  }
}

app.service('PersonnelService', ['$http', PersonnelService]);