/*
  directive restricted to attributes to expand and collapse
  will add in automatic class bindings later.
*/

class ExpandableCtrl {
  constructor(){
    this.expanded = false;
  }

  IsOpen(){
    return this.expanded == true;
  }

  Expand(){
    this.expanded = true;
  }

  Collapse(){
    this.expanded = false;
  }

  Toggle(){
    this.expanded = !this.expanded;
  }

  Set(boolean){
    this.expanded = boolean;
  }

  $onInit(){
    if (this.open){
      this.Expand();
    }
  }
}

app.directive('uiExpand', function(){
  return {
    restrict: 'A',
    controllerAs: 'expCtrl',
    bindToController: {
      open: '<?'
    },
    controller: ExpandableCtrl
  };
});