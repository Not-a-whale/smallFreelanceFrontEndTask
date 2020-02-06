class TransactionTemplateFormCtrl extends GenericFormCtrl {
  constructor(getid, scope, TransactionService) {
    super(getid, scope);
    this.state = "tmsapp.main.fin.chargeitems.edit";
    this.children = [];
    this.headers = ["IDs", "Name", "Description", "Entity", "Credit Account", "Debit Account", "Price", "Price Type"];
    this.entities = [];
    this.accounts = [];
    this.getid = getid;
    this.templateName = undefined;
    this.templateType = undefined;
    this.transactionType = undefined;
  }


  Search(data) {
    console.log('doing the search!');
    console.log(data);
  }
  // $onInit() {
  //   super.$onInit();

  //   let self = this;

  //   this.http.get("/api/transactiontemplate/entitylist").then(function (res) {
  //     self.entities = res.data.DATA.entities;
  //   }, function (res) {});

  //   this.http.get("/api/transactiontemplate/accountlist").then(function (res) {
  //     self.accounts = res.data.DATA.list;
  //   }, function (res) {});

  //   this.http.get("/api/transactiontemplate/transtypelist").then(function (res) {
  //     self.transtypes = res.data.DATA.list;
  //   }, function (res) {});

  //   this.http.get("/api/transactiontemplate/templatetypelist").then(function (res) {
  //     self.templatetypes = res.data.DATA.list;
  //   }, function (res) {});
  // }

  // UpdateAttr(attr, value) {
  //   this[attr] = value;
  // }

  // UpdateField(field, value, item) {
  //   let index = this.children.indexOf(item);
  //   if (index > -1) {
  //     this.children[index][field] = value;
  //   }
  // }

  // Update() {
  //   this.scope.$broadcast("Update");
  //   if (this.onUpdate instanceof Function) {
  //     let item = {
  //       templateType: this.templateType,
  //       templateName: this.templateName,
  //       transactionType: this.transactionType,
  //       children: this.children
  //     };
  //     this.onUpdate({
  //       item: item
  //     });
  //   }
  // }

  // NewChild() {
  //   return {
  //     'ident': this.getid(),
  //     'children': [],
  //     'ParentId': undefined
  //   };
  // }

  // NewEntry() {
  //   this.children.push(this.NewChild());
  // }

  // DelEntry(item) {
  //   if (item == undefined) {
  //     return;
  //   }

  //   if ('children' in item) {
  //     for (let i in item.children) {
  //       let cid = item.children[i];
  //       let child = this.children.find((x) => {
  //         return x.ident == cid;
  //       });
  //       this.DelEntry(child);
  //     }
  //   }
  //   let index = this.children.indexOf(item);
  //   if (index > -1) {
  //     this.children.splice(index, 1);
  //   }
  // }

  // Clear() {
  //   super.Clear();
  //   this.children = [];
  //   this.templateName = undefined;
  //   this.templateType = undefined;
  //   this.transactionType = undefined;
  // }

  // NewDep(parent) {
  //   let index = this.children.indexOf(parent);
  //   let newChild = this.NewChild();

  //   newChild.ParentId = parent;

  //   parent.children.push(newChild.ident);

  //   if (index > -1) {
  //     this.children.splice(index + 1, 0, newChild);
  //   } else {
  //     this.children.push(newChild);
  //   }

  // }

}

app.controller("TransactionTemplateFormCtrl", ["getid", "$scope", "TransactionService", TransactionTemplateFormCtrl]);

app.component("transactionTemplateDetail", {
  templateUrl: "modules/transaction/template/editor/detail.html",
  controller: "TransactionTemplateFormCtrl",
  bindings: {
    children: "<"
  }
});

app.component("transactionTemplateEditor", {
  templateUrl: "modules/transaction/template/editor/default.html"
});

app.component("transactionTemplateForm", {
  controller: "TransactionTemplateFormCtrl",
  templateUrl: "modules/transaction/template/editor/form.html",
  bindings: form_bindings
});

app.component("transactionTemplateForm2", {
  controller: "TransactionTemplateFormCtrl",
  templateUrl: "modules/transaction/template/editor/form2.html",
  bindings: form_bindings
});

app.component("transactionTemplateList", {
  templateUrl: "modules/transaction/template/editor/list.html",
  bindings: {
    list: '<',
  }
});