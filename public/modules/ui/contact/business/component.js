class UIContactBusinessCtrl {
  constructor(getid) {
    this.id = getid();
    this.expanded = false;
    this.icon = true;
  }

  Toggle() {
    this.expanded = !this.expanded;
  }

  DisplayName() {
    return this.data.biz.BizName;
  }

  ShowDetail() {
    return this.expanded;
  }

  ShowIcon() {
    return this.icon;
  }

  Close() {
    this.expanded = false;
  }

  Address() {
    return this.data.brnch_address;
  }

  Phone() {
    return this.data.brnch_phone;
  }
  Email(){
    return this.data.BrnchEMail;
  }
  BusinessType(){
    return 'business'
  }

}

app.component('uiContactBusiness', {
  templateUrl: 'modules/ui/contact/business/template.html',
  controller: ['getid', UIContactBusinessCtrl],
  bindings: {
    data: '<?',
    icon: '<?'
  }
});