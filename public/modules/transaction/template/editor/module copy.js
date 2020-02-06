class ChargeTemplateEditorCtrl extends GenericEditorCtrl {
  constructor(getid, scope, http) {
    super(getid, scope, http);
    this.fetchUrl = "/api/transactiontemplate/list";
    this.createUrl = "/api/transactiontemplate/create";
    this.updateUrl = "/api/transactiontemplate/create";
  }

  BuildObject() {
    if (this.edit == undefined){
      return this.edit;
    }
    let item = this.edit;

    let stack = [];

    for (let i in item.children){
      stack.push(item.children[i]);
    }

    while (stack.length > 0) {
      let child = stack.shift();
      child.TemplateTypeId = item.templateType;
      if ('entity' in child){
        if (child.entity != null && 'Name' in child.entity){
          delete child.entity.Name;
        }
        child.EntityId = child.entity;
        delete child.entity;
      }
      if ('debit_account' in child){
        child.DebitAccountId = child.debit_account;
        delete child.debit_account;
      }
      if ('credit_account' in child){
        child.CreditAccountId = child.credit_account;
        delete child.credit_account;
      }
      if (child.ParentId != undefined) {
        stack.push(child.ParentId);
      }
      if ('children' in child) {
        delete child.children;
      }
      if ('ident' in child){
        delete child.ident;
      }
    }

    return item;
  }
}

class ChargeTemplateListCtrl {
  constructor(getid) {
    this.id = getid();
    this.list = [];
  }

  SelectItem(item) {
    this.selectItem({
      item: item
    });
  }
}

class ChargeTemplateFormCtrl extends GenericFormCtrl {
  constructor(getid, scope, http, transition) {
    super(getid, scope);
    this.http = http;
    this.childrenUrl = "/api/transactiontemplate/children";
    this.state = "tmsapp.main.fin.chargeitems.edit";
    this.children = [];
    this.headers = ["IDs", "Name", "Description", "Entity", "Credit Account", "Debit Account", "Price", "Price Type"];

    this.entities = [];
    this.accounts = [];
    this.getid = getid;
    this.templateName = undefined;
    this.templateType = undefined;
    this.transactionType = undefined;
    this.prevstate = undefined;
  }

  $onChanges(changes) {
    // super.$onChanges(changes);
    if ('item' in changes) {
      if (this.item != undefined) {
        var self = this;
        var data = {
          POST: this.item
        };
        this.http.post(this.childrenUrl, data).then(
          function (res) {
            self.children = res.data.DATA.children;
          },
          function (res) {

          });
      }

    }
  }

  $onInit() {
    super.$onInit();

    let self = this;

    this.http.get("/api/transactiontemplate/entitylist").then(function (res) {
      self.entities = res.data.DATA.entities;
    }, function (res) {});

    this.http.get("/api/transactiontemplate/accountlist").then(function (res) {
      self.accounts = res.data.DATA.list;
    }, function (res) {});

    this.http.get("/api/transactiontemplate/transtypelist").then(function (res) {
      self.transtypes = res.data.DATA.list;
    }, function (res) {});

    this.http.get("/api/transactiontemplate/templatetypelist").then(function (res) {
      self.templatetypes = res.data.DATA.list;
    }, function (res) {});
  }

  UpdateAttr(attr, value) {
    this[attr] = value;
  }

  UpdateField(field, value, item) {
    let index = this.children.indexOf(item);
    if (index > -1) {
      this.children[index][field] = value;
    }
  }

  Update() {
    this.scope.$broadcast("Update");
    if (this.onUpdate instanceof Function) {
      let item = {
        templateType: this.templateType,
        templateName: this.templateName,
        transactionType: this.transactionType,
        children: this.children
      };
      this.onUpdate({
        item: item
      });
    }
  }

  NewChild() {
    return {
      'ident': this.getid(),
      'children': [],
      'ParentId': undefined
    };
  }

  NewEntry() {
    this.children.push(this.NewChild());
  }

  DelEntry(item) {
    if (item == undefined) {
      return;
    }

    if ('children' in item) {
      for (let i in item.children) {
        let cid = item.children[i];
        let child = this.children.find((x) => {
          return x.ident == cid;
        });
        this.DelEntry(child);
      }
    }
    let index = this.children.indexOf(item);
    if (index > -1) {
      this.children.splice(index, 1);
    }
  }

  Clear() {
    super.Clear();
    this.children = [];
    this.templateName = undefined;
    this.templateType = undefined;
    this.transactionType = undefined;
  }

  NewDep(parent) {
    let index = this.children.indexOf(parent);
    let newChild = this.NewChild();

    newChild.ParentId = parent;

    parent.children.push(newChild.ident);

    if (index > -1) {
      this.children.splice(index + 1, 0, newChild);
    } else {
      this.children.push(newChild);
    }

  }

}

class ChargeTemplateItemCtrl extends GenericFormCtrl {
  constructor(getid, scope) {
    super(getid, scope);
  }
}

app.component("transactionTemplateEditor", {
  controller: ['getid', '$scope', '$http', ChargeTemplateEditorCtrl],
  templateUrl: "modules/transaction/template/editor/default.html"
});

app.component("transactionTemplateForm", {
  controller: ["getid", "$scope", "$http", "$transitions", ChargeTemplateFormCtrl],
  templateUrl: "modules/transaction/template/editor/form.html",
  bindings: form_bindings
});

app.component("transactionTemplateList", {
  templateUrl: "modules/transaction/template/editor/list.html",
  controller: ["getid", ChargeTemplateListCtrl],
  bindings: {
    list: '<',
    selectItem: '&'
  }
});