<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri= "struts-html.tld" prefix= "html" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="timesheet.tld" prefix="timesheet"%>
<html>
<head><title>Invoice Details</title>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/Heading.css" rel="stylesheet" type="text/css">
<link href="css/MiddleHeading.css" rel="stylesheet" type="text/css">
<link href="css/head.css" rel="stylesheet" type="text/css">
<link href="css/CascadeMenu.css" rel="stylesheet" type="text/css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="calender/theme.css">
<link type="text/css" rel="stylesheet" href="css/title.css">
<script language="javascript" type="text/javascript" src="javascript/CascadeMenu.js"></script>

<script src="calender/date.js" type="text/javascript" language="javascript"></script>
<script src="calender/calendar.js" type="text/javascript" language="javascript"></script>
<script src="calender/calendar-en.js" type="text/javascript" language="javascript"></script>
<script src="calender/calendar-setup.js" type="text/javascript" language="javascript"></script>
<script language="javascript" type="text/javascript" src="js/TimesheetDateCheck.js"></script>

</head>
<BODY ID="Bdy" bgColor=aliceblue>
<fmt:bundle basename="messages.MessageResources">
<html:form action="/invoicedetailsnew?title=InvoiceNew" method="post" onsubmit="return validateInVoiceDetailsForm(this);">
<!-- Header  -->
<p>
<html:errors/>
</p>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="header" style="font-family:sans-serif" style="font-size:80%">
<tr bgcolor="#17266D" width="100%"height="30">  
<td>&nbsp;</td>
 <td align="center" height="30"><p class="heading1"><strong><fmt:message key="invoice"/></strong></p></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="header" style="font-family:sans-serif" style="font-size:80%">
<jsp:include page="menu.jsp"/>
<td valign="top">
<table border="0"  height="63"cellpadding="0" cellspacing="0" width="100%" style="font-family:sans-serif" style="font-size:100%">
 <jsp:include page="logo.jsp"/>
<table border="0" cellpadding="0" cellspacing="8" width="100%" style="font-family:sans-serif" style="font-size:100%">					   
<!--<tr><td align="center" width="280" STYLE="text-decoration:none;color:#17266D;font-size=16"><strong> Designation </td></tr>-->
 </table>
 <table bgcolor="#F2F2F2" width="750" height="20" align="center" cellpadding="3"> 
 <tr><td  STYLE="color:red;font-size=12">
 <c:choose>
<c:when test="${not empty requestScope.Errorlist}">
<c:forEach var="list" items="${requestScope.Errorlist}">
<li><c:out value="${list}"/></li>
</c:forEach>
</c:when>
<c:otherwise>
</c:otherwise>
</c:choose></td></tr>
</table>

 <table bgcolor="#F2F2F2" width="750" height="300" align="center" cellpadding="3" style="font-family:sans-serif" style="font-size:100%" >  
 <tr height="70">
 <tr >
 <td><p class="title">Project Id <span class="asterisk">*</span>:</p></td>
<timesheet:dropDown var="projectlist" scope="page" key="PROJECT"/>
<td align="left"><html:select property="projectId" onchange="workordervalue();">
<option value="">Select</option>
<c:forEach items="${projectlist}" var="proj">
<option value ="<c:out value="${proj.key}"/>"><c:out value="${proj.value}"/></option>
</c:forEach></html:select>
</td>
<td><p class="title">Work Order No<span class="asterisk">*</span>:</p></td>
			
<td align="left"><html:select property="workorderNo">
<option value="">Select</option>
</html:select>
</td>
				</tr>
				<tr>
				<td><p class="title">Internal Reference No <span class="asterisk">*</span>:</p></td>

<timesheet:dropDown var="reference" scope="page" key="INVOICEREFERENCENO"/>
 <td><strong>
 <c:forEach items="${reference}" var="ref">
