var t = 0;
var y;
function draw()
{
    t = t + 0.3;
    var cnv = $("#cnv")[0];
    var context = cnv.getContext("2d");
    context.clearRect(0, 0, cnv.width, cnv.height);
    context.beginPath();

    for (x = -1; x <= cnv.width; x++)
    {
        y = (Math.random() * 2 + Math.cos(t + x * 0.04) * 50);
        context.lineTo(x, cnv.height * 0.6 - y);
    }

    context.lineWidth = 2;
    context.strokeStyle = "#0000ff";
    context.stroke();
}

function initialize()
{
    setInterval(draw, 200);
}
$(initialize);
