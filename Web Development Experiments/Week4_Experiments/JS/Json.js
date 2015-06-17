$(document).ready(function () {

    function fetchImageJson() {
        var fetchAPI = 'http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?';
        $.getJSON(fetchAPI, {
            tags: 'Northeastern University',
            tagmode: 'any',
            format: 'json'
        },
         onSuccess);
    }

    function onSuccess(output) {
        $('#imgarea').empty();
        $.each(output.items, function (i, item) {
            $('<img>').attr('src', item.media.m).appendTo('#imgarea');
        });
    }

    function onErr(xhr, status, strErr) {
        alert(strErr);
    }

    $('#fbutton').click(function () {
       
        fetchImageJson();
    });

    $.ajaxSetup({
              cache: false
    });

});