function add(type) {
    var element = document.createElement("input");
    element.setAttribute("type", type);
    element.setAttribute("name", type);
    element.setAttribute("value", type);
    var curElement = document.getElementById("formspan");
    curElement.appendChild(element);
}
