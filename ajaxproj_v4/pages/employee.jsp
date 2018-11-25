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
<%@ taglib prefix="c" uri="/WEB-INF/c.tld" %>
<html>
<head>
</head>
<body>
 <h1>Employee Information</h1>
 <hr/>
 <p>
  First Name: ${requestScope.employee.firstName}.
  First :${requestScope.FIRSTNAME}
 </p>
 <p><c:out value="${requestScope.employees}"/></p>
 <p>
  Last Name:${requestScope.employee.lastName}.
 </p>
 <p>
  Id:${requestScope.employee.id}.
 </p>
 <p>
  <a href="page1.jsp">Go back to the application home</a>.
 </p>
 </body>
</html>

