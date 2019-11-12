class PhoneService {
  constructor(http) {

    this.http = http;

    this.dialurl = 'api/phone/dial';
  }

  BuildQuery(queryObj) {
    let queryStr = '';
    if (typeof  queryObj  === 'object' && queryObj !== null) {
      let queryList = [];
      Object.keys(queryObj).forEach((x) => {
        if (queryObj[x] !== undefined){
          queryList.push(encodeURI(x) + '=' + encodeURI(queryObj[x]));
        }
      });

      queryStr = queryList.join("&");
    }
    return queryStr;
  }

  Dial(user, phone, options) {
    var self = this;
    let dialquery = this.BuildQuery({user: user, number: phone.number, ext: phone.extension, options: options});
    this.http.get(this.dialurl + '?' + dialquery).then(function(res) {
      console.log("Dialed " + phone.number + ' ext ' + phone.extension);
    }, function(res) {
      console.error(res.statusText);
    });
  }
}

app.service('PhoneService', ['$http', PhoneService]);