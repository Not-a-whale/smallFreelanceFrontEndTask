class PageSafetyPersonnelDetailCtrl {
  constructor(){}
}

app.component('pageSafetyPersonnelDetail',{
  templateUrl: 'modules/page/safety/personnel/detail/template.html',
  controller: PageSafetyPersonnelDetailCtrl,
  bindings: {
    detail: '<?'
  }
});