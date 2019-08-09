class GenericInputCtrl {
  constructor(getid) {
    this.id = getid();
  }
};

app.component('genericInput', {
  templateUrl: '/modules/generic/input/default.html',
  controller: ['getid', GenericInputCtrl],
  bindings: input_bindings
});