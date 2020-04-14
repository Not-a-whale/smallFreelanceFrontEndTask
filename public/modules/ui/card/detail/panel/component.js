class UIPanelDetailCtrl {
  constructor() {
    this.title = 'untitled';
  }

  Edit() {
    if (this.onEdit instanceof Function) {
      this.onEdit();
    }
  }
}

app.directive('uiPanelDetail', function () {
  return {
    restrict: 'E',
    scope: true,
    transclude: {
      bodyContent: 'bodyContent'
    },
    templateUrl: 'modules/ui/card/detail/panel/template.html',
    controller: UIPanelDetailCtrl,
    bindToController: {
      title: '<?',
      onEdit: '&?'
    },
    controllerAs: '$ctrl'
  };
});