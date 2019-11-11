class GenericFileUploadCtrl extends GenericInputCtrl {
  constructor(getid, scope, http, filereader) {
    super(getid, scope);
    this.http = http;
    this.url = "api/upload/file";
    this.filereader = filereader;
    this.files = [];
    this.filelist;
    this.maxFiles = undefined;
    this.units = ['B', 'KB', 'MB', 'GB'];
    /* possible memory leak in closure as filereader is singleton */
    var self = this;
    this.filereader.addCallback(this.id, 'onloadend', function () {
      self.files = self.files.concat(self.filereader.getFiles(self.id));
      self.files.splice(0, self.files.length - self.maxFiles);
      for (let f of self.files){
        f.uploading = false;
        f.uploaded = false;
        f.status = 0;
        f.complete = false;
        f.ready = true;
        f.uploadfailed = false;

        f.unit = 0;
        f.displaysize = f.size;
        while (f.displaysize > 1024){
          f.displaysize = f.displaysize / 1024;
          f.unit += 1;
        }
        f.displaysize = f.displaysize.toFixed(1);
      }
      self.scope.$apply();
    });
  }

  RemoveFile(file) {
    let index = this.files.indexOf(file);
    this.files.splice(index, 1);
  }

  UploadFiles() {
    let self = this;
    for (let f of this.files) {
      if (!f.uploaded) {
        f.uploading = true;
        this.http.post("api/upload/file", {
          file: f
        }).then(function (res) {
          console.log(res.statusText);
          f.uploaded = true;
          f.uploading = false;
          //self.RemoveFile(f);

        }, function (res) {
          console.error(res.statusText);
          f.uploadfailed = true;
        });
      } else {

      }

    }
  }

  Full(){
    return this.files.length >= this.maxFiles;
  }

  ClearFiles(){
    this.files = [];
  }

  // Stop(event) {
  //   event.preventDefault();
  // }

  $onInit() {
    super.$onInit();
    var self = this;
    this.scope.$on('UploadFiles', function (event, data) {
      self.UploadFiles();
    });
  }
}

var fileupload_bindings = JSON.parse(JSON.stringify(input_bindings));
fileupload_bindings.maxFiles = '@';

app.component('genericFileUpload', {
  templateUrl: 'modules/generic/fileupload/default.html',
  controller: ['getid', '$scope', '$http', 'FileReaderExt', GenericFileUploadCtrl],
  bindings: fileupload_bindings
});