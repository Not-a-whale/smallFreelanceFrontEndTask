class UIContactBusinessCtrl extends UIContactCtrl {
  constructor(getid) {
    super(getid);
    this.icon = true;
  }

  DisplayName() {
    return this.data.biz.BizName;
  }

  Address() {
    return this.data.brnch_address;
  }

  Phone() {
    return this.data.brnch_phone;
  }

  Email() {
    return this.data.BrnchEMail;
  }

  BusinessType() {
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