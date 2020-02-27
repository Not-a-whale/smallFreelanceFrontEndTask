class TempController {
  constructor() {
    this.status = [{h:1},{a:2},{b:3},{z:6}];
    this.holds = [{},{},{},{},{},{},{}];
    this.vehicles = [{},{},{},{},{},{},{},{}];
    this.drivers = [{},{},{},{},{},{},{},{},{}];
  }
}

let meta_bindings_deets = CloneObj(meta_bindings);
meta_bindings_deets.detail = '<?';

app.component('operatorDetail',{
  templateUrl: 'modules/pages/personnel/operators/list/detail/template.html',
  controller: TempController,
  bindings: meta_bindings_deets
});