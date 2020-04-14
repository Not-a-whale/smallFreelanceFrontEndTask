class UISubformCoreCtrl {
  constructor(scope, element, compile, apisrv) {


    this.scope = scope;
    this.element = element;
    this.compile = compile;

    this.listitems = [];
    this.currentitem = new UISubformItem();
  }

  SetCurrentItem(item) {
    if (item instanceof UISubformItem) {
      for (let i of this.listitems) {
        i.Deactivate();
      }
      this.currentitem = item;
      this.currentitem.Activate();
    }
  }

  ResetCurrentItem() {
    this.currentitem = new UISubformItem();
  }

  AddNewItem() {
    if (this.currentitem.data != undefined) {
      this.currentitem.Deactivate();
      this.listitems.push(this.currentitem);
      this.data.push(this.currentitem.data);
      this.ResetCurrentItem();
    }
  }

  UpdateCurrentItem() {
    this.currentitem.Deactivate();
    this.ResetCurrentItem();
  }

  DeleteCurrentItem() {
    console.log('Delete is not yet implemented! Requires some interesting mechanics with backend due to current design');
  }

  Compile() {
    let cstr, newelement, container;
    if (this.formComp != undefined && this.listComp != undefined) {
      container = this.element.find('form-container');
      cstr = '<' + this.formComp + ' data="$ctrl.currentitem.data" ></' + this.formComp + '>';
      newelement = this.compile(cstr)(this.scope.$new());
      container.append(newelement);

      container = this.element.find('list-container');
      cstr = '<' + this.listComp + ' listitems="$ctrl.listitems" on-select="$ctrl.SetCurrentItem(item)"></' + this.listComp + '>';
      newelement = this.compile(cstr)(this.scope.$new());
      container.append(newelement);
    }
  }

  $onChanges(changes) {
    if ('data' in changes) {
      this.BuildListItems();
    }
  }

  BuildListItems() {
    this.listitems = [];
    if (Array.isArray(this.data)) {
      for (let d of this.data) {
        this.listitems.push(new UISubformItem(d));
      }
    }
  }

  $onInit() {
    this.Compile();
  }
}

app.directive('uiSubform', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/form/template/subform/subform.template.html',
    scope: true,
    controller: ['$scope', '$element', '$compile', 'APIService', UISubformCoreCtrl],
    controllerAs: '$ctrl',
    bindToController: {
      data: '<?', //this should be a list of items
      listComp: '@?',
      formComp: '@?',
      onAdd: '&?',
      onUpdate: '&?',
      onDelete: '&?',
    }
  };
});