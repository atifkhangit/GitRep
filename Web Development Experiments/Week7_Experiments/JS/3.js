var geocoder;
var map;
var marker;
var mapOptions = {
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
}


function initialize() {
    geocoder = new google.maps.Geocoder();
    map = new google.maps.Map(document.getElementById('mapspace'), mapOptions);
    codeAddress();
}

function codeAddress() {
    var address = document.getElementById('address').value;
    geocoder.geocode({ 'address': address },
                            function (results, status) {
                                if (status == google.maps.GeocoderStatus.OK) {
                                    map.setCenter(results[0].geometry.location);
                                    if (marker)
                                        marker.setMap(null);
                                    marker = new google.maps.Marker(
                                     {
                                         map: map,
                                         position: results[0].geometry.location,
                                         draggable: true
                                     });

                                    document.getElementById('lat').value = marker.getPosition().lat();
                                    document.getElementById('lon').value = marker.getPosition().lng();
                                }
                                else {
                                    alert('Unable to detect location ');
                                }
                            });
}