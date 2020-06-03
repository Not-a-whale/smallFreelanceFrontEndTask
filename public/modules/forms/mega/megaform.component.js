class UIMegaFormCtrl {
  constructor(APIService, $scope, getid) {
    this.api = APIService;
    this.sections = [];
    this.listid = getid();
    this.scope = $scope;
  }

  ReloadList() {
    this.scope.$broadcast('ui-list-reload', {
      id: this.listid
    });
  }



  Register(ctrl) {
    this.sections.push(ctrl);
  }

  Deregister(ctrl) {
    let index = this.sections.indexOf(ctrl);
    if (index > -1) {
      this.sections.splice(index, 1);
    }
  }

  /**
   *
   * @param {Object} depobj
   * configuration object for dependencies
   * {
   *  section: string or array of strings
   *  fields: array of object {from: string, to: string, type: const or data}
   *  operator: or / and
   * }
   */
  GetDependency(depobj) {
    let depname = depobj.section;
    let dep = undefined;
    if (typeof depname === 'string') {
      depname = [depname];
    }
    if (Array.isArray(depname)) {
      for (let name of depname) {
        // find first valid dependency and return the controller
        dep = this.sections.find(x => x.type == name);
        if (dep != undefined) {
          break;
        }
      }

    }
    return dep;
  }
}

app.component('uiMegaForm', {
  templateUrl: 'modules/forms/mega/megaform.template.html',
  controller: UIMegaFormCtrl,
  controllerAs: '$megaform'
});