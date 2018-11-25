<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>

<html:html locale="true">
<head>
<title>Struts Ajax Example</title>
<html:base/>
</head>
<body>


<!-- New - Make the Ajax javascript available -->
<script type="text/javascript" src="Ajax.js"></script>


	<h3>Ajax Struts Sample</h3>
	Change the values true / false to see the form fields show & hide dynamically

<!-- Struts Automatically uses same name as FormBean from struts-config.xml-->
<html:form action="/sampleajax" >
	
	<!-- Sample Form Values -->
	<table>
		<tr>
			<td>Show Green </td>
			<!-- New Javascript event attached-->
			<td><html:text property="showGreen" onchange="retrieveURL('/struts-ajax/sampleajax.do?ask=COMMAND_NAME_1','inputForm');"/></td>
		</tr>
		<tr>
			<td>Show Blue </td>
			<!-- New Javascript event attached-->
			<td><html:text property="showBlue" onchange="retrieveURL('/struts-ajax/sampleajax.do?ask=COMMAND_NAME_1','inputForm');"/></td>
		</tr>
	</table>
	
		<!-- Check if we need to show blank tags or filled in data --> 
	 	<logic:equal parameter="showGreen" value="true">
	 				
					<!-- Return content if requested-->
					<span id="theTable1">
					<table border="1" bgcolor ="green">
						<tr>
							<td>Table 1 : Header 1</td>
							<td>Table 1 : Header 2</td>
						</tr>
						
						<tr>
							<td>Table 1 : block 1</td>
							<td>Table 1 : block 2</td>
						</tr>
						
					</table>
					 
					</span>
	 
     	</logic:equal>

        <logic:notEqual parameter="showGreen" value="true">
		
			<!-- Default Return Blank -->
			<span id="theTable1"></span>

        </logic:notEqual>
        

	<!-- Check if we need to show blank tags or filled in data --> 
	 	<logic:equal parameter="showBlue" value="true">
	 
				
					<!-- Return content if requested-->
					<span id="theTable2">
					<table border="1" bgcolor ="blue">
						<tr>
							<td>Table 2 : Header 1</td>
							<td>Table 2 : Header 2</td>
						</tr>
						
						<tr>
							<td>Table 2 : block 1</td>
							<td>Table 2 : block 2</td>
						</tr>
						
					</table>
					</span>
     	</logic:equal>
        <logic:notEqual parameter="showBlue" value="true">
			<!-- Default Return Blank -->
			<span id="theTable2"></span>
        </logic:notEqual>
	<html:submit/>
</html:form>
</body>
</html:html>