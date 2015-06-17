function checkReadyStates(url) {
    request = new XMLHttpRequest();
    $("#steps").empty();
    $("#filedata").empty();
    var steps = document.getElementById("steps");
    steps.innerHTML = "1 Connection Established  " + '<br>';
    request.open("GET", url, true);
    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            steps.innerHTML = steps.innerHTML + request.readyState + '<br>';
            if (request.status == 200) {
                steps.innerHTML += "Call request completed and displaying data now...." + '<br>' + '<br>' ;
                document.getElementById("filedata").innerHTML += request.responseText +'<br>';
            }
            else {
                alert("Error " + request.status);
            }
        }
        else {
            
            steps.innerHTML = steps.innerHTML + request.readyState + '<br>';

        }
    }
    request.send(null);
}