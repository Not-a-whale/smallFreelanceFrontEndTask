class SymbolService {
  constructor(http){
    this.http = http;
    this.symbols = undefined;
  }

  Symbol(name) {
    console.error("SymbolService Symbol function not implemented.");
  }

  Symbols() {
    if (this.symbols != undefined){
      return this.symbols;
    } else {
      let self = this;
      return this.http.get('symbols.json').then(function(res){
        self.symbols = res.data;
        return self.symbols;
      });
    }
  }
}


// $onInit() {
//   var self = this;
//   this.http.get('symbols.json').then(function (res) {
//     self.iconList = res.data;
//   });
// }

app.service("SymbolService", ['$http', SymbolService]);