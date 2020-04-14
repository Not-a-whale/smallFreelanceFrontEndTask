class UISubformCardCoreCtrl {
  constructor() {}
  Select() {
    this.onSelect({
      item: this.item
    });
  }
}

app.controller('UISubformCardCore', UISubformCardCoreCtrl);

app.component('uiListCard', {
  templateUrl: function ($element, $attrs) {
    let template = 'modules/ui/form/template/';
      if ('type' in $attrs) {

      }
    return template;
  },
})