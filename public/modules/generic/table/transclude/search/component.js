class UITableHeaderCtrl {
  constructor(scope, timeout) {
    this.scope = scope;
    this.timeout = timeout;
    this.advanced = false;
    this.search = false;
  }

  SearchToggle(){
    this.search = !this.search;
  }

  SearchOpen(){
    this.search = true;
  }

  SearchBasicOpen(){
    this.search = true;
    this.advanced = false;
  }

  SearchAdvToggle(){
    this.advanced = !this.advanced;
  }

  SearchAdvOpen(){
    this.advanced = true;
  }

  SearchAdvClose(){
    this.advanced = false;
  }

  SearchAdvVisible(){
    return this.search && this.advanced;
  }

  SearchBasicVisible(){
    return this.search && this.advanced == false;
  }

  SearchVisible(){
    return this.search;
  }

  $onInit(){
    let self = this;
    let searchopen_hndl = this.scope.$on('SearchOpen', function(){
      self.SearchOpen();
    });

    this.scope.$on('$destroy', searchopen_hndl);
  }
}

app.controller('UITableHeaderCtrl', ['$scope', '$timeout', UITableHeaderCtrl] );
app.directive('uiTableHeader', function() {
  return {
    restrict: 'E',
    templateUrl: 'modules/generic/table/transclude/search/search.template.html',
    scope: true,
    controller: 'UITableHeaderCtrl',
    controllerAs: '$ctrl',
    bindToController: {
      fields: '='
    },
    transclude: {
      advanced: '?uiTableSearchAdvanced',
      basic: '?uiTableSearchBasic',
      header: '?uiTableBanner'
    }
  }
});
