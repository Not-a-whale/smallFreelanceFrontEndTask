class UITableBannerCtrl {
  constructor(scope, timeout) {
    this.scope = scope;
    this.timeout = timeout;
    this.fields = [];
    this.sorting = {};
    this.position = 0;

    this.searchcall = undefined;
    this.timeoutdelay = 300;
  }

  Search() {
    let self = this;
    this.timeout.cancel(this.searchcall);
    this.searchcall = this.timeout(
      function () {
        console.log("emit search event");
        self.scope.$emit('TableSearch');
      }, this.timeoutdelay);
  }

  SearchOrderActive(field, order) {
    let fieldobj = this.fields.find((x) => {
      return x.name === field;
    });
    return fieldobj.order === order;
  }

  SearchOrder(field, order) {
    let fieldobj = this.fields.find((x) => {
      return x.name === field;
    });
    if (fieldobj != undefined) {
      if (fieldobj.order != order) {
        fieldobj.order = order;
        if (!(field in this.sorting)) {
          this.sorting[field] = this.position++;
          fieldobj.sort = this.sorting[field];
        }
      } else {
        fieldobj.order = null;
        if (field in this.sorting) {
          delete this.sorting[field];
          this.position--;
          for (let fobj of this.fields){
            if (fobj.sort > fieldobj.sort){
              fobj.sort--;
            }
          }
          fieldobj.sort = null;
        }
      }

    }
    if (this.onSearchOrder instanceof Function) {
      this.onSearchOrder({
        field: field,
        order: order
      });
    } else {
      console.error('onSearchOrder not bound to table banner');
    }
  }
}

// app.component('uiTableBanner', {
//   templateUrl: 'modules/generic/table/transclude/banner/template.html',
//   controller: ['$scope', '$timeout', UITableBannerCtrl],
//   bindings: {
//     fields: '<',
//     onSearchClick: '&?',
//     onSearchOrder: '&?'
//   }
// })