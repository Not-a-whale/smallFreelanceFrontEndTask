class UIMegaFormCtrl {
  constructor(APIService) {
    this.api = APIService;
  }
}

app.component('uiMegaForm', {
  templateUrl: 'modules/forms/mega/megaform.template.html',
  controller: UIMegaFormCtrl,
  controllerAs: '$megactrl',
  bindings: {
    formList: '<',
    formListEndpoint: '<',
    formListParams: '<'
  }
});