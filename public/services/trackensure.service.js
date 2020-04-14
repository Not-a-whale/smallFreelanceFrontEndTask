class TrackEnsureService {
  constructor(http) {
    this.http = http;
    this.token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb25zdW1lck5hbWUiOiJVU0tPVE1TIiwiYWNjb3VudFBpbiI6Ikc4UzJKIiwiZXhwIjozMjUwMzY5ODAwMH0.AOY7IcOFEF-G7QO3R3cETUo6FpM3oaginSyIKce6Jbc';
    this.domain = 'https://trackensure.com';
  }

  TruckInfo(number) {
    let req = {
      method: 'GET',
      url: this.base + '/extapi/asset-position/truck',
      headers: {
        'X-AUTH-TOKEN': this.token,
      },
      params: {
        truckNumber: number
      }
    };

    return this.http(req).then(function (res) {
      return res.data;
    });
  }
}

app.service('TrackEnsure', ['$http', TrackEnsureService]);