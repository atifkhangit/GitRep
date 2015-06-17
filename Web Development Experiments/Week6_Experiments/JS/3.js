
function postXML() {
    var request = new XMLHttpRequest();
    request.open("GET", "XMLFile.xml", true);
    request.onreadystatechange = function () {
        if (request.readyState == 4) {
            if (request.status == 200) {
                getData(request.responseXML);
            }
            else {
                alert("Error in getting XML data: " + request.status + " " + request.statusText);
            }
        }
    };
    request.send(null);
}

function getData(doc) {
    document.frm1.frstname.value = doc.getElementsByTagName('fname').item(0).firstChild.data;
    document.frm1.lstname.value = doc.getElementsByTagName('lname').item(0).firstChild.data;
    document.frm1.cit.value = doc.getElementsByTagName('city').item(0).firstChild.data;
    document.frm1.st.value = doc.getElementsByTagName('state').item(0).firstChild.data;
    document.frm1.ctry.value = doc.getElementsByTagName('country').item(0).firstChild.data;
    

}