<html>
<head>
<title>Example 2</title>

<script>

  var req;
  var which;

  function retrieveURL(url) {
    if (window.XMLHttpRequest) { // Non-IE browsers
      req = new XMLHttpRequest();
      req.onreadystatechange = processStateChange;
      try {
        req.open("GET", url, true);
      } catch (e) {
        alert(e);
      }
      req.send(null);
    } else if (window.ActiveXObject) { // IE
      req = new ActiveXObject("Microsoft.XMLHTTP");
      if (req) {
        req.onreadystatechange = processStateChange;
        req.open("GET", url, true);
        req.send();
      }
    }
  }

  function processStateChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response
        document.getElementById("theTable").innerHTML = req.responseText;
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }

</script>

</head>
<body onLoad="retrieveURL('example2RenderTable.do');">

<h1>Example 2</h1>
Dynamic table.<hr>

<br>
This example shows a dynamic table onload operation.
<br>
<br>
<br>
It will display a predefined table on page load.
<br>

<span id="theTable"></span>
<br>

</body>
</html>
