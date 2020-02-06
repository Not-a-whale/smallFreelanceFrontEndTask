class ErrorObj {
  constructor(error) {
    this.error = error;
  }

  ErrorMessage() {
    return this.error;
  }
}

// translates the complicated errors to human readable langauges
class ErrorTranslator {
  constructor(message) {
    this.regex = []; // all regex need to match
    this.message = message;
  }

  AddRegex(re) {
    this.regex.push(re);
  }

  Translate(errobj) {
    let msg = errobj.ErrorMessage();
    let matches = true;
    for (let re of this.regex) {
      matches &= re.test(msg);
      if (!matches) {
        return;
      }
    }
    return this.message;
  }
}

class ErrorService {
  constructor() {
    this.translators = [];
    let translator = new ErrorTranslator("No new data returned.");
    translator.AddRegex(new RegExp('Unknown column'));
    this.translators.push(translator);

  }

  // takes error object and translates the error into a human readable string
  ReadError(errobj) {
    let translation = undefined;
    for (let translator of this.translators) {
      console.log(translator);
      translation = translator.Translate(errobj);
      if (translation != undefined) {
        return translation;
      }
    }
  }
}



app.service("ErrorService", ErrorService);