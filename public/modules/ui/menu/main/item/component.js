class MainNavMenuItemCtrl {
  constructor() {
    this.expanded = false;
    this.children = undefined;
  }

  IsExpanded() {
    return this.expanded;
  }

  IsCollapsed() {
    return !this.expanded;
  }

  Toggle() {
    this.expanded = !this.expanded;
  }

  Collapse() {
    this.expanded = false;
  }

  Expand() {
    this.expanded = true;
  }

  CanExpand() {
    return this.children != undefined && this.children.length > 0;
  }
}

app.component('mainNavMenuItem', {
  templateUrl: 'modules/ui/menu/main/item/template.html',
  controller: MainNavMenuItemCtrl,
  bindings: {
    label: '<?',
    icon: '<?',
    goto: '<?',
    state: '<?',
    children: '<?'
  }
})