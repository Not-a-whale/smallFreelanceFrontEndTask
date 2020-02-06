class UITableSortArrowCtrl {
  constructor(scope) {
    this.scope = scope;
    this.upDir = 'up';
    this.downDir = 'down';
    this.field = 'sort';
    this.direction = null;
  }

  SetDown() {
    this.SetDirection(this.downDir);
  }

  SetUp() {
    this.SetDirection(this.upDir);
  }

  /*
      Sets the direction to the given value if the value is valid
      Also, unsets the direction if the direction is already set to the same value
  */

  SetDirection(direction) {
    let new_dir = null;
    if (direction.localeCompare(this.upDir) == 0 || direction.localeCompare(this.downDir) == 0) {
      if (direction.localeCompare(this.direction) != 0 ) {
        new_dir = direction;
      }
      if (this.updateField instanceof Function) {
        this.updateField({
          field: this.field,
          value: new_dir
        });
      }
    } else {
      console.error('Trying to set wrong direction');
    }
  }

  IsUp() {
    return this.IsActive(this.upDir);
  }

  IsDown() {
    return this.IsActive(this.downDir);
  }

  IsActive(direction) {
    return this.direction == direction;
  }
}

app.controller('UITableSortArrowCtrl', ['$scope', UITableSortArrowCtrl]);