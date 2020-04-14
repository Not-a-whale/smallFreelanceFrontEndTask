// popup is stand alone component
// Popup should not affect data inside of other components
// should not rely on other components to give it data (information that needs to go into the database)
// only accepts meta data for query parameters to retrieve data from server
// popup should query the endpoint to fetch data
// when submitting popup's data, it should close if everything is good to go
// when popup is closed, it should trigger event requery for updated information
// popup can fill data of caller with data it recieved from server


app.directive('popupForm', function ($http, $compile, getid) {
  return {
    restrict: 'A',
    link: function (scope, element, attrs, controller) {
      let newid = getid();
      scope.popup = newid;
      let popupForm = undefined;
      if ('popupForm' in attrs) {
        popupForm = attrs.popupForm;
      }

      element.on('mousedown', function (event) {
        BuildPopup();
      });

      function BuildPopup() {
        let existing_element = document.getElementById(newid);
        if (existing_element == undefined) {

          console.log(attrs);


          let template = '<ui-popup id="' + newid + '" ';
          template += 'formtype="' + popupForm + '" ';
          // template += 'data-title="' + mypopup.title + '"';
          if ('onClose' in attrs) {
            template += 'on-close="' + attrs['onClose'] + '" ';
          }
          if ('updateData' in attrs) {
            template += 'update-data="' + attrs['updateData'] + '" ';
          }
          template += '>';
          template += '</ui-popup>';
          let newscope = scope.$new();
          let existing_element = $compile(template)(newscope);


          element.append(existing_element);
          newscope.$digest();
          let popup = existing_element.find('ui-popup-template');

          let posx = Math.max(0, Math.min((window.innerWidth - popup[0].clientWidth) / 2, window.innerWidth - popup[0].clientWidth));
          let posy = Math.max(0, Math.min((window.innerHeight - popup[0].clientHeight) / 2, window.innerHeight - popup[0].clientHeight));

          existing_element.css({
            position: 'fixed',
            'z-index': '9999',
            left: posx + 'px',
            top: posy + 'px'
          });

          popup.css({
            position: 'fixed',
            left: posx + 'px',
            top: posy + 'px'
          });
        }
        scope.$on('$destroy', function () {
          existing_element.remove();
        });
      }

    }
  };
});