class DevPageCtrl {
  constructor($http, $q) {
    this.http = $http;
    this.q = $q;
    this.pages = undefined;
    this.levels = [];
    this.pages_string = '';
    this.newattr = undefined;
    this.newvalue = undefined;
  }

  AddAttr() {
    this.active[this.newattr] = this.newvalue;
  }
  SelectPage(page) {
    for (let p of this.levels[page.level]) {
      p.active = false;
    }
    page.active = true;
    this.active = page.data;
    this.levels.splice(page.level + 1, this.levels.length - page.level);
    if ('pages' in page.data) {
      if (Array.isArray(page.data.pages) && page.data.pages.length > 0) {
        let nextlevel = page.level + 1;
        this.levels[nextlevel] = page.data.pages.map(x => new PageItem(x, nextlevel));
      }

    }

  }

  CopyToClipboard() {
    let deferred = this.q.defer();
    let self = this;


    this.pages_string = JSON.stringify(this.pages);
    deferred.resolve(this.pages_string);

    return deferred.promise.then(function () {
      let copyboard = document.getElementById('copyboard');
      copyboard.select();
      copyboard.setSelectionRange(0, 99999);
      document.execCommand('copy');
    }).then(function () {
      alert('copied!');
    });
  }
  $onInit() {
    let self = this;
    this.http.get('pages.json').then(function (result) {
      self.pages = result.data;
      self.levels[0] = result.data.map(x => new PageItem(x, 0));
    });
  }
}

class PageItem {
  constructor(page_data, level) {
    this.data = page_data;
    this.level = level;
    this.active = false;
  }
}

app.component('devPages', {
  templateUrl: 'modules/test/pages/template.html',
  controller: DevPageCtrl
});