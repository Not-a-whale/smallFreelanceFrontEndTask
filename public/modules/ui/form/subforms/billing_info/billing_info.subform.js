class UISubformListBillingInfoCtrl {
  constructor() {
    this.header = [{
        size: 'c4',
        name: 'tag'
      },
      {
        size: 'c4',
        name: 'Pay to the order of'
      },
      {
        size: 'c4',
        name: 'credit limit'
      },
      {
        size: 'c4',
        name: 'credit hold'
      }
    ];
  }
}

app.component('uiSubformListBillingInfo', {
  templateUrl: 'modules/ui/form/subforms/billing_info/subformlist.template.html',
  controller: UISubformListBillingInfoCtrl,
  bindings: {
    listitems: '<?',
    onSelect: '&?'
  }
});

app.component('uiSubformBillingInfo', {
  templateUrl: 'modules/ui/form/subforms/billing_info/subform.template.html',
  bindings: {
    data: '<?'
  }
});

app.component('uiSubformCardBillingInfo', {
  templateUrl: 'modules/ui/form/subforms/billing_info/card.template.html',
  bindings: {
    item: '<?'
  }
});