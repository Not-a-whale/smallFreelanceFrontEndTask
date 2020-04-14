class UIPersonnelDetailPanelCtrl {
  constructor(){}
}

app.directive('uiPersonnelDetailPanel', function () {
  return {
    restrict: 'E',
    scope: true,
    transclude: {
      bodyContent: 'bodyContent'
    },
    templateUrl: 'modules/ui/container/personnel/detail/template.html',
    controller: UIPersonnelDetailPanelCtrl,
    bindToController: {
      name: '<?'
    },
    controllerAs: '$ctrl'
  };
});