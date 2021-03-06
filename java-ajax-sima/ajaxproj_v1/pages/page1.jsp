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
			var req;
			function convertToDecimal()
			{
				var key = document.getElementById("key");
				var keypressed = document.getElementById("keypressed");
				keypressed.value = key.value;
				var url = "/ajaxproj_v1/response?key="+escape(key.value);
				//For other browsers except for Microsoft Internet Explore IE
				if( window.XMLHttpRequest )
				{
					req = new XMLHttpRequest();
				}
				//For Microsoft Internet Explorer IE
				else if( window.ActiveXObject )
				{
					req = new ActiveXObject( "Microsoft.XMLHTTP" );
				}
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
						var decimal = document.getElementById('decimal');
						decimal.value = req.responseText;
					}
				}
				//Clear the text box
				clear();
			}

			function clear()
			{
				var key = document.getElementById("key");
				key.value="";
			}
		</script>
	</head>
	<body>
		<h1>An application in AJAX.</h1>
		<h2>It displays the ASCII value of the number entered by you</h2>
		<table>

			<tr>
				<td>
					Type the chracter here : 
				</td>
				<td>
					<input type="text" id="key" name="key" onkeyup="convertToDecimal();">
				</td>
			</tr>

			<tr>
				<td>
					you have pressed the key
				</td>
				<td>
					<input type="text" readonly id="keypressed">
				</td>
			</tr>

			<tr>
				<td>
					Decimal Value
				</td>
				<td>
					<input type="text" readonly id="decimal">
				</td>
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