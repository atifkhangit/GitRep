
jQuery(document).ready(function () {
    var div = jQuery('#fixedmenu');
    var start = jQuery(div).offset().top;
    jQuery.event.add(window, "scroll",
function()
{
    var p = jQuery(window).scrollTop();
    jQuery(div).css('position',
((p)>start)?'fixed':'static');
    jQuery(div).css('top', ((p) > start) ? '0px' : '');
    });
    });