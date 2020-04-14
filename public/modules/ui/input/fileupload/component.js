app.component('uiFile', {
  templateUrl: 'modules/ui/input/fileupload/template.html',
  bindings: {
    fileObj: '=?',
    data: '=?',
    fileId: '=?',
    documentTitle: '@?', //this should be pre-set
    filename: '=?', //this is the name of the file on the uploaders computer
    mimeType: '=?',
    uploadDate: '=?',
    expiredDate: '=?',
    maxfiles: '<?'
  }
});
class FileService {
  constructor() {
    this.filereader = new FileReader();
    this.filereader.onload = function () {
      return this.result;
    }
  }

  OpenFileData(files, callback) {
    this.filereader.onload = function () {
      callback(this.result);
    }
    for (let file of files) {
      this.filereader.readAsDataURL(file);
    }
  }
}
app.service('FileService', [FileService]);