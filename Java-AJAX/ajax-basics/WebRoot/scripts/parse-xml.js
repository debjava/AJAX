var request;

function getRequestObject() {
  if (window.ActiveXObject) {
    return(new ActiveXObject("Microsoft.XMLHTTP"));
  } else if (window.XMLHttpRequest) {
    return(new XMLHttpRequest());
  } else {
    return(null);
  }
}

function showCityTable() {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    var xmlDocument = request.responseXML;
    var names = xmlDocument.getElementsByTagName("name");
    var times = xmlDocument.getElementsByTagName("time");
    var days = xmlDocument.getElementsByTagName("day");
    var tableData = getTableStart();
    for(var i=0; i<names.length; i++) {
      var name = names[i].childNodes[0].nodeValue;
      var time = times[i].childNodes[0].nodeValue;
      var day = days[i].childNodes[0].nodeValue;
      tableData = tableData + getRowData(name, time, day);
    }
    tableData = tableData + getTableEnd();
    document.getElementById("resultText").innerHTML =
      tableData;
  }
}

function sendRequest() {
  request = getRequestObject();
  request.onreadystatechange = showCityTable;
  request.open("POST", "../show-times-in-cities", true);
  request.setRequestHeader("Content-Type", 
                           "application/x-www-form-urlencoded");
  var timezone = document.getElementById("timezone").value;
  request.send("timezone=" + timezone);
}

function getTableStart() {
  return("<table border='1'>\n" +
         "  <tr><th>City</th><th>Time</th><th>Day</th></tr>\n");
}

function getRowData(name, time, day) {
  return("  <tr><td>" + name + 
         "</td><td>" + time +
         "</td><td>" + day +
         "</td></tr>\n");
}

function getTableEnd() {
  return("</table>\n");
}
