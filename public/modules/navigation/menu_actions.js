function FlipCollapseMenu(node) {
  let menu = document.getElementById("navbox");
  let min = "45px";
  let max = "190px";
  if (menu.style.width == min) {
    menu.style.width = max;
    node.src = "imgs/collapse-arrow.svg";
    document.getElementById("logo-container").className = "logo-container-expanded";
    document.getElementById("logo-image").className = "logo-img-expanded";
    document.getElementById("logo-image").src = "imgs/logo.svg"
  } else {
    menu.style.width = min;
    node.src = "imgs/expand-arrow.svg";
    document.getElementById("logo-container").className = "logo-container-collapsed";
    document.getElementById("logo-image").className = "logo-img-collapsed";
    document.getElementById("logo-image").src = "imgs/home.svg";
  }
}

function CloseAllMenus() {
  document.getElementById("menu-tree").childNodes.forEach(function (box) {
    if (box.nodeName == 'LI') {
      box.childNodes.forEach(function (chld) {
        if (chld.nodeName == "UL") chld.style.display = 'none';
      });
    }
  });
}

function MenuHideShow(node) {
  let liItem = node.parentNode;
  CloseAllMenus();
  for (let sitemi = 0; sitemi < liItem.childNodes.length; sitemi++) {
    let sitem = liItem.childNodes[sitemi];
    if (sitem.nodeName == "UL") {
      if (sitem.style.display == 'none') {
        sitem.style.display = 'block';
      } else {
        sitem.style.display = 'none';
      }
    }
  }
}