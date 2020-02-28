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

  Name() {
    let value = 'no name provided';
    if ('Person' in this.data) {
      if ('FirstName' in this.data.Person && 'LastName' in this.data.Person) {
        value = this.data.Person.FirstName + ' ' + this.data.Person.LastName;
      }

    }
    return value;
  }

  Address() {
    let value = undefined;
    if ('Address' in this.data) {
      value = this.data.Address;
    }
    return value;
  }

  ValidData() {
    let valid = false;
    if (this.data != undefined && !angular.equals(this.data, {})) {
      if ('Person' in this.data) {
        valid = true;
      }
    }
    return valid;
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