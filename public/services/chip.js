class Chip {
  constructor(name, value) {
    this.name = name;
    this.value = value;
  }

  CompareName(value){
    return this.name.localeCompare(value) == 0;
  }

  Compare(chip){
    return this.CompareName(chip.name);
  }

  Update(value){
    this.value = value;
  }

  Valid(){
    return this.value != "" && this.value != undefined;
  }
}