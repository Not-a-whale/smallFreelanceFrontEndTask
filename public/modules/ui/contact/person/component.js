class UIContactPersonCtrl extends UIContactCtrl {
  constructor(getid) {
    super(getid);
    this.hideName = false; // choose to not display the name, only the icon
  }

  HasImage() {
    return this.image != undefined;
  }

  Image() {
    return this.image;
  }

  ValidData() {
    let valid = false;
    if (this.data != undefined && !angular.equals(this.data, {})) {
      if ('ast' in this.data) {
        valid = true;
      }
    }
    return valid;
  }

  DisplayName() {
    return !this.hideName;
  }

  Name() {
    let value = 'no name provided';
    if ('ast' in this.data) {
      if ('FirstName' in this.data.ast && 'LastName' in this.data.ast) {
        value = this.data.ast.FirstName + ' ' + this.data.ast.LastName;
      }
    }
    return value;
  }

  Role() {
    let value = undefined;
    if ('CurrentTitle' in this.data) {
      value = this.data.CurrentTitle;
    }
    return value;
  }

  Address() {
    let value = undefined;
    if ('ast' in this.data) {
      value = this.data.ast.brnch.brnch_address;
    }
    return value;
  }

  Group() {
    let value = undefined;
    if ('ast' in this.data) {
      value = this.data.ast.brnch.OfficeName;
    }
    return value;
  }

  Phone() {
    let value = undefined;
    if ('biz_phone' in this.data) {
      value = this.data.biz_phone;
    }
    return value;
  }


  Email() {
    let value = undefined;
    if ('BizEmail' in this.data) {
      if (this.data.BizEmail != undefined && this.data.BizEmail != ' ') {
        value = this.data.BizEmail;
      }

    }
    return value;
  }

}

app.component('uiContactPerson', {
  templateUrl: 'modules/ui/contact/person/template.html',
  controller: ['getid', UIContactPersonCtrl],
  bindings: {
    data: '<?',
    image: '<?',
    hideName: '<?'
  }
});