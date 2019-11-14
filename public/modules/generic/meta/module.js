class MetaGateCtrl {
  constructor(){}
  $onInit(){
    console.log(this.meta);
    if (this.meta == undefined || angular.equals(this.meta, {}) ){
      this.meta = this.imeta;
    }
  }
}