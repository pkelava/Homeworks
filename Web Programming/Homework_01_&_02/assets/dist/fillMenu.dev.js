"use strict";

var menuItems = [{
  name: "Inventura",
  image: {
    path: "./assets/Images/News.svg",
    alt: ""
  },
  link: "#Inventura"
}, {
  name: "Inventar",
  image: {
    path: "./assets/Images/Box.svg",
    alt: ""
  },
  link: "#Inventar"
}, {
  name: "Prostorije",
  image: {
    path: "./assets/Images/Classroom.svg",
    alt: ""
  },
  link: "#Prostorije"
}, {
  name: "Zaposlenici",
  image: {
    path: "./assets/Images/Contacts.svg",
    alt: ""
  },
  link: "#Zaposlenici"
}, {
  name: "Administracija",
  image: {
    path: "./assets/Images/Services.svg",
    alt: ""
  },
  link: "#Administracija"
}];

function fillMenu() {
  var list = document.getElementsByClassName("graylist")[0];

  for (i = 0; i < menuItems.length; i++) {
    var elem = document.createElement("li");
    var img = document.createElement("img");
    var link = document.createElement("a");
    img.src = menuItems[i].image.path;
    img.alt = menuItems[i].image.alt;
    img.width = 25;
    img.height = 25;
    link.href = menuItems[i].link;
    link.setAttribute("style", "text-decoration: none; color:  rgb(195,200,201); ");
    elem.appendChild(link);
    link.appendChild(img);
    link.appendChild(document.createTextNode(menuItems[i].name));
    list.appendChild(elem);
  }
}

fillMenu();