
function imgpreload(url) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            var content = request.responseText;
            var img = new Image();
            img.src = content;
        }
    };

    request.open("GET", url, true);
    request.send(null);
}

function enlarge(element) {
    var name = element.src;
    var imgname = name.lastIndexOf("/");

    name = name.slice(imgname + 1);
    name = name.slice(3);
    name = "images/" + name;

    var itag = "<img src='" + name + "' >";
    document.getElementById("enlargedimage").innerHTML = itag;
}