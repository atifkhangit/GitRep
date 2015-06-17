var fontSize = 1;
function zoomIn() {
    fontSize += 0.2;
    document.body.style.fontSize = fontSize + "em";
}
function zoomOut() {
    fontSize -= 0.2;
    document.body.style.fontSize = fontSize + "em";
}