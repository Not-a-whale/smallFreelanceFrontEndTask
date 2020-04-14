app.directive('fileLoader', function (FileReaderService, getid, $rootScope) {
  return {
    restrict: 'A',
    require: 'ngModel',
    link: function (scope, element, attrs, model) {

      let myid = undefined;
      if ('$ctrl' in scope) {
        if ('id' in scope.$ctrl) {
          if (scope.$ctrl.id == undefined) {
            scope.$ctrl.id = getid();
          }
        } else {
          scope.$ctrl.id = getid();
        }
        myid = scope.$ctrl.id;
      } else {
        myid = scope.id;
      }

      element.on("change", function (e) {
        if (element[0].files.length > 0) {
          var files = element[0].files;
          FileReaderService.addFiles(myid, files);
          FileReaderService.ReadFiles();
          element.val(null);
        }
      });

      let deregisterfun = scope.$root.$on('fileread', function (event, args) {

        if (args.id == myid) {
          let files = args.files;
          let control = scope;
          console.log(scope);
          if ('$ctrl' in scope) {
            control = scope.$ctrl;
          }
          if ('maxfiles' in control) {
            files = files.splice(-control.maxfiles, control.maxfiles);
            if (control.maxfiles == 1) {
              files = files[0];
            }
          }
          model.$setViewValue(files);
          model.$render();
          event.stopPropagation = true;
        }
      });

      scope.$on('$destroy', function () {
        deregisterfun();
      });
    }
  };
});