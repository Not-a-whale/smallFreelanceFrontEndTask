class UICardDetailSmallCtrl {
  constructor() {
  }

  HasGroup() {
    return this.group != undefined && this.group != '';
  }
  HasAddress() {
    return this.address != undefined && !angular.equals(this.address, {});
  }
  CanChat(){
    return this.chatLink != undefined && !angular.equals(this.chatLink, {});
  }
}

app.component('uiCardDetailSmall', {
  templateUrl: 'modules/ui/card/detail/small/template.html',
  controller: UICardDetailSmallCtrl,
  bindings: {
    name: '<?',
    role: '<?',
    group: '<?',
    phone: '<?',
    email: '<?', //
    address: '<?',
    profileLink: '<?', // url to profile
    chatLink: '<?' // idk what this would be yet
  }
});