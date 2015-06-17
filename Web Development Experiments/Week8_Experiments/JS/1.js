
function draw() {
    var cnv = $("#cnv")[0];
    var context = cnv.getContext('2d');
    var Point = function (x, y) {
        this.x = x;
        this.y = y;
    };
    var pointList = [new Point(90, 20),
                  new Point(220, 20),
                  new Point(280, 120),
                  new Point(220, 220),
                  new Point(90, 220),
                  new Point(30, 120),
                  new Point(90, 20)];

    context.moveTo(pointList[0].x, pointList[0].y);
    context.strokeStyle = "black";
    var pointCounter = 1,
    intrvl = setInterval(function () {

        var point = pointList[pointCounter++];
        context.lineTo(point.x, point.y);
        context.stroke();
        if (pointCounter >= pointList.length) {
            clearInterval(intrvl);
        }
        console.log(pointCounter);
    }, 800);
    context.stroke();
}


    function clearCanvas() {
        var cnv1 = $("#cnv")[0];
        var context1 = cnv.getContext('2d');
        context1.beginPath(); 
        context1.save();         
        context1.setTransform(1, 0, 0, 1, 0, 0);
        context1.clearRect(0, 0, cnv1.width, cnv1.height);

        context1.restore();        
    }
    

function initialize() {
    $("#gnrt").click(draw);
    $("#rst").click(clearCanvas);  
}

$(initialize);