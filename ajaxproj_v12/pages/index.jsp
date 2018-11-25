<%-- Copyright 2005 Sun Microsystems, Inc. All rights reserved. You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at: http://developer.sun.com/berkeley_license.html
$Id: index.jsp,v 1.9 2006/03/16 16:07:25 gmurray71 Exp $ --%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
 .bp_invalid {
    color:white;
    background:red;
 }
 .bp_valid {
    color:green;
 }
</style>
<script type="text/javascript">

function AJAXInteraction(url, callback) {

    var req = init();
    req.onreadystatechange = processRequest;
        
    function init() {
      if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
      } else if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
      }
    }
    
    function processRequest () {
      // readyState of 4 signifies request is complete
      if (req.readyState == 4) {
        // status of 200 signifies sucessful HTTP call
        if (req.status == 200) {
          if (callback) callback(req.responseXML);
        }
      }
    }

    this.doGet = function() {
      req.open("GET", url, true);
      req.send(null);
    }
}

function validateUserId() {
    var target = document.getElementById("userid");
    var url = "validate?id=" + encodeURIComponent(target.value);    
    var target = document.getElementById("userid");
    var ajax = new AJAXInteraction(url, validateCallback);
    ajax.doGet();
}

function validateCallback(responseXML) {
   var msg = responseXML.getElementsByTagName("valid")[0].firstChild.nodeValue;
   if (msg == "false"){
       var mdiv = document.getElementById("userIdMessage");
       // set the style on the div to invalid
       mdiv.className = "bp_invalid";
       mdiv.innerHTML = "Invalid User Id";
       var submitBtn = document.getElementById("submit_btn");
       submitBtn.disabled = true;
    } else {
       var mdiv = document.getElementById("userIdMessage");
       // set the style on the div to valid
       mdiv.className = "bp_valid";
       mdiv.innerHTML = "Valid User Id";
       var submitBtn = document.getElementById("submit_btn");
       submitBtn.disabled = false;
    }  
}
</script>
 <title>Form Data Validation using AJAX</title>
</head>
 <body onload="disableSubmitBtn()">
 
 <h1>Instant validation of user name using AJAX</h1>
 <p>
 This application has been developed by Debadatta Mishra
 </p>
  
  <form name="updateAccount" action="validate" method="post">
   <input type="hidden" name="action" value="create"/>
   <table border="0" cellpadding="5" cellspacing="0">
    <tr>
     <td><b>User Id:</b></td>
     <td>
      <input    type="text"
                size="20"  
                  id="userid"
				name="id"
                autocomplete="off"
             onkeyup="validateUserId()">
     </td>
     <td>
      <div id="userIdMessage"></div>
     </td>
    </tr>
    <tr>
     <td align="right" colspan="2">
      <input id="submit_btn" type="Submit" value="Create Account">
     </td>
     <td></td>
	</tr>
   </table>
  </form>
 </body>
</html>

