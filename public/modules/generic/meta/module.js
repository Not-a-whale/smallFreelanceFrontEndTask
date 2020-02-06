class MetaGateCtrl {
  constructor(){
    // make sure you have imeta object defined inside of constructor
  }
  $onInit(){
    if (this.meta == undefined || angular.equals(this.meta, {}) ){
      this.meta = this.imeta;
    }
  }
}