class UISubformListCtrl {
  constructor(scope, element, compile) {
    this.scope = scope;
    this.element = element;
    this.compile = compile;
  }

  hasHeader() {
    return this.header != undefined && Array.isArray(this.header) && this.header.length > 0;
  }

  Compile() {
    if (this.cardComp != undefined) {
      let cardsroot = this.element.find('cards');
      let cstr = '<' + this.cardComp + ' ng-click="$ctrl.Select(item)" ng-repeat="item in $ctrl.listitems" item="item" ng-class="{active: item.isActive()}"></' + this.cardComp + '>';
      let newelment = this.compile(cstr)(this.scope.$new());

      cardsroot.append(newelment);
    } else {
      console.error('no card component specified');
    }
  }

  Select(item) {
    this.onSelect({
      item: item
    });
  }

  $onInit() {
    this.Compile();
  }
}

app.directive('uiSubformList', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/form/template/subform/subformlist.template.html',
    scope: true,
    controller: ['$scope', '$element', '$compile', UISubformListCtrl],
    controllerAs: '$ctrl',
    bindToController: {
      listitems: '<?', // list of UISubformItem
      header: '<?',
      cardComp: '@?',
      onSelect: '&?'
    }
  };
});