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
<style type="text/css">

.popupItem {
  background: #FFFAFA;
  color: #000000;
  text-decoration: none;
  font-size: 1.2em;
}

.popupItem:hover {
  background: #7A8AFF;
  color: #FFFAFA;
}

.popupRow {
  background: #FFFAFA;
}

</style>

<script type="text/javascript">

var isIE;
var completeTable;
var completeField;
var autorow;
var req;


function getElementY(element){
	var targetTop = 0;
	if (element.offsetParent) {
		while (element.offsetParent) {
			targetTop += element.offsetTop;
            element = element.offsetParent;
		}
	} else if (element.y) {
		targetTop += element.y;
    }
	return targetTop;
}

function init() {
    completeField = document.getElementById("complete-field");
    var menu = document.getElementById("auto-row");
    autorow = document.getElementById("menu-popup");
    autorow.style.top = getElementY(menu) + "px";
    completeTable = document.getElementById("completeTable");
    completeTable.setAttribute("bordercolor", "white");
}

function initRequest(url) {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}


function doCompletion() {
    if (completeField.value == "") {
        clearTable();
    } else {
        var url = "autocomplete?action=complete&id=" + escape(completeField.value);
        var req = initRequest(url);
        req.onreadystatechange = function() {
            if (req.readyState == 4) {
                if (req.status == 200) {
                    parseMessages(req.responseXML);
                } else if (req.status == 204){
                    clearTable();
                }
            }
        };
        req.open("GET", url, true);
        req.send(null);
    }
}

function parseMessages(responseXML) {
    clearTable();
	var employees = responseXML.getElementsByTagName("employees")[0];
    if (employees.childNodes.length > 0) {
        completeTable.setAttribute("bordercolor", "black");
        completeTable.setAttribute("border", "1");
    } else {
        clearTable();
    }
    
    for (loop = 0; loop < employees.childNodes.length; loop++) {
	    var employee = employees.childNodes[loop];
        var firstName = employee.getElementsByTagName("firstName")[0];
        var lastName = employee.getElementsByTagName("lastName")[0];
        var employeeId = employee.getElementsByTagName("id")[0];
        appendEmployee(firstName.childNodes[0].nodeValue,lastName.childNodes[0].nodeValue, employeeId.childNodes[0].nodeValue);
    }
}

function clearTable() {
    if (completeTable) {
      completeTable.setAttribute("bordercolor", "white");
      completeTable.setAttribute("border", "0");
      completeTable.style.visible = false;
      for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {
        completeTable.removeChild(completeTable.childNodes[loop]);
      }
    }
}

function appendEmployee(firstName,lastName,employeeId) {
    var firstNameCell;
    var lastNameCell;
    var row;
    var nameCell;
    if (isIE) {
        row = completeTable.insertRow(completeTable.rows.length);
        nameCell = row.insertCell(0);
    } else {
        row = document.createElement("tr");
        nameCell = document.createElement("td");
        row.appendChild(nameCell);
        completeTable.appendChild(row);
    }
    row.className = "popupRow";
    nameCell.setAttribute("bgcolor", "#FFFAFA");

    
    var linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "autocomplete?action=lookup&id=" + employeeId);
    linkElement.appendChild(document.createTextNode(firstName + " " + lastName));
    nameCell.appendChild(linkElement);
}
</script>

 <title>Auto-Completion using Asynchronous JavaScript and XML (AJAX)</title>
</head>
 <body onload="init()">
 
 <h1>Auto-Completion using AJAX</h1>
 <hr/>

 
  <form name="autofillform" action="autocomplete" method="get">
   <input type="hidden" name="action" value="lookupbyname"/>
   <table border="0" cellpadding="5" cellspacing="0">
    <tr>
     <td><b>Employee Name:</b></td>
     <td>
      <input    type="text"
                size="20"
                autocomplete="off"
                  id="complete-field"
				name="id"
             onkeyup="doCompletion();">
     </td>

    </tr>
    <tr><td id="auto-row" colspan="2">&nbsp;<td/></tr>
   </table>
  </form>
 <div style="position: absolute; top:170px;left:140px" id="menu-popup">
 <table id="completeTable" border="1" bordercolor="black" cellpadding="0" cellspacing="0" />
 </div>
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
