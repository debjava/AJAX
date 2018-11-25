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

function sendRequest(address) {
  request = getRequestObject();
  request.onreadystatechange = showResponseAlert;
  request.open("GET", address, true);
  request.send(null);
}

function showResponseAlert() {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    alert(request.responseText);
  }
}

function sendRequestWithData(address, data, responseHandler) {
  request = getRequestObject();
  request.onreadystatechange = responseHandler;
  request.open("POST", address, true);
  request.setRequestHeader("Content-Type", 
                           "application/x-www-form-urlencoded");
  request.send(data);
}

function showTimeInCity() {
  var address = "../show-time-in-city";
  var city = document.getElementById("city").value;
  var data = "city=" + escape(city);
  sendRequestWithData(address, data, showResponseAlert);
}

function displayTimeInCity() {
  var address = "../show-time-in-city";
  var city = document.getElementById("city").value;
  var data = "city=" + escape(city) + "&useHTML=true";
  sendRequestWithData(address, data, showResponseText);
}

function showResponseText() {
  if ((request.readyState == 4) &&
      (request.status == 200)) {
    document.getElementById("resultText").innerHTML =
      request.responseText;
  }
}