<b><c:out value='${ref.value}'/></b>
	<input type="hidden" name="internalreferenceNo" value = "<c:out value="${ref.value}" />" >
 </c:forEach>
						</strong></td>
 	<td><p class="title">Invoice No <span class="asterisk">*</span>:</p></td>
 <td>
 <html:text  property="invoiceNo" styleId="invoiceNo" maxlength="15"/>
						</td>
						</tr>
						<tr>
						<td><p class="title">Invoice Date:</p></td>
						<td  align="left">
					<html:text property="invoiceDate" size ="7" styleId="invoiceDate" onkeypress="numcheck(this.value,'YYYY-MM-DD')" onkeyup="return mask(this.value,this,'YYYY-MM-DD');" onblur="DateFormat(this,this.value,event,true,'YYYY-MM-DD'); return mask(this.value,this,'YYYY-MM-DD');" />
					<A title="Click for Calender" class="ahand" id="calendar"><img id="stdate_trigger" height=21 src="images/cal_img.gif" width=20 align=absMiddle border=0></A>(YYYY-MM-DD)
				</td>
				
				<td><p class="title">Particulars:</p></td>
 <td>
 <html:text  property="particulars" styleId="particulars" />
						</td>
						</tr>
						
						
					<tr>
	<td><p class="title">Invoice Value :</p></td>
				<td  align="left">
					<html:text  property="invoiceValue" styleId="invoiceValue" onkeypress="return blockNonNumbers(this, event);"/>
				</td>
				
					<td><p class="title">Currency:</p></td>	
						<td>
					<timesheet:dropDown var="curList" scope="page" key="CURRENCY"/>
									<select  name= "currency"  styleClass="curList" >
										<option value="">Select</option>
										<c:forEach items="${curList}" var="cur">
										<option value ="<c:out value="${cur.key}"/>"><c:out value="${cur.value}"/></option>
										</c:forEach>
									</select> 
				</td>
	
</tr>
<tr>
<td><p class="title">Softex Form No :</p></td>
				<td  align="left">
					<html:text  property="softexformNo" styleId="softexformNo" />
				</td>
							<td width="15%"><p class="title">Softex Form Date :</p></td>
							<td  align="left">
								<html:text property="softexformDate" size ="9" styleId="softexformDate" onkeypress="numcheck(this.value,'YYYY-MM-DD')" onkeyup="return mask(this.value,this,'YYYY-MM-DD');" onblur="DateFormat(this,this.value,event,true,'YYYY-MM-DD'); return mask(this.value,this,'YYYY-MM-DD');" />
								<A title="Click for Calender" class="ahand" id="calendar"><img id="stdate_trigger1" height=21 src="images/cal_img.gif" width=20 align=absMiddle border=0></A>(YYYY-MM-DD)
							</td>
							
						</tr>
						<tr>
						
						
							<td width="15%"><p class="title">Softex Form Submitted to Bank On date:</p></td>
							<td  align="left">
								<html:text property="softexformsubmittedOndate" size ="9" styleId="softexformsubmittedOndate" onkeypress="numcheck(this.value,'YYYY-MM-DD')" onkeyup="return mask(this.value,this,'YYYY-MM-DD');" onblur="DateFormat(this,this.value,event,true,'YYYY-MM-DD'); return mask(this.value,this,'YYYY-MM-DD');" />
								<A title="Click for Calender" class="ahand" id="calendar"><img id="stdate_trigger2" height=21 src="images/cal_img.gif" width=20 align=absMiddle border=0></A>(YYYY-MM-DD)
							</td>
						
					<input type="hidden" name="mode" value="N"/>
				<!--  	<td width="15%"><p class="title">Component Type<span class="asterisk">*</span>:</p></td>
					<td STYLE="color:#17266D;font-size=13"><input type="radio" name="type" id="Fixed"  value="F"  onclick="check123(this);" />Fixed
						<input type="radio" name="type" id="TandMComponent" value="T" onclick="check123(this);" />TandMComponent</td>-->
					</tr>
						
<tr><td align="right" STYLE="color:#17266D;font-size=14"></td>
<td><html:submit property="submit" value="Save"  ></html:submit></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<tr><td>&nbsp;</td></tr>
<table align="left"width="100%" border="0" cellpadding="0" cellspacing="0" class="header" style="font-family:sans-serif" style="font-size:80%">
<tr><td>&nbsp;</td></tr>
<tr height="0"><td>&nbsp;</td></tr>
			<tr bgcolor="#17266D" width="100%"height="30">  
        <td align="center"  width="100%" height="30"><p class="footer"><strong> Copyright © 2007 IDEAL INVENT Technologies Pvt. Ltd.</strong></p></td>
			</tr>
</table>
<html:javascript formName="InVoiceDetailsForm"/>
</html:form>
</fmt:bundle>
<c:set var="date_format" value="${'%Y-%m-%d'}"/>
<script language="JavaScript" type="text/javascript">
	Calendar.setup({
        inputField     :  "invoiceDate",      // id of the input field
        ifFormat       :  "<c:out value='${date_format}'/>", // format of the input field
        showsTime      :  false,            // will display a time selector
        button         : "stdate_trigger",   // trigger for the calendar (button ID)
        singleClick    :  true,           // double-click mode
        step           :  1                // show all years in drop-down boxes (instead of every other year as default)
    });
    
  
	Calendar.setup({
      inputField     :  "softexformDate",      // id of the input field
        ifFormat       :  "<c:out value='${date_format}'/>", // format of the input field
         showsTime      :  false,            // will display a time selector  
        button         : "stdate_trigger1",   // trigger for the calendar (button ID)
        singleClick    :  true,           
        step           :  1               
    });

	Calendar.setup({
        inputField     :  "softexformsubmittedOndate",      // id of the input field
        ifFormat       :  "<c:out value='${date_format}'/>", // format of the input field
        showsTime      :  false,            // will display a time selector
        button         : "stdate_trigger2",   // trigger for the calendar (button ID)
        singleClick    :  true,           // double-click mode
        step           :  1                // show all years in drop-down boxes (instead of every other year as default)
    });
    </script>
    <script>
