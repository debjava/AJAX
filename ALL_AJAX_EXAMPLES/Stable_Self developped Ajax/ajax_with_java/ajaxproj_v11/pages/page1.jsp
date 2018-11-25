<html>
<head>
<title>Example 6</title>
</head>

<script>

  var req;
  var which;

  function retrieveURL(url) {
    if (url != "") {
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
  }

  function processStateChange() {
    if (req.readyState == 4) { // Complete
      if (req.status == 200) { // OK response
        // We're going to get a list of all tags in the returned XML with the
        // names title, link and description.  Everything else is ignored.
        // For each that we find, we'll constuct a simple bit of HTML for
        // it and build up the HTML to display.  When we hit a title,
        // link or description element that isn't there, we're done.
        xml = req.responseXML;
        i = 0;
        html = "";
        while (i >= 0) {
          t = xml.getElementsByTagName("title")[i];
          l = xml.getElementsByTagName("link")[i];
          d = xml.getElementsByTagName("description")[i];
          if (t != null && l != null && d != null) {
            t = t.firstChild.data;
            l = l.firstChild.data;
            d = d.firstChild.data;
            html += "<a href=\"" + l + "\">" + t + "</a><br>" + d + "<br><br>";
            i++;
          } else {
            i = -1;
          }
        }
        document.getElementById("rssData").innerHTML = html;
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }

</script>

<body>

This example displays the data coming from the xml file<br><br>

<form name="rssForm">
  <select name="rssFeed" onChange="retrieveURL(this.value);">
    <option value="">Select</option>
    <option value="cnn_rss.xml">CNN Top Stories</option>
    <option value="slashdot_rss.xml">Slashdot</option>
    <option value="dans_rss.xml">Dan's Data</option>
  </select>
</form>

<span id="rssData"></span>
<br>

</body>
</html>
