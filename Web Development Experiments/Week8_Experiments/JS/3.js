$(document).ready(function ()
{
    $("ul.sub").hide();
    $("a.trigger").click(function ()
    {
        $(this).next("ul.sub").slideToggle(300)
        .siblings('ul.sub:visible').slideUp(300);
    });
});