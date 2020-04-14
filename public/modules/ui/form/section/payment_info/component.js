app.component('uiFormSectionPaymentInfo', {
  templateUrl: 'modules/ui/form/section/payment_info/template.html',
  bindings: {
    dataArray: '=?', // must be an array
    data: '=?',
    section: '<?'
  }
});