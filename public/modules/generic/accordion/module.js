class AccordionItemCtrl {
  constructor($scope, $element, getid) {
    this.id = getid();
    this.$scope = $scope;
    this.$element = $element;
  }

  Collapse() {
    this.$element.addClass('collapsed');
  }

  Expand() {
    this.$element.removeClass('collapsed');
  }

  $onInit() {
    var self = this;
    this.Collapse();
    this.$scope.$on("Collapse", function () {
      self.Collapse();
    });
    this.$scope.$on("Expand", function () {
      self.Expand();
    });
  }
}

class AccordionCtrl {
  constructor($rootScope, $scope, getid) {
    this.id = getid();
    this.$scope = $scope;
    this.expanded = false;
    this.$rootScope = $rootScope;
    this.active = undefined;
    this.group = undefined; // should be assigned in html
  }

  Toggle() {
    if (this.expanded) {
      this.Collapse();
    } else {
      this.Expand();
    }
  }

  Collapse() {
    this.expanded = false;
    this.active = undefined;
    this.$scope.$broadcast("Collapse");
  }
  Expand() {
    this.expanded = true;
    this.active = '1';
    this.$rootScope.$broadcast("CollapseEveryone", {
      group: this.group,
      id: this.id
    });
    this.$scope.$broadcast("Expand");
  }

  $onInit() {
    var self = this;
    this.active = undefined;
    this.$scope.$on("CollapseEveryone", function (event, args) {
      if (args.group == self.group && self.id != args.id) {
        self.Collapse();
      }
    });
  }
}

app.controller("accordion", ['$rootScope', '$scope', 'getid', AccordionCtrl]);
app.controller("accordionItem", ['$scope', '$element', 'getid', AccordionItemCtrl]);