"use strict";

var rooms = [{
  name: "Predavaonica 1",
  itemsCount: 50
}, {
  name: "Predavaonica 2",
  itemsCount: 50
}, {
  name: "Predavaonica 3",
  itemsCount: 50
}, {
  name: "Predavaonica 4",
  itemsCount: 50
}, {
  name: "Predavaonica 5",
  itemsCount: 50
}, {
  name: "Predavaonica 6",
  itemsCount: 50
}, {
  name: "Portirnica",
  itemsCount: 50
}, {
  name: "Referada",
  itemsCount: 50
}];

function sort() {
  var paragraph = document.getElementById("sortClasses");
  var img = document.createElement("img");
  var button = document.createElement("a");
  img.src = "./assets/Images/Arrow.svg";
  img.alt = "";
  img.setAttribute("style", "width: 8px; height: 8px;");
  var sortedRooms = rooms;
  var flag = 1;
  var downArrow = false;

  button.onclick = function () {
    sortedRooms = sortedRooms.sort(function (a, b) {
      return a.name > b.name ? -1 * flag : flag;
    });
    flag = -1 * flag;
    rooms = sortedRooms;

    if (downArrow === true) {
      img.setAttribute("style", " width: 8px; height: 8px; transform: rotate(0deg);");
    } else {
      img.setAttribute("style", " width: 8px; height: 8px; transform: rotate(180deg);");
    }

    downArrow = !downArrow;
    fillRooms(rooms);
  };

  button.appendChild(img);
  paragraph.appendChild(document.createTextNode("Poredaj po imenu"));
  paragraph.appendChild(button);
  return fillRooms(sortedRooms);
}

function fillRooms(roomsToPrint) {
  var list = document.getElementsByClassName("bluelist")[0];
  list.innerHTML = "";

  for (i = 0; i < roomsToPrint.length; i++) {
    var elem = document.createElement("li");
    var paragraph = document.createElement("p");
    paragraph.appendChild(document.createTextNode("Broj Predmeta " + roomsToPrint[i].itemsCount));
    elem.appendChild(document.createTextNode(roomsToPrint[i].name));
    elem.appendChild(paragraph);
    list.appendChild(elem);
  }

  rooms = true;
}

sort();