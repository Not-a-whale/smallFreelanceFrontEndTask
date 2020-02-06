class UIListDetailCtrl {
  constructor(){
    this.name = 'entity / firstname lastname';
    this.role = 'entity role';
    this.startDate = '00/00/00';
    this.endDate = '99/99/99';
    this.contact = 'sms';
    this.phone = undefined;
  }

  CanText(){
    return this.message != undefined;
  }

  CanEmail(){
    return this.email != undefined;
  }

  CanCall(){
    return this.phone != undefined;
  }

  StartDate(){
    /* will be used to clean the date out if needed */
    return this.startDate;
  }

  EndDate(){
    /* will be used to clean the date out if needed */
    return this.endDate;
  }
}

app.directive('uiListDetail', function(){
  return {
    restrict: 'E',
    scope: true,
    transclude: {
      body: 'detailBody'
    },
    templateUrl: 'modules/ui/container/listdetail/template.html',
    controller: UIListDetailCtrl,
    bindToController: {
      name: '<?',
      role: '<?',
      startDate: '<?',
      endDate: '<?',
      contact: '<', // person to contact
      phone: '<', // contact by phone
      email: '<', // contact by email
      message: '<', // who to message
    },
    controllerAs: '$ctrl'
  };
});