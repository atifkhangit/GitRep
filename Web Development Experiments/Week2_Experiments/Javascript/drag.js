function startDrag(ev) {

    if (!ev) {
        var ev = window.event;
    }

    var targ = ev.target ? ev.target : ev.srcElement;

    if (targ.className != 'dragit')
    {
        return
    };

    offsetX = ev.clientX;
    offsetY = ev.clientY;

    if (!targ.style.top) {
        targ.style.top = '0px'
    };

    if (!targ.style.left)
    {
        targ.style.left = '0px'
    };

  

    coordX = parseInt(targ.style.left);
    coordY = parseInt(targ.style.top);
    drag = true;

    document.onmousemove = drag1;

}
function drag1(ev) {
    if (!drag)
    {
        return
    };
    if (!ev)
    {
        var ev = window.event
    };
    var targ = ev.target ? ev.target : ev.srcElement;

    targ.style.top = coordY + ev.clientY - offsetY + 'px';
    targ.style.left = coordX + ev.clientX - offsetX + 'px';
   
    return false;
}
function stopDrag() {
    drag = false;
}

window.onload = function () {
    document.onmousedown = startDrag;
    document.onmouseup = stopDrag;
    return false;
}
