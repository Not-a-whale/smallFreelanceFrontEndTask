class UIFormBlankCtrl {
  constructor() {

  }
  GetId() {
    let obj = {};
    obj[this.idname] = 'new';
    return obj;
  }
}


app.component('uiFormBlank', {
  templateUrl: 'modules/forms/other/blankform.template.html',
  controller: UIFormBlankCtrl,
  controllerAs: '$blankctrl',
  bindings: {
    list: '<?',
    idname: '@'
  }
});