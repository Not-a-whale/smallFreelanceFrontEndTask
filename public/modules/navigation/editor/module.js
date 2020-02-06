class NavFormCtrl extends GenericFormCtrl {
  constructor(getid, scope, menuservice) {
    super(getid, scope);
    this.menuservice = menuservice;
    this.iconList = [];
  }

  SetIcon(icon) {
    this.item.Icon = icon;
  }
}

let navform_bindings = JSON.parse(JSON.stringify(form_bindings));
navform_bindings.iconList = '<?';

/* For now top level module will only be a controller*/
app.component("navEditor", {
  templateUrl: "modules/navigation/editor/default.html",
  bindings: {
    navlist: '<',
  }
});

app.component("navForm", {
  controller: ['getid', '$scope', 'MenuService', NavFormCtrl],
  templateUrl: "modules/navigation/editor/form.html",
  bindings: navform_bindings
});

app.component("navFormNew", {
  controller: ['getid', '$scope', 'MenuService', 'SymbolService', NavFormCtrl],
  templateUrl: "modules/navigation/editor/new.html",
  bindings: navform_bindings
});

app.component("navHierarchy", {
  templateUrl: "modules/navigation/editor/hierarchy.html",
  bindings: {
    tree: '<'
  }
});