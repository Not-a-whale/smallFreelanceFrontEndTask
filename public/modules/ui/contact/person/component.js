class UIContactPersonCtrl extends UIContactCtrl {
  constructor(getid) {
    super(getid);
    this.hideName = false; // choose to not display the name, only the icon
    this.person;
    this.associate;
  }

  SetupStructure() {
    let data = this.data;
    if (!Array.isArray(data)) {
      data = [data];
    }
    for (let person of data) {
      if ('ast' in person) {
        this.associate = person;
        this.person = person.ast;
      } else if ('hr_associate' in person) {
        this.person = person;
        this.associate = person.hr_associate;
      }
      if (this.associate != undefined) {
        if (this.associate.PrimaryContact == 1) {
          break;
        }
      }
    }
  }

  ValidData() {
    let valid = false;
    if (this.data != undefined && !angular.equals(this.data, {})) {
      valid = this.person != undefined;
    }
    return valid;
  }

  Id() {
    return this.person.PrsnId;
  }

  ProfileLink() {
    if (this.person != undefined) {
      return "tmsapp.main2.form.generic({id: " + this.Id() + ", formName: 'new contact', subformName: 'new contact'})";
    } else {
      return "#";
    }
  }

  HasImage() {
    return this.image != undefined;
  }

  Image() {
    return this.image;
  }



  DisplayName() {
    return !this.hideName;
  }

  Name() {
    let value = 'no name provided';
    if (this.person != undefined) {
      if ('FirstName' in this.person && 'LastName' in this.person) {
        value = this.person.FirstName + ' ' + this.person.LastName;
      }
    }
    return value;
  }

  Role() {
    let value = undefined;
    if (this.associate != undefined) {
      if ('CurrentTitle' in this.associate) {
        value = this.associate.CurrentTitle;
      }
    }

    return value;
  }

  Address() {
    let value = undefined;
    if (this.person != undefined) {
      if ('brnch' in this.person) {
        value = this.person.brnch.brnch_address;
      }
    }
    return value;
  }

  Group() {
    let value = undefined;
    if (this.person != undefined) {
      if ('brnch' in this.person) {
        value = this.person.brnch.OfficeName;
      }
    }
    return value;
  }

  Phone() {
    let value = undefined;
    if (this.associate != undefined) {
      if ('biz_phone' in this.associate) {
        value = this.associate.biz_phone;
      }
    }

    return value;
  }


  Email() {
    let value = undefined;
    if (this.associate != undefined) {
      if (this.associate.BizEmail != undefined && this.associate.BizEmail != ' ') {
        value = this.associate.BizEmail;
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