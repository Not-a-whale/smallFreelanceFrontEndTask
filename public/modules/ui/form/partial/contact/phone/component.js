app.component('uiFormPartialPhone', {
  templateUrl: 'modules/ui/form/partial/contact/phone/template.html',
  bindings: {
    data: '=?',
    type: '@?',
    ext: '<?',
    required: '<?'
  }
});