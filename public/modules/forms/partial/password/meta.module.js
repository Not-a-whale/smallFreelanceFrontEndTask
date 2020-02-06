/*
  Password creation controller for checking if both fields match or not.
  checks for password complexity
  Complexity described by class methods
*/
class PasswordCtrl {
  constructor(password) {
    this.password = password;
    this.passwords = [undefined, undefined];
    this.errors = {};
    this.errors.mismatch = new ErrorMsg("Passwords do not match");
    this.errors.default = new ErrorMsg("This field is required");
    this.errors.nocaps = new ErrorMsg("Password requires at least one capital letter");
    this.errors.nospecial = new ErrorMsg("Password requires at least one special character");
    this.errors.nonumbers = new ErrorMsg("Password requires at least one number");
    this.errors.tooshort = new ErrorMsg("Password must be atleast 8 characters long");
  }

  MissingLength(length) {
    let retval = false;
    retval = this.passwords[0].length < length;
    return retval;
  }

  MissingNumber() {
    let retval = false;
    let re = /[0-9]/;
    retval = this.passwords[0].search(re) == -1;
    return retval;
  }

  MissingCapital() {
    let retval = false;
    let re = /[A-Z]/;
    retval = this.passwords[0].search(re) == -1;
    return retval;
  }

  MissingSpecial() {
    let retval = false;
    let re = /[!@#$%^&*(){}\[\];:<>,.?\/]/;
    retval = this.passwords[0].search(re) == -1;
    return retval;
  }

  PasswordsMatch() {
    return this.passwords[0] == this.passwords[1];
  }

  CheckPasswords() {
    if (this.passwords[0] !== undefined) {
      this.errors.tooshort.Set(this.MissingLength(8));
      this.errors.nocaps.Set(this.MissingCapital());
      this.errors.nospecial.Set(this.MissingSpecial());
      this.errors.nonumbers.Set(this.MissingNumber());

      if (this.passwords[1] !== undefined){
        this.errors.mismatch.Set(this.PasswordsMatch());
      }
    }
  }
}

class ErrorMsg {
  constructor(msg) {
    this.message = msg;
    this.enabled = false;
  }

  Enable() {
    this.enabled = true;
  }

  Disable() {
    this.enabled = false;
  }

  Toggle() {
    this.enabled = !this.enabled;
  }

  Set(boolean) {
    this.enabled = boolean;
  }
}

app.controller('PasswordCtrl', PasswordCtrl);

app.component('metaPasswordForm', {
  templateUrl: 'modules/forms/partial/password/meta.module.js',
  controller: 'PasswordCtrl',
  bindings: meta_bindings
});