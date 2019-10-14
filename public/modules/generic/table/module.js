class GenericTableCtrl {
  constructor(getid, $scope, $http) {
    this.id = getid();
    this.$scope = $scope;
    this.$http = $http;
    this.list = []; // the contents to display
    this.headers = []; // display the headers
    this.search = []; // the search fields
    this.url = undefined; // required to fetch data
    this.expanded = false;
    this.selectCount = 0;
    this.rows = 10;
    this.page = 1;
  }

  SelectCount() {
    return this.selectCount;
  }

  SelectToggle() {
    if (this.selectCount != this.list.length) {
      this.list.forEach((x) => {
        x.selected = true;
      });
      this.selectCount = this.list.length;
    } else {
      this.SelectClear();
    }
  }

  SearchToggle() {
    this.expanded = !this.expanded;
  }

  Select(element) {
    element.selected = !element.selected;

    if (element.selected) {
      this.selectCount++;
    } else {
      this.selectCount--;
    }
  }

  SelectClear() {
    this.list.forEach((x) => {
      x.selected = false;
    });

    this.selectCount = 0;
  }

  BuildSearchQuery() {
    return '';
  }

  BuildQuery() {
    let query = this.url;
    query += "?rc=" + this.rows + "&pg=" + this.page;
    query += this.BuildSearchQuery();
    return query;
  }

  $onInit() {
    var self = this;
    if (self.url) {
      this.$http.get(this.BuildQuery()).then(function (res) {
        self.list = res.data.DATA.list;
        self.headers = res.data.DATA.headers;
      }, function (res) {
        console.error(res.statusText);
      })
    } else {
      console.error("No url provided for table " + this.id);
    }
  }
}

app.directive("genericTable", function () {
  return {
    scope: {
      url: '@?'
    },
    restrict: 'E',
    bindToController: true,
    controllerAs: '$ctrl',
    transclude: true,
    templateUrl: "/modules/generic/table/default.html",
    controller: ["getid", "$scope", "$http", GenericTableCtrl],
    compile: function compile(tElement, tAttrs) {
      var table = tElement.children();
      var select = table[0].querySelector('.header .select .options');
      var search = table[0].querySelector('.header .search .options');
      var rows = table[0].querySelector('.body .row .content');
      var options = table[0].querySelector('.body .row .options');
      tElement.html('');
      tElement.append(table);
      return {
        pre: function preLink(scope, iElement, iAttrs, ctrl, transclude) {
          transclude(function (transEl) {
            Object.values(transEl).forEach(el => {
              console.log(el.tagName);
              let element = undefined;
              switch (el.tagName) {
                case "TABLE-ROW":
                  element = rows;
                  break;
                case "TABLE-ROW-OPTIONS":
                  element = options;
                  break;
                case "TABLE-SELECT-OPTIONS":
                  element = select;
                  break;
                case "TABLE-SEARCH-OPTIONS":
                  element = search;
                  break;
              }
              if (element != undefined) {
                element.append(el);

                // Object.values(el.children).forEach(x => {
                //   if (x != undefined) {
                //     if (typeof (x) != 'number' && x.nodeName != "#text") {
                //       console.log(x);
                //       element.append(x);
                //     }
                //   }
                // });

              }

            });

            // Object.values(transEl).forEach(x => {
            //   console.log(x.tagName);


            //   // group options

            //   // row options
            // });
          });
        },
        post: function postLink(scope, iElement, iAttrs, ctrl) {}
      }
    }
  }
});