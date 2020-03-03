class UIStatusHoldsSymbolCtrl {
  constructor() {
    this.count = 0;
  }

  HasHolds() {
    return this.count > 0;
  }
}

app.component('uiStatusHoldsSymbol', {
  templateUrl: 'modules/ui/text/status/holds/symbol/template.html',
  controller: UIStatusHoldsSymbolCtrl,
  bindings: {
    count: '<?'
  }
});