function check()
{
var projectId=document.getElementById('projectId').value;

var internalreferenceNo=document.getElementById('internalreferenceNo').value;

var invoiceNo=document.getElementById('invoiceNo').value;
var workorderNo=document.getElementById('workorderNo').value;
	if(projectId==""||internalreferenceNo==""||invoiceNo==""||workorderNo=="")
	{
		alert("Please enter mandatory fields");
		return false;
	}
}
function check123(obj)
{
var radiovalue=obj.value;
alert(radiovalue);
document.getElementById('componentType').value=radiovalue;
alert(document.getElementById('componentType').value);
}
function blockNonNumbers(obj, e)
{
	var objId;
    if (obj != null) {

      objId = obj;

    } else {

      objId = this;
	  
    }
	//alert(objId);
	var key;
	var isCtrl = false;
	var keychar;
	var reg;
	var e=window.event;
	if(window.event) {
		key = e.keyCode;
		//alert(key);
		isCtrl = window.event.ctrlKey
	}
	else if(e.which) {
		key = e.which;
		isCtrl = e.ctrlKey;
	}
	
	if (isNaN(key)) return true;
	
	keychar = String.fromCharCode(key);
	
	// check for backspace or delete, or if Ctrl was pressed
	if (key == 8 || isCtrl)
	{
		return true;
	}

	reg = /\d/;
	var isFirstN = false ? keychar == '-' && objId.value.indexOf('-') == -1 : false;
	var isFirstD = true ? keychar == '.' && objId.value.indexOf('.') == -1 : false;
	
	return isFirstN || isFirstD || reg.test(keychar);
}
 var str = "";

function responseFromAjax(result)
{
	
	str=result;
	str = str.replace(/^\s*|\s*$/g,"");
	
}




//Ajax  Call For getting Property Value Basing On Property Id
function workordervalue()
{
	
	
	

    var projectId=document.getElementById('projectId').options[document.getElementById('projectId').selectedIndex].value;
	
	callworkordervalue(projectId);
	str=str.replace("{","");
	str=str.replace("}","");
	var arr = str.split("~");
 
	var length1=arr.length;
	if(arr.length==1)
	{
		alert("No workorder is there for this project");
	}
	var el=document.getElementById('workorderNo');
	el.length=0;
    el.options[0] = new Option("Select","");
	for(var i=0;i<length1;i++)
	{
		
		
		if(arr[i]!="")
		{
          
		  var j=i+1;
		  
		
		
		el.options[j] = new Option(arr[i],arr[i]);
        
	          }
	
	}
	
}

function getXMLHTTP()
{	
	try
	{
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	catch (e2)
	{
		return new XMLHttpRequest();
	}
}
function getXMLDocument()
{
	try
	{
		return new ActiveXObject("Microsoft.XMLDOM");
	}
	catch (e2)
	{
		return XMLDocument();
	}
}

function callworkordervalue(projectId)
{

  var actionclass='';
	
  actionclass="getAjaxWorkOrderAction.do?projectId="+projectId;
 
  var xmlRequest =getXMLHTTP();
  xmlRequest.Open("POST",actionclass,false);
  xmlRequest.SetRequestHeader("Content-Type", "text/xml; charset:ISO-8859-1;");
  xmlRequest.Send();

  if(xmlRequest.status!=200)
  alert(xmlRequest.status + ": " + xmlRequest.statusText + "\n\n" + xmlRequest.responseText);

  var xmlResponse = getXMLDocument();
  xmlResponse.async = false;

 //alert(xmlRequest.responseXML.xml)
  
  //xmlResponse.loadXML(xmlRequest.responseXML.xml);
  
  if(xmlResponse.parseError.errorCode != 0)
  alert("Error in response:\n " + xmlResponse.parseError.errorCode + ":  " + xmlResponse.parseError.reason);
  else
  processResponse(xmlRequest.responseText);
}
function processResponse(result)
{
   responseFromAjax(result);   
}

 
</script>
</body>
</html>