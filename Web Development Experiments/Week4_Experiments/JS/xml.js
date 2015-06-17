$(document).ready(function () {

    function loadXMLDATA() {
        $.get('xmlFile.xml', function (result) {
            var fname = result.getElementsByTagName('firstName')[0];
            var lname = result.getElementsByTagName('lastName')[0];
            var city = result.getElementsByTagName('city')[0];
            var state = result.getElementsByTagName('state')[0];
            var country = result.getElementsByTagName('country')[0];
           
            var str = '<p>First Name: ' + fname.firstChild.nodeValue + '</br> Last Name: ' + lname.firstChild.nodeValue + '</br> City: ' +
                      city.firstChild.nodeValue + '</br> State: ' + state.firstChild.nodeValue + '</br> Country: ' +country.firstChild.nodeValue + '</br> </p>';
            $('#content').empty();
            $('#content').append(str);
        });
    }

    $('#click').click(function () {
        loadXMLDATA();
    });


});