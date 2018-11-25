<!--
	This is a very simple ajax application which has
	java in the application. This application is an 
	outcome of the RnD division run Debadatta Mishra.
	Very shortly you will find several java and other
	related articles in the internet.

	It is a learning application, please do not integrate
	in your application. It has been made open source.
	It is not for any commercial purpose.
	Please enjoy it at your own convenience.

	@auther Debadatta Mishra
-->
<html>
<head>
<title>Some Example</title>

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
        document.getElementById("characters").innerHTML = req.responseText;
      } else {
        alert("Problem: " + req.statusText);
      }
    }
  }

</script>

</head>
<body onLoad="retrieveURL('programaction.do');">

<h1>Dynamic population of list using AJAX</h1>

<form name="dynamicSelect">

	<table>
		<tr>
			<td>
				Please select your TV program: 
			</td>
			<td>
				  <select name="TVShowSelect" onChange="retrieveURL('programaction.do?tvShow=' + this.value);">
							<option value="">Select</option>
							<option value="Star Tv">Star Tv</option>
							<option value="DD Oriya">DD Oriya</option>
							<option value="Zee News">Zee News</option>
				  </select>

			</td>
			<td/><td/>
			<td>
				Available programs: 
			</td>
			<td>
				<span id="characters"></span>
			</td>
			
		</tr>
	</table>
  
</form>

<!--
	Personal Information
-->
		<table>
			<tr>
				<td width="350"></td>
				<td>Developed by <a href="mailTo:debadattamishra@aol.com">Debadatta Mishra</a></td>
			</tr>
		</table>
</body>
</html>
