class UIButtonMoreOptions {
  constructor(getid) {
    this.id = getid();
    this.icon = "imgs/icons.svg#bell";
    this.menuvisible = false;
  }

  MenuVisible() {
    return this.menuvisible;
  }

  Open() {
    this.menuvisible = true;
  }

  Close() {
    this.menuvisible = false;
  }
}

app.directive('uiButtonMoreOptions', function () {
  return {
    restrict: 'E',
    scope: true,
    templateUrl: 'modules/ui/button/moreoptions/template.html',
    controller: ['getid', UIButtonMoreOptions],
    controllerAs: '$ctrl',

    transclude: {
      menuItems: '?menuItems'
    }

  };
});