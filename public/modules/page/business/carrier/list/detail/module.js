class CarrierDetailCtrl {
  constructor(){

  }

  HasDetail(){
    return !(angular.equals(this.detail, {}));
  }
}

app.component('carrierDetail',{
  templateUrl: 'modules/pages/business/carrier/list/detail/template.html',
  controller: CarrierDetailCtrl,
  bindings: {
    detail: '<?'
  }
});