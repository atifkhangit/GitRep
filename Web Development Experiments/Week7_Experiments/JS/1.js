
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(findlocation);
    }
    else {
        alert("Unable to detect your location");
    }
}

function findlocation(loc) {
    var coord = loc.coords.latitude + "," + loc.coords.longitude;

    var mp = "http://maps.googleapis.com/maps/api/staticmap?center="+ coord + "&zoom=16&size=400x400&sensor=false";
    document.getElementById("mapspace").innerHTML = "<img src='" + mp + "'>" + '<br>';
}
