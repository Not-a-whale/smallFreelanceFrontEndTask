class MenuMainNavCtrl {
  constructor() {
    this.expanded = true;
  }

  IsExpanded(){
    return this.expanded;
  }

  IsCollapsed(){
    return !this.expanded;
  }

  Toggle(){
    this.expanded = !this.expanded;
  }

  Collapse(){
    this.expanded = false;
  }

  Expand(){
    this.expanded = true;
  }
}

app.component('menuMainNav', {
  templateUrl: 'modules/ui/menu/main/template.html',
  controller: MenuMainNavCtrl,
  bindings: {
    items: '<?'
  }
})