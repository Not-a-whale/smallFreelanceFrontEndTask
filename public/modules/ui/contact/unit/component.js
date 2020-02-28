class UIContactUnitCtrl extends UIContactCtrl {
  constructor(getid) {
    super(getid);
  }

  Unit() {
    return '92';
  }

  Truck() {
    return '92';
  }

  Trailer() {
    return '748RT (Dry Van 53\')';
  }

  Driver() {
    return 'bob joe';
  }
  Dispatcher() {
    return 'joe shmoe';
  }
}

app.component('uiContactUnit', {
  templateUrl: 'modules/ui/contact/unit/template.html',
  controller: ['getid', UIContactUnitCtrl],
  bindings: {
    data: '<?'
  }
});