var output = "<table><tr><th>Category Id</th><th>Radio Category</th><th>Description</th></tr>";
var proxy_url = ["simpleproxy.aspx?url=|http://api.dirble.com/v1/categories/apikey/1f5109777eb0e30be7c9ae5321c2a290b08a4445/format/xml|",
];

$(document).ready(function () {
    $('#reset').on('click', function () {
        $('#disp').html('');
        $('#getData').attr("disabled", false);
        location.reload('#disp');
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
    for (i = 0; i < x.length; i++) {
        if (x[i].getElementsByTagName('description')[0].childNodes.length == 0) {
            y[i] = '-';
        }
        else {
            y[i] = x[i].getElementsByTagName('description')[0].childNodes[0].nodeValue;
        }
        output += "<tr><td>" +
            x[i].getElementsByTagName('id')[0].childNodes[0].nodeValue +
                      "</td><td>" +
                x[i].getElementsByTagName('name')[0].childNodes[0].nodeValue +
                  "</td><td>" +
                 y[i] +
                  "</td><tr>"
    }
    output += "</table>";
    $('#disp').html(output);
}


