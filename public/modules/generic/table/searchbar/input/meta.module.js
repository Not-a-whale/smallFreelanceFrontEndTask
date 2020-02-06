class MetaTableSearchInputCtrl extends MetaInputCtrl {
  constructor(getid, scope, element, timeout) {
    super(getid);
    this.scope = scope;
    this.element = element;
    this.timeout = timeout;

    this.index = -1; //this must be bound otherwise autofocus will not work
    this.input = element.find('input')[0]; // for autofocus
    this.searchcall = undefined; // for timeout
    this.timeoutdelay = 300;
    this.gate = '';
  }

  Search() {
    let self = this;
    this.timeout.cancel(this.searchcall);
    this.searchcall = this.timeout(
      function () {
        console.log("emit search event");
        self.scope.$emit('TableSearch');
      }, this.timeoutdelay);
  }

  Focus(index) {
    if (this.index == index) {
      this.input.focus();
    }
  }

  $onInit() {
    var self = this;
    this.scope.$on("SearchFocus", function (event, data) {
      self.Focus(data.index);
    });
  }
}

var meta_table_search_input_bindings = CloneObj(meta_bindings);
meta_table_search_input_bindings.index = '<?';

app.controller('MetaTableSearchInputCtrl', ['getid', '$scope', '$element', '$timeout', MetaTableSearchInputCtrl]);
app.component('metaTableSearchInput', {
  templateUrl: 'modules/generic/table/searchbar/input/meta.template.html',
  controller: 'MetaTableSearchInputCtrl',
  bindings: meta_table_search_input_bindings
});