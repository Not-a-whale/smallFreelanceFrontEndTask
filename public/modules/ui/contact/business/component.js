class UIContactBusinessCtrl extends UIContactCtrl {
  static business_types = [{
      type: 'ent_shipper',
      name: 'shipper'
    },
    {
      type: 'ent_customer',
      name: 'customer'
    },
    {
      type: 'ent_carrier',
      name: 'carrier'
    }
  ];
  constructor(getid) {
    super(getid);
    this.icon = true;
    this.business = undefined;
    this.branch = undefined;
  }

  SetupStructure() {
    let data = this.data;
    if (!Array.isArray(data)) {
      data = [data];
    }

    for (let branch of data) {
      if ('biz_branches' in branch) {
        // is a business with branches... pick first one
        this.branch = branch.biz_branches[0];
        this.business = branch;
      } else if ('biz' in branch) {
        this.branch = branch;
        this.business = branch.biz;
      }
    }
  }
  ValidData() {
    let valid = false;
    if (this.data != undefined && !angular.equals(this.data, {})) {
      valid = this.branch != undefined;
    }
    return valid;
  }

  BranchId() {
    return this.branch.BrnchId;
  }
  Id() {
    return this.business.BizId;
  }


  ProfileLink() {
    let profilelink = '#';
    if (this.branch != undefined) {
      profilelink = 'tmsapp.main2.logistics.directory.business.detail.overview({businesstype: "' + this.BusinessType() + '", businessId: ' + this.Id() + '})';
    }
    return profilelink;
  }


  DisplayName() {
    let value = 'no name provided';
    if (this.business != undefined) {
      value = this.business.BizName;
    }
    return value;
  }

  Address() {
    let value = undefined;
    if (this.branch != undefined) {
      value = this.branch.brnch_address;
    }
    return value;
  }

  Phone() {
    let value = undefined;
    if (this.branch != undefined) {
      value = this.branch.brnch_phone;
    }
    return value;
  }

  Email() {
    let value = undefined;
    if (this.branch != undefined) {
      value = this.branch.BrnchEMail;
    }
    return value;

  }

  BusinessType() {
    let value = 'unknown';
    if (this.business != undefined) {
      value = 'carrier';
      if ('has_carrier' in this.business) {
        if (this.business.has_carrier != undefined) {
          value = 'carrier';
        }
      } else {

        for (let b of UIContactBusinessCtrl.business_types) {
          if (b.type in this.business) {
            if (this.business[b.type] != undefined && this.business[b.type].length > 0) {
              value = b.name;
              break;
            }
          }
        }
      }
    }
    return value;
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