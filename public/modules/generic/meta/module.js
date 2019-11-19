class MetaGateCtrl {
  constructor(){}
  $onInit(){
    if (this.meta == undefined || angular.equals(this.meta, {}) ){
      this.meta = this.imeta;
    }
  }
}