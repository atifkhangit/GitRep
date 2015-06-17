
$.fn.editme = function (newtext, oldtext) {

    $(this).hover(function () {
        $(this).addClass('hover');
    }, function () {
        $(this).removeClass('hover');
    });

    $(this).click(function () {

        var current = $(this);

        current.hide();
        current.after(newtext);
        newtext.focus();

        newtext.blur(function () {

            if ($(this).val() != "") {
                oldtext.val($(this).val()).change();
                current.text($(this).val());
            }

            $(this).remove();
            current.show();
        });
    });
};