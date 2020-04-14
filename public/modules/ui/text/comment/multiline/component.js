class UICommentMultilineCtrl {
  constructor() {
    this.data = {};
  }

  CommentText() {
    if ('text' in this.data) {
      if (this.data.text != '' && this.data.text != undefined) {
        return this.data.text;
      }
    }
    return 'no comment';
  }

  Time() {
    if ('time' in this.data) {
      return this.data.time;
    }
    return '--:-- am';
  }

  Date() {
    if ('date' in this.data) {
      return this.data.date;
    }
    return '00/00/0000';
  }

  Username() {
    if ('username' in this.data) {
      return this.data.username;
    }
    return 'unknown';
  }
}

app.component('uiCommentMultiline', {
  templateUrl: 'modules/ui/text/comment/multiline/template.html',
  controller: UICommentMultilineCtrl,
  bindings: {
    data: '<?'
  }
});