class ErrorLevel {
  static ERROR = 1;
  static WARNING = 2;
  static INFO = 3;
  static SUCCESS = 4;
}

class ErrorObj {
  constructor(error, level) {
    this.error = error;
    this.level = level;
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

class RequiredTranslator extends ErrorTranslator {
  constructor() {
    super();
    this.regex_check = new RegExp('Attribute \((?<column>.+?)\) is required');
  }
  Translate(errobj) {
    let msg = undefined;
    let match = this.regex_check.exec(errobj.ErrorMessage());
    if (match != undefined) {
      msg = "Missing required field " + match.groups.column + ".";
    }
    return msg;
  }
}

class TypeConstraintTranslator extends ErrorTranslator {
  constructor() {
    super();
    this.regex_check = new RegExp('Attribute \((?<column>.+?)\) does not pass the type constraint');
  }

  Translate(errobj) {
    let msg = undefined;
    let match = this.regex_check.exec(errobj.ErrorMessage());
    if (match != undefined) {
      msg = "Missing or invalid information in field " + match.groups.column + ".";
    }

    return msg;
  }
}

class RequiredObjectTranslator extends ErrorTranslator {
  constructor() {
    super();
    this.regex_check = new RegExp('execute failed: Field \'(?<column>.+?)\' doesn\'t have a default value');
  }

  Translate(errobj) {
    let msg = undefined;
    let match = this.regex_check.exec(errobj.ErrorMessage());
    if (match != undefined) {
      msg = "Missing required field " + match.groups.column + ".";
    }

    return msg;
  }
}

class ErrorService {
  constructor() {
    this.translators = [];
    let translator = new ErrorTranslator("No new data returned.");
    translator.AddRegex(new RegExp('Unknown column'));
    this.translators.push(translator);
    translator = new ErrorTranslator("Server Error: Database Connection error.");
    translator.AddRegex(new RegExp('Lost connection to MySQL server'));
    this.translators.push(translator);
    translator = new ErrorTranslator("Cannot delete this item. It has dependencies.");
    translator.AddRegex(new RegExp('execute failed: Cannot delete'));
    translator.AddRegex(new RegExp('execute failed: Cannot delete.+DELETE FROM'));
    this.translators.push(translator);

    this.translators.push(new RequiredTranslator());
    this.translators.push(new TypeConstraintTranslator());
  }

  // takes error object and translates the error into a human readable string
  ReadError(errobj) {
    if (errobj instanceof ErrorObj) {
      let translation = undefined;
      for (let translator of this.translators) {
        console.log(translator);
        translation = translator.Translate(errobj);
        if (translation != undefined) {
          return translation;
        }
      }
      return errobj.ErrorMessage();
    } else {
      console.error('trying to translate non-ErrorObj type');
      return 'Unknown message';
    }
  }
}



app.service("ErrorService", ErrorService);