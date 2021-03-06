class MenuService extends GenericService {
  constructor(http) {
    super(http);
    this.url = "api/navigation"
    this.menulist = [];
    this.activestate = undefined;
  }

  SearchActiveState(statename) {
    this.activestate = undefined;
    this._search(statename, this.menulist, 0, 0);
    return this.activestate;
  }

  _search(statename, list, depth, longest) {
    const FOUND = 1;
    const FIND_PARENT = 2;
    const KEEP_SEARCHING = 0;
    let found;
    for (let key in list) {
      let item = list[key];
      if (statename.includes(item.Route)) {

        if (item.Route == statename) {
          if (item.Target == "mainnav") {
            this.activestate = item;
            return FOUND;
          }
          return FIND_PARENT;
        }
        if (longest < item.Route.length) {
          longest = item.Route.length;
          this.activestate = item;
        }
        if ("app_menu_items" in item) {
          found = this._search(statename, item.app_menu_items, depth + 1, longest);
          switch (found) {
            case FOUND:
              return FOUND;
            case FIND_PARENT:
              if (item.Target == "mainnav" && depth == 1 || depth == 2) {
                this.activestate = item;
                return FOUND;
              }
              return FIND_PARENT;
          }
        } else {
          // the state might not be part of the database
          // this is the edgecase that makes it search
          // for the parent of the non-existent menu item
          if (this.activestate != undefined) {
            return FIND_PARENT;
          }
        }
      }
    }
    return KEEP_SEARCHING;
  }

  _find_item(list, id) {
    if (list != undefined) {
      for (let i of list) {
        if (i.MenuItemId == id) {
          return i;
        } else {
          if ('app_menu_items' in i) {
            let fitem = this._find_item(i.app_menu_items, id);
            if (fitem) {
              return fitem;
            }
          }
        }
      }
    }
    return undefined;

  }

  Single(id) {
    if (this.menulist.length > 0) {
      return this._find_item(this.menulist, id);
    } else {
      let url = this.url + "/menu_item";
      let query = {
        'id': id
      };
      let success = function (res) {
        return res.data.DATA.item;
      }
      return this.Request('get', url, undefined, query, success, this.Failure);
    }

  }

  Item(id) {
    if (this.menulist.length == 0) {
      return null;
    } else {
      console.error("TODO: implement MenuService.Item()");
      return null;
    }
  }

  List() {
    if (this.menulist.length == 0) {
      return this.Tree();
    } else {
      return this.menulist;
    }
  }

  Tree() {
    let url = this.url + "/menu_item/all";
    // ADD Request for specific user!!
    let self = this;
    let success = function (res) {
      self.menulist = res.data.DATA.list;
      return self.menulist;
    }
    let failure = function (res) {};
    return this.Request('get', url, undefined, undefined, success, failure);
  }

  Submit(object) {
    let url = this.url + "/menu_item/submit";
    return this._request(object, url);
  }

  Create(object) {
    let url = this.url + "/menu_item/create";
    return this._request(object, url);
  }

  Update(object) {
    let url = this.url + "/menu_item/update";
    return this._request(object, url);
  }

  Delete(object) {
    let url = this.url + "/menu_item/delete";
    return this._request(object, url);
  }

  _request(object, url) {
    let success = function (res) {
      alert(res.statusText);
    };
    let failure = function (res) {
      alert(res.statusText);
    }
    return this.Request('post', url, object, undefined, success, failure);
  }

}

app.service("MenuService", ["$http", MenuService]);

class PageServiceOld {
  constructor(http) {
    this.http = http;
    this.pages = undefined;
    this.activepage = undefined;
  }

  SetPage(pagename) {
    if (this.pages == undefined) {
      this.GetPages();
    }
    if (pagename in this.pages) {
      this.activepage = this.pages[pagename];
    } else {
      console.error('Requested page ' + pagename + ' not found.');
    }
  }

  Navs() {
    let retval = undefined;
    if (this.activepage !== undefined) {
      retval = this.activepage.navs;
    }
    return retval;
  }

  Title() {
    let retval = undefined;
    if (this.activepage !== undefined) {
      retval = this.activepage.label;
    }
    return retval;
  }

  GetPages() {
    let self = this;
    return this.http.get('pages.json').then(function (res) {
      self.pages = res.data;
      //console.log(self.pages);
      return res.data;
    });
  }
}

app.service('PageServiceOld', ['$http', PageServiceOld]);
class MainNavService {
  constructor(http) {
    this.http = http;
    this.menu = undefined; // stores the current menu that a user can use to navigate with
  }

  GetMainNavMenu() {
    if (this.menu == undefined) {
      var self = this;
      return this.http.get('navmenu.json').then(function (res) {
        self.menu = res.data;
        return self.menu;
        //console.log(res.data);
      }, function (res) {
        console.error('didnt fetch navigation menu');
      });
    } else {
      return this.menu;
    }
  }

  PostToDB() {
    // this is to push data to the database
  }

  GetFromDB() {
    // this is to get the data from the database
  }

  RemapFromDB() {
    // maps data from the database to frontend
  }

  RemapToDB() {
    //maps data structure from frontend to push to the database
  }
}


app.service('MainNavService', ['$http', MainNavService]);