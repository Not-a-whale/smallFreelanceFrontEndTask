class UIAvatarCtrl {
  constructor() {
    this.image = undefined;
    this.display = '><';
  }

  DisplayInitials(){
    let retval = this.display;
    if (this.initials == undefined){
      if (this.name != undefined){
        if (typeof this.name == 'string'){
          revtal = this.name.substr(0,2);
        } else if (typeof this.name == 'object'){
          retval = this.name.FirstName.substr(0,1) + this.name.LastName.substr(0,1);

        }
      }
    } else {
      retval = this.initials.substr(0,2);
    }

    return retval.toUpperCase();
  }

  HasImage(){
    return this.image != undefined;
  }

  ImageSrc(){
    return this.image;
  }
}

app.component('uiAvatar', {
  templateUrl: 'modules/ui/doodads/avatar/template.html',
  controller: UIAvatarCtrl,
  bindings: {
    image: '<?',
    initials: '<?',
    name: '<?'
  }
});