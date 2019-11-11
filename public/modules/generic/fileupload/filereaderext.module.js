class FileReaderExt {
  constructor() {
    this.fr = new FileReader();
    this.queue = []; // all the files that need to be read
    this.outgoing = {}; // all the processed files
    this.item = undefined; //current file that is being read
    this.callback = {};
    var self = this;

    this.fr.onload = function (event) {
      self.onload(event);
    }
    this.fr.onloadend = function (event) {
      self.onloadend(event);
    }
  }

  /*  Returns all processed files and cleans out the list.
   */
  getFiles(id) {
    let thefiles = this.outgoing[id].splice(0, this.outgoing[id].length);
    return thefiles;
  }

  /*  Give the filereader some files to read, will require an id to get back.
   */
  addFiles(id, filelist) {
    console.log(filelist);
    for (let f of filelist) {
      this.queue.push({
        id: id,
        file: f
      });
    }
  }

  addFile(id, file) {
    this.addFiles(id, [file]);
  }

  hasFiles() {
    return this.queue.length > 0;
  }

  ReadFiles() {
    if (this.fr.readyState != this.fr.LOADING) {
      this.ReadNextFile();
    } else {
      console.error('Currently reading a file');
      return -1;
    }
  }

  ReadNextFile() {
    if (this.hasFiles()) {
      this.item = this.queue.shift();
      this.fr.readAsDataURL(this.item.file);
    } else {
      this.doCallback(this.item.id, 'finished');
      this.item = undefined;
    }
  }

  onload(event) {
    if (!(this.item.id in this.outgoing)) {
      this.outgoing[this.item.id] = [];
    }
    console.log(this.item.file);
    this.outgoing[this.item.id].push({
      'name': this.item.file.name,
      'content': this.fr.result,
      'type': this.item.file.type,
      'size': this.item.file.size
    });

    if (this.scope) {
      this.scope.$apply();
    }
  }

  onloadend(event) {
    this.doCallback(this.item.id, 'onloadend');
    this.ReadNextFile();
  }

  doCallback(id, event) {
    if (event in this.callback) {
      if (id in this.callback[event]) {
        let callback = this.callback[event][id];
        if (callback instanceof Function) {
          callback();
        }
      }
    }
  }

  addCallback(id, event, callback) {
    if (!(event in this.callback)) {
      this.callback[event] = {};
    }
    this.callback[event][id] = callback;
  }
}

app.service("FileReaderExt", FileReaderExt);

app.directive("fileReader", ['FileReaderExt', function (filereader) {
  return {
    require: 'ngModel',
    link: function postLink(scope, element, attrs, ngModel) {
      element.on("change", function (e) {
        if (element[0].files.length > 0) {
          var files = [];
          for (let f of element[0].files) {
            files.push(f);
          }

          filereader.addFiles(scope.$ctrl.id, files);
          filereader.ReadFiles();
          element.val(null);

          ngModel.$setViewValue(files);
          ngModel.$render();
        }
      });
    }
  }
}]);


app.directive("fileReaderNoClick", ['FileReaderExt', function (filereader) {
  return {
    require: 'ngModel',
    link: function postLink(scope, element, attrs, ngModel) {
      element[0].addEventListener("click", function (event) {
        event.preventDefault();
      });

      element.on("change", function (e) {
        if (element[0].files.length > 0) {
          var files = [];
          for (let f of element[0].files) {
            files.push(f);
          }

          filereader.addFiles(scope.$ctrl.id, files);
          filereader.ReadFiles();
          element.val(null);

          ngModel.$setViewValue(files);
          ngModel.$render();
        }
      });
    }
  }
}]);