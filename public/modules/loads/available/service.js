class LoadService extends GenericService {
  constructor(http) {
    super(http);
    this.url = "api/loads";
  }

  List() {
    return [{
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    }, {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    },
    {
      weight: 35030,
      miles: 234,
      rate_mile: 2.05
    }];
  }
}

app.service("LoadService", ['$http', LoadService]);