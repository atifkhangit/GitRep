$(document).ready(function () {

    $('div').on('click', function (evt) {
        $('#result').html('</b></div> <div class="btn btn-warning"> TYPE OF EVENT: <b>' + evt.type +
         '</b></div> <div class="btn btn-danger"> DOM ELEMENT/TARGET: <b>' + evt.target +
         '</b></div> <div class="btn btn-info">Timestamp: <b>' + evt.timeStamp +
                '</b>'
        );
    });


});