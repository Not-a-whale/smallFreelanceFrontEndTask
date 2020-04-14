class UIFormSectionAgentCtrl {
  constructor() {

  }

  $onInit() {
    if (!Array.isArray(this.data)) {
      this.data = [];
    }
  }
}
app.component('uiFormSectionAgents', {
  templateUrl: 'modules/ui/form/section/agents/template.html',
  controller: UIFormSectionAgentCtrl,
  bindings: {
    data: '=?',
    section: '<?'
  }
});