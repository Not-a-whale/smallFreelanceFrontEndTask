class UIPopupCtrl {
  constructor(getid, scope, element, apisrv, timeout) {
    this.id = getid;
    this.scope = scope;
    this.apisrv = apisrv;
    this.element = element;
    this.apisrv = apisrv;
    this.errors = [];
    this.timeout = timeout;
  }

  Submit(endpoint) {
    let self = this;
    let url = this.submit_endpoint || endpoint;

    this.apisrv.Single(url, this.data).then(function (res) {
      // add error checking here
      if (res instanceof ErrorObj) {
        self.errors.push(res);
      } else {

        self.errors.push(new ErrorObj('Submitted successfully!', ErrorLevel.SUCCESS));
        self.data = res;
        self.UpdateData();
        self.timeout(function () {
          self.Close();
        }, 750);
      }

    });
  }

  UpdateData() {
    if (this.updateData instanceof Function) {
      this.updateData({
        data: this.data
      });
    }
  }

  Cancel() {
    this.Close();
  }
  Close() {
    if (this.onClose instanceof Function) {
      this.onClose({
        data: this.data
      });
    }
    this.element.remove();
  }

}

// concrete popup directive
app.directive('uiPopup', function () {
  return {
    restrict: 'E',
    templateUrl: function (element, attr) {
      return 'modules/ui/popup/formtype/' + attr.formtype + '.template.html';
    },
    scope: {},
    controller: ['getid', '$scope', '$element', 'APIService', '$timeout', UIPopupCtrl],
    controllerAs: '$ctrl',
    transclude: {
      headerContent: '?headerContent',
      bodyContent: '?bodyContent',
      footerContent: '?footerContent'
    },
    bindToController: { // not sure what i need to bind for all popups
      onClose: '&?',
      updateData: '&?',
    }
  };
});

class UIPopupTemplateCtrl {
  constructor(getid, scope, element) {
    this.id = getid();
    this.scope = scope;
    this.element = element;
    this.icon = 'imgs/icons.svg#boxes';
    this.title = 'a title goes here';
    //holds ErrorObj's for displaying errors
    this.errors = [];
  }

  Close() {
    if (this.onClose instanceof Function) {
      this.onClose();
    }
    this.element.remove();
  }

  RemoveError(error) {
    let index = this.errors.indexOf(error);
    this.errors.splice(index, 1);
  }
}

app.directive('uiPopupTemplate', function () {
  return {
    restrict: 'E',
    templateUrl: 'modules/ui/popup/template.html',
    requires: {
      uiPopup: '^^'
    },
    scope: {},
    controller: ['getid', '$scope', '$element', UIPopupTemplateCtrl],
    controllerAs: '$ctrl',
    transclude: {
      headerContent: '?headerContent',
      bodyContent: '?bodyContent',
      footerContent: '?footerContent'
    },
    bindToController: {
      title: '@?',
      icon: '@?',
      onClose: '&?',
      errors: '=?'
    }
  };
});


//default header
app.component('uiPopupHeader', {
  templateUrl: 'modules/ui/popup/header.template.html',
  bindings: {
    title: '@?',
    user: '@?'
  }
});

//default footer
app.component('uiPopupFooter', {
  templateUrl: 'modules/ui/popup/footer.template.html',
  bindings: {
    onCancel: '&?',
    onSubmit: '&?'
  }
});



app.directive('draggable', function ($document) {
  return {
    restrict: 'A',
    scope: {}, //isolate scope for dragging around thing
    link: function (scope, element, attr) {
      scope.container = attr.$$element.parent();
      scope.x = Math.max(0, Math.min((window.innerWidth - scope.container[0].clientWidth) / 2, window.innerWidth - scope.container[0].clientWidth));
      scope.y = Math.max(0, Math.min((window.innerHeight - scope.container[0].clientHeight) / 2, window.innerHeight - scope.container[0].clientHeight));


      element.css({
        cursor: 'grab'
      });

      scope.container.css({
        top: scope.y + 'px',
        left: scope.x + 'px'
      });

      element.on('mousedown', function (event) {
        event.preventDefault();
        scope.startMX = event.clientX;
        scope.startMY = event.clientY;
        $document.on('mousemove', mousemove);
        $document.on('mouseup', mouseup);
        element.css({
          cursor: 'grabbing'
        });
      });

      function mousemove(event) {
        let newy = scope.y + (event.clientY - scope.startMY);
        let newx = scope.x + (event.clientX - scope.startMX);
        scope.startMY = event.clientY;
        scope.startMX = event.clientX;
        scope.y = Math.max(0, Math.min(newy, window.innerHeight - scope.container[0].clientHeight));
        scope.x = Math.max(0, Math.min(newx, window.innerWidth - scope.container[0].clientWidth));
        scope.container.css({
          top: scope.y + 'px',
          left: scope.x + 'px'
        });
      }

      function mouseup() {
        element.css({
          cursor: 'grab'
        });
        $document.unbind('mousemove', mousemove);
        $document.unbind('mouseup', mouseup);
      }
    }
  };
});