<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri= "struts-html.tld" prefix= "html" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="timesheet.tld" prefix="timesheet"%>
<html>
<head><title>Employee Salary Details</title>

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
<BODY ID="Bdy" bgColor=aliceblue >

<fmt:bundle basename="messages.MessageResources">
<html:form action="/employeesalarydetailsnew?title=EmployeeSalaryNew" method="post" onsubmit="return validateEmployeeSalaryDetailsForm(this);">
<!-- Header  -->
<p>
<html:errors/>
</p>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="header" style="font-family:sans-serif" style="font-size:80%">
<tr bgcolor="#17266D" width="100%"height="30">  
<td>&nbsp;</td>
 <td align="center" height="30"><p class="heading1"><strong><fmt:message key="employee_salary_details"/></strong></p></td>
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
<table bgcolor="#F2F2F2" width="750" height="300" align="center" cellpadding="3"> 
 <tr height="70">
 	
						<td><p class="title">Employee No <span class="asterisk">*</span>:</p></td>
<timesheet:dropDown var="emplist" scope="page" key="EMP"/>
<td align="left"><html:select property="employeeNo" styleId="employeeNo" onchange="getajax();salary();">
<option value="">Select</option>
<c:forEach items="${emplist}" var="employee">
<option value ="<c:out value="${employee.key}"/>"><c:out value="${employee.value}"/></option>
</c:forEach></html:select>
</td>
						<td><p class="title">Employee Name <span class="asterisk">*</span>:</p></td>
 <td>
 <html:text  property="employeeName" styleId="employeeName" />
						</td>
							

</tr>
<tr>

						<td><p class="title">Start Date <span class="asterisk">*</span>:</p></td>
				<td  align="left">
					<html:text property="date" size ="7" styleId="workorderDate" onkeypress="numcheck(this.value,'YYYY-MM-DD')" onkeyup="return mask(this.value,this,'YYYY-MM-DD');" onblur="DateFormat(this,this.value,event,true,'YYYY-MM-DD'); return mask(this.value,this,'YYYY-MM-DD');" />
					<A title="Click for Calender" class="ahand" id="calendar"><img id="stdate_trigger" height=21 src="images/cal_img.gif" width=20 align=absMiddle border=0></A>
				</td>
				
						<td><p class="title">Amount<span class="asterisk">*</span>:</p></td>
						
					<td><html:text property="grosssalaryperMonth" styleId="grosssalaryperMonth" onkeypress="return blockNonNumbers(this, event);"/>
</td>	
						
						
	</tr>		
						

	
				
<tr>
 
					<td><p class="title">Currency<span class="asterisk">*</span>:</p></td>	
						<td>
					<timesheet:dropDown var="curList" scope="page" key="CURRENCY1"/>
									<select  name= "currency"  styleClass="curList" >
										<option value="">Select</option>
										<c:forEach items="${curList}" var="cur">
										<option value ="<c:out value="${cur.key}"/>"><c:out value="${cur.value}"/></option>
										</c:forEach>
									</select> 
				</td>
					<input type="hidden" name="checkValue" value="N"/>
					<!--<td  ><p class="login_userpass"><p class="title">Check Value:</p></td>	
<td><input type="checkbox" class="clsInput-Checkbox"  id="checkDelete" value="dontCheck" name="checkDelete"></td>
<input type="hidden" name ="checkValue"/>

</td>-->
							</tr>
							
<tr><td align="right" STYLE="color:#17266D;font-size=14"></td>
<td><html:submit property="submit" value="Save"  onclick="return check();"></html:submit></td></tr>
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

</html:form>
</fmt:bundle>
<c:set var="date_format" value="${'%Y-%m-%d'}"/>
<c:set var="check" value="0"/>
<script language="JavaScript" type="text/javascript">
	Calendar.setup({
        inputField     :  "date",      // id of the input field
        ifFormat       :  "<c:out value='${date_format}'/>", // format of the input field
        showsTime      :  false,            // will display a time selector
        button         : "stdate_trigger",   // trigger for the calendar (button ID)
        singleClick    :  true,           // double-click mode
        step           :  1                // show all years in drop-down boxes (instead of every other year as default)
    });
	
	

    </script>
    <script>
function check()
{
	
	
	var employeeNo=document.getElementById('employeeNo').value;
	
	var startDate=document.getElementById('date').value;
var amount=document.getElementById('grosssalaryperMonth').value;
var currency=document.getElementById('currency').value;
	
	if(employeeNo==""||startDate==""||amount==""||currency=="")
	{
		alert("please enter mandatory fields");
		return false;
	}
	
	
}


var str1=""
var arr1="";
function responseFromAjaxcal(result1)
{
	
	str1=result1;
	str1 = str1.replace(/^\s*|\s*$/g,"");
   

}
function getajax(){
	
	
	var employeeNo=document.getElementById('employeeNo').options[document.getElementById('employeeNo').selectedIndex].value;;;
	
	
    callEmpName(employeeNo);
	document.getElementById('employeeName').value=str1;

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
function callEmpName(employeeNo)
{
 
  var actionclass='';
	
  actionclass="getEmplyeeNameAction.do?employeeNo="+employeeNo;
 
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
  processResponse1(xmlRequest.responseText);
}
function processResponse1(result1)
{
  responseFromAjaxcal(result1);   
}
var str=""
var arr="";
function responseFromAjax(result)
{
	
	str=result;
	str = str.replace(/^\s*|\s*$/g,"");
	

}
function salary(){
	

	var employeeNo=document.getElementById('employeeNo').options[document.getElementById('employeeNo').selectedIndex].value;
      
    callSalary(employeeNo);
	var e1=document.getElementById('currecny');
	var arr = str.split(",");
	if(str.length==11)
	{
		var arr = str.split("~");
		document.getElementById('date').value=arr[0];
		document.getElementById('grosssalaryperMonth').value="";
		document.getElementById('currency').value="";
	}
		
 
	else
	{
			var arr = str.split("~");
		
		document.getElementById('date').value=arr[0];
        document.getElementById('grosssalaryperMonth').value=arr[1];
		document.getElementById('currency').value=arr[2];
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
function   callSalary(employeeNo)
{

  var actionclass='';
	
  actionclass="getSalaryAction.do?employeeNo="+employeeNo;
 
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
function putCursor()
{

	document.getElementById("endDate").focus();
}
function putCursor1()
{

	document.getElementById("startDate").focus();
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
 
function chec()
{
	var num=document.getElementById('number').value;
   document.getElementById('internalreferenceNo').value=num;
}

</script>
</body>
</html>