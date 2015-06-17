var output = "<table><tr><th>Station Name</th><th>Hosting Website</th><th>StreamUrl</th><th>Country</th><th>Bitrate</th><th>Status</th></tr>";
var proxy_url = ["simpleproxy.aspx?url=|http://api.dirble.com/v1/stations/apikey/1f5109777eb0e30be7c9ae5321c2a290b08a4445/id/2/format/xml|",
];

$(document).ready(function () {
    
    $('#reset').on('click', function () {
        $('#disp').html('');       
        $('#getData').attr("disabled", false);
        location.reload('#refresh');
    });

    $("#getData").click(function () {
        $.ajax({
            url: proxy_url[0],
            datatype: "xml",
            cache: false,
            success: displayData,
        });
        $("#getData").attr("disabled", true);
        
    });

});

function displayData(data) {
    x = data.getElementsByTagName('item');
    y = [];
    for (i = 0; i < 10; i++) {
        if (x[i].getElementsByTagName('status')[0].childNodes[0].nodeValue=="0") {
            y[i] = 'Station down';
        }
        else {
            y[i] ='Ok';
        }
        output += "<tr><td>" +
            x[i].getElementsByTagName('name')[0].childNodes[0].nodeValue +
                      "</td><td><a href='" +
                x[i].getElementsByTagName('website')[0].childNodes[0].nodeValue +
                "'>" + x[i].getElementsByTagName('website')[0].childNodes[0].nodeValue + 
                  "</td><td><a href='" +
                x[i].getElementsByTagName('streamurl')[0].childNodes[0].nodeValue +
                  "'>" + x[i].getElementsByTagName('streamurl')[0].childNodes[0].nodeValue + "</td><td>" +
                x[i].getElementsByTagName('country')[0].childNodes[0].nodeValue +
                  "</td><td>" +
                x[i].getElementsByTagName('bitrate')[0].childNodes[0].nodeValue +
                  "</td><td>" +
                 y[i] +
                  "</td><tr>"
    }
    output += "</table>";
    $('#disp').html(output);
}


