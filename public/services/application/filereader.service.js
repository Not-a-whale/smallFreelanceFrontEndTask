class FileReaderQueueItem {
  constructor(id, file) {
    this.id = id;
    this.file = file;
  }
}
class APIFile {
  /**
   *
   * @param {string} doctitle
   * @param {string} keywords
   * @param {string} filename
   * @param {string} filedata
   * @param {string} mimetype
   */
  constructor(filename, filedata, mimetype, doctitle, keywords) {
    this.DocumentTitle = doctitle;
    this.Keywords = keywords;
    this.FileName = filename;
    this.FileData = filedata;
    this.MIMEType = mimetype;
    this.SHASIG = sha256(filedata);
  }
}

class FileReaderService {
  constructor($rootScope) {
    this.rootscope = $rootScope;
    this.fr = new FileReader();
    this.queue = {}; // one file queue per id
    this.outgoing = {};
    this.currentfile = undefined;
    let self = this;
    this.fr.onload = function (event) {
      self.OnLoad(event);
    };
    this.fr.onloadend = function (event) {
      self.OnLoadEnd(event);
    };
  }
  /**
   * @param {number} id
   * @param {File} file
   */
  addFile(id, file) {
    this.addFiles(id, [file]);
  }
  /**
   * @param {number} id
   * @param {Array[File]} filelist
   */
  addFiles(id, filelist) {
    for (let f of filelist) {
      if (!(id in this.queue)) {
        this.queue[id] = [];
      }
      this.queue[id].push(new FileReaderQueueItem(id, f));
    }
  }

  getFiles(id) {
    return this.outgoing[id].splice(0, this.outgoing[id].length);
  }

  hasFiles() {
    return this.queue.length > 0;
  }

  ReadNextFile() {
    // queue can have multiple sources, have to inform sources when its done
    let currentid = undefined;
    if (this.currentfile != undefined) {
      currentid = this.currentfile.id;
    } else {
      currentid = Object.keys(this.queue).shift();
    }
    if (currentid != undefined && currentid in this.queue) {
      if (this.queue[currentid].length < 1) {
        // finished reading all the files for the id
        delete this.queue[currentid];
        this.rootscope.$emit('fileread', {
          id: currentid,
          files: this.getFiles(currentid)
        });
      } else {
        this.currentfile = this.queue[currentid].shift();
        this.fr.readAsDataURL(this.currentfile.file);
      }
    }
  }

  ReadFiles() {
    if (this.fr.readyState != this.fr.LOADING) {
      this.ReadNextFile();
    } else {
      console.error('current reading a file');
      return -1;
    }
  }

  OnLoad(event) {
    if (!(this.currentfile.id in this.outgoing)) {
      this.outgoing[this.currentfile.id] = [];
    }
    let file = this.currentfile.file;
    console.log(file);
    let apifile = new APIFile(file.name, this.fr.result, file.type);
    this.outgoing[this.currentfile.id].push(apifile);
  }

  OnLoadEnd(event) {
    this.ReadNextFile();
  }
}

app.service('FileReaderService', ['$rootScope', FileReaderService]);