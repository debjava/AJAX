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
		<script>
			
			function getXMLHttpRequestObject()
			{
				//For other browsers
				if( window.XMLHttpRequest )
				{
					return new XMLHttpRequest();
				}
				//For Microsoft Internet Explorer IE
				else if( window.ActiveXObject )
				{
					return new ActiveXObject( "Microsoft.XMLHTTP" );
				}
			}

			var req = getXMLHttpRequestObject();

			function convertToDecimal()
			{
				var firstno = document.getElementById("firstno");
				var secondno = document.getElementById("secondno");
				var result = document.getElementById("addition_result");
				var url = "/ajaxproj_v13/response?firstno="+escape(firstno.value)+"&secondno="+escape(secondno.value);		
				req.open("Get",url,true);
				req.onreadystatechange = handleRequest;
				req.send(null);
			}

			function handleRequest()
			{
				if( req.readyState == 4 )
				{
					if( req.status == 200 )
					{
						var result = document.getElementById('addition_result');
						result.value = req.responseText;
					}
				}
								
			}

			function validate(test)
			{
				try
				{
					eval(test.value);
										
				}
				catch (e)
				{
					alert("An error occured");
					clear();
				}
			}

			function clear()
			{
				var firstno = document.getElementById("firstno");
				var secondno = document.getElementById("secondno");
				var resultText = document.getElementById("addition_result");
				firstno.value="";
				secondno.value="";
				resultText.value="";
			}
		</script>
	</head>
	<body>
		<h1>An application in AJAX.</h1>
		<h2>It displays the addition of two nos number entered by you</h2>
		<table>

			<tr>
				<td>
					Enter first no : 
				</td>
				<td>
					<input type="text" id="firstno" name="firstno" onBlur="validate(firstno)">
				</td>
			</tr>

			<tr>
				<td>
					Enter second no:
				</td>
				<td>
					<input type="text" id="secondno" name="secondno" onBlur="validate(secondno)">
				</td>
			</tr>

			<tr>
				<td>
					Addition of two no
				</td>
				<td>
					<input type="text" readonly id="addition_result">
				</td>
			</tr>
			<tr>
				<td> <input type ="button" value="Add" onclick="convertToDecimal()"> </td>
			</tr>
		</table>
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