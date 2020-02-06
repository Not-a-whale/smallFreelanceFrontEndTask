
class AccordionCardsCtrl {
  constructor() {
    // composition instead of inheritance because JS doesnt have multiple inheritance
    // and adding multiple inheritance is too much of a hassle.
    // reasoning to use multiple inheritance is because of MetaGateCtrl, but MetaGateCtrl is not necessary for this component.
    // normal bindings will be used, this is because the source of the information is unknown inside of a gate and meta object
    // using normal bindings also gives more freedom to design the component.
    // flexibility over rigidity is prefered
    this.exp = new ExpandableCtrl();
  }
  $onInit(){
    if (this.open != undefined){
      this.exp.Expand();
    }
  }
}

app.component('accordionCards', {
  templateUrl: 'modules/generic/accordion_cards/meta.template.html',
  controller: AccordionCardsCtrl,
  bindings: {
    showcount: '<?', // if you want to display the number of items inside of the accordion card
    headers: '<?', // the headers to display inside of the accordion cards
    items: '<?', // the items to display inside of the cards
    viewname: '<?', // string, name of view to put the cards into
    title: '<?', // string, title of the accordion card holder
    open: '<?'
  }
});