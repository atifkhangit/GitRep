if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(getLocation);
}
else {
    alert("Unable to detect Location");
}

function getLocation(position) {
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var latlon = new google.maps.LatLng(lat, lon);

    var mapFeatures = {
        center: latlon,
        zoom: 13,
        mapTypeControl: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };


    getMap = new google.maps.Map(
    document.getElementById("mapspace"), mapFeatures
    );


    var marker = new google.maps.Marker({
        position: latlon,
        map: getMap,
        draggable:false,
        title: "You are here!"
    });
}