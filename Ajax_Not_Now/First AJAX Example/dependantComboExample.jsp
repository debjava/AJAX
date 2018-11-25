<%@page import="ajaxsample.SampleForm,java.util.*"%>
<%@include file="taglibs.jsp"%>
<%@ taglib uri="struts-html.tld" prefix="html" %>

<head>

<script>
var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}

function doRequestUsingGETCountry(url) {
   
    createXMLHttpRequest();
    queryString =   url ;
    queryString = queryString + "&selcountry="+document.forms[0].country.options[document.forms[0].country.selectedIndex].value;
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", queryString, true);
    xmlHttp.send(null);
}

function handleStateChange() {
    if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
          parseResults();
        }
    }
}
function parseResults() {
            var responseText = document.createTextNode(xmlHttp.responseText);
            var returnElements=xmlHttp.responseText.split("||");
          //Process each of the elements 	
          for ( var i=0; i<returnElements.length; i++ ){
             
             if(returnElements[i]!="")
            {
             valueLabelPair = returnElements[i].split(";")
             document.getElementById('state').options.length= returnElements.length;     
             document.getElementById('state').options[i] = new Option(valueLabelPair[0], valueLabelPair[1]);
            } 
        }
}
		function inc(filename)
		{
		var body = document.getElementsByTagName('body').item(0);
		script = document.createElement('script');
		script.src = filename;
		script.type = 'text/javascript';
		body.appendChild(script)
		}
</script>


</head>

<body onLoad="doRequestUsingGETCountry('/struts-ajax/DependantComboExample.do?');">

<html:form action="DependantComboExample.do" >

  <h1></h1>
  <table>
    <tbody>
        <tr>
            <td>Country</td>
              <td>
                <html:select property="country" name="inputForm" onchange="doRequestUsingGETCountry('/struts-ajax/DependantComboExample.do?');">
                    <html:options collection="countries" property="value" labelProperty="label"/>
                </html:select>
               </td>
               <td>
               <html:select property="state" name="inputForm" >
                    <html:options collection="states" property="value" labelProperty="label" />
                </html:select>                  
               </td>
        </tr>
    </tbody>
  </table>
  
</html:form>
</body>
