function ballUp() {
    $("#ball").animate({ top: "1px" }, "slow", "swing", ballDown);
}


function ballDown() {
    $("#ball").animate({ top: "446px" }, "slow", "swing", ballUp);
}


$(document).ready(function () {
    ballUp();
});