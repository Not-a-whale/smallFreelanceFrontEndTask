app.component("scrollBtn", {
  templateUrl: "modules/generic/button/scrollbtn.html",
  bindings: {
    direction: '@?'
  }
});

app.component("buttonIcon", {
  templateUrl: "modules/generic/button/iconbtn.html",
  bindings: {
    label: '@',
    iconSize: '@',
    position: '@',
    icon: '@',
    uisref: '@'
  }
});

app.component("buttonIconOnly", {
  templateUrl: "modules/generic/button/icononlybtn.html",
  bindings: {
    icon: '@',
    iconSize: '@'
  }
});

app.component("buttonToggle", {
  templateUrl: "modules/generic/button/togglebtn.html",
  bindings: {

  }
});