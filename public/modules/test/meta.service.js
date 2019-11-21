class MetaComponentService extends GenericService {
  constructor(http, location, state, timeout, q) {
    super(http);
    this.http = http;
    this.location = location;
    this.state = state;
    this.timeout = timeout;
    this.q = q;
    this.timeoutcall = undefined;
    this.selecteditem = undefined;
    this.components = undefined;
  }

  GetComponents() {
    let self = this;
    if (this.components == undefined) {
      return this.http.get("components.json").then(function (res) {
        self.components = res.data;
        return res.data;
      }, function (res) {
        alert("Failed to pull list of components from server.");
      });
    } else {
      return this.components;
    }
  }

  FindItem(name) {
    for (let i of this.components) {
      if (i.component == name) {
        this.SelectItem(i);
        console.log("Found component! " + i.component);
      } else {
        i.selected = false;
      }
    }
  }

  SelectedItemIs(component) {
    if (this.SelectedItemExists()) {
      return this.SelectedItem().component === component;
    }
    return false;
  }

  SelectedItemExists() {
    return this.selecteditem != undefined;
  }

  SelectedItem() {
    if (this.selecteditem == undefined) {
      for (let i of this.components) {
        if (i.selected) {
          this.SelectItem(i);
        }
      }
    }
    return this.selecteditem;
  }

  SelectItem(item) {
    for (let i of this.components) {
      i.selected = false;
    }
    item.selected = true;
    this.selecteditem = item;
  }

  Transition() {
    let params = {
      component: this.SelectedItem().component || "none"
    };
    let state = this.SelectedItem().state;
    let component = this.SelectedItem().component;

    // some components have a higher structure with views
    // go to that state that knows how to fill in the views
    if (state !== undefined) {

      this.state.go(state, params);
    } else {
      state = "tms.test.component"; // default state to go to
      this.state.go(state, params);

    }
  }

  GetData(component) {
    if (!this.SelectedItemIs(component)) {
      this.FindItem(component);
    }
    if (this.SelectedItemExists()) {
      let item = this.SelectedItem();
      if (item.dataurl !== undefined) {
        return this.http.post(item.dataurl, "").then(function(res){
          return res.data.DATA;
        }, function(res) {
          return item.dataurl;
        });
      }
      console.log("no dataurl provided inside of json");
      return {};
    }

    return undefined;

  }

  GetMeta(component) {
    if (!this.SelectedItemIs(component)) {
      this.FindItem(component);
    }
    if (this.SelectedItemExists()) {
      let item = this.SelectedItem();
      if (item.meta !== undefined) {
        return this.http.get(item.meta).then(function (res) {
          return res.data.META;
        }, function (res) {
          return item.meta;
        });
      }
      console.log("no meta provided inside of json");
      return {};
    }

    return undefined;
  }

}

app.service('MetaComponentService', ['$http', '$location', '$state', '$timeout', '$q', MetaComponentService]);