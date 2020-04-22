class SelectorCtrl {
  constructor(getid) {
    this.id = getid();
    this.registered = [];
    this.selected = [];
  }
  /**
   * Register an object into a group
   * @param {Object with element attr} x
   */
  Register(x) {
    if (x == undefined) {
      console.error('Trying to register undefined to selector');
    } else if (x.element == undefined) {
      console.error('Must have element on registered controller');
    } else {
      if (!('selected' in x)) {
        x.selected = false;
      }
      registered.push(x);
    }
  }
  SelectMulti(x) {
    this.Toggle(x);
  }

  SelectOne(x) {
    for (let reg of this.registered) {
      this.Deselect(reg);
    }
    this.Select(x);
  }

  SetSelected(obj, val) {
    obj.selected = val;
    let index = this.registered.indexOf(obj);
    if (index == -1) {
      if (!this.Register(obj)) {
        return;
      }
    }
    if (val) {
      if (index != -1) {
        this.registered.push(obj);
      }
      obj.element.addClass('selected');
    } else {
      if (index != -1) {
        this.registered.splice(index, 1);
      }

      obj.element.removeClass('selected');
    }
  }

  /**
   * syntax sugar
   * @param {Object with element attr} x
   */
  Select(x) {
    this.SetSelected(x, true);
  }

  /**
   * syntax sugar
   * @param {Object with element attr} x
   */
  Deselect(x) {
    this.SetSelected(x, false);
  }

  /**
   * syntax sugar
   * @param {Object with element attr} x
   */
  Toggle(x) {
    this.SetSelected(x, !x.selected);
  }


  /**
   * Return the selected elements, always an array
   */
  Selected() {
    return this.selected;
  }
}


app.directive('selector', function () {
  return {
    restrict: 'A',
    controller: SelectorCtrl,
    controllerAs: 'selector',
    link: function ($scope, $element, $attrs, $ctrl) {
      console.log($ctrl);
      $scope.selector = $ctrl;
    }

  };
});