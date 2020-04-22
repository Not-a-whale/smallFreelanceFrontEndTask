class TableSortChips {
  constructor(rootscope) {
    this.rootscope = rootscope;
    this.chips = [];
    this.sort = {};
    this.map = {};
  }

  GetChips() {
    return this.chips;
  }

  GetSort() {
    return this.sort;
  }

  // this is used when a new table is generated to clean everything out inside of the singleton
  // to clear out the chips, see "ClearChips"
  Reset() {
    this.chips = [];
    this.sort = {};
    this.map = {};
  }

  SetMap(map) {
    this.map = map;
    for (let f in map) {
      this.sort[f] = {
        sort: null,
        order: null
      };
    }
  }

  Sort(field) {
    let retval = undefined;
    if (this.sort != undefined) {
      if (field in this.sort) {

        retval = this.sort[field].sort;
      }
    }
    return retval;
  }

  _CheckValidField(field) {
    let valid = false;
    for (let f in this.map) {
      if (f.localeCompare(field) == 0) {
        valid = true;
        break;
      }
    }
    return valid;
  }

  // Sets the orderby to be the column last clicked on
  SetSort(field, value) {
    // check if valid field can be set
    if (this._CheckValidField(field)) {
      // iterate through all valid fields
      // unsort all except the current one selected
      for (let f in this.sort) {
        let fobj = this.sort[f];
        if (f.localeCompare(field) == 0) {
          fobj.sort = value;
        } else {
          fobj.sort = null;
        }
      }
    } else {
      console.error('UITableHeader trying sort incorrect field: ' + field);
    }
  }

  // Sets the order of the fields
  // Sets the last clicked field as first orderby
  SetOrder(field) {
    if (this._CheckValidField(field)) {
      for (let f in this.sort) {
        let fobj = this.sort[f];
        if (f.localeCompare(field) == 0) {
          fobj.order = 0;
        } else {
          fobj.order = null;
        }
      }
    }
  }

  // Puts the chip together
  AddChip(field, value) {
    let chip = new Chip(field, value);
    if (chip.Valid()) {
      let existing = undefined;
      for (let c of this.chips) {
        if (c.Compare(chip)) {
          existing = c;
          break;
        }
      }
      if (existing != undefined) {
        existing.Update(chip.value);
      } else {
        this.chips.push(chip);
      }

    } else {
      console.error('cannot create chip: ' + chip.value);
    }
  }

  RemoveChip(chip) {
    let index = this.chips.indexOf(chip);
    this.chips.splice(index, 1);
    this.Broadcast();
  }

  ClearChips() {
    this.chips = [];
    this.Broadcast();
  }

  Broadcast() {
    let args = {
      fields: this.GetChips(),
      sort: this.GetSort()
    };
    this.rootscope.$broadcast('TableSearch', args);
  }

  HasChips() {
    return this.chips.length > 0;
  }
}

app.service('TableSortChips', ['$rootScope', TableSortChips]);