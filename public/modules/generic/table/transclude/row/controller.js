class UITableRowCtrl {
  constructor() {
    this.selected = false;
  }

  Select(){
    if (this.selected){
      this.selected = false;
    } else {
      if (this.onSelect instanceof Function){

        this.onSelect();
      } else {
        console.error('UITableRow onSelect not bound');
      }
      this.selected = true;
    }
  }
}

app.directive('uiTableRow', function(){
  return {
    restrict: 'E',
    templateUrl: 'modules/generic/table/transclude/row/template.html',
    scope: true,
    controller: UITableRowCtrl,
    controllerAs: '$ctrl',
    bindToController: {
      onSelect: '&?'
    },
    transclude: true
  };
});