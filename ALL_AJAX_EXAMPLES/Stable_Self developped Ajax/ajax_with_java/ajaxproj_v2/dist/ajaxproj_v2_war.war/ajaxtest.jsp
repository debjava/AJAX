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

			function getSelectedValue()
			{
				var key = document.getElementById("key");
				var keypressed = document.getElementById("keypressed");
				var keyLength = key.value.length;
				if( keyLength > 1 )
				{
					keypressed.value="";
					alert("You have to enter only one character");	
					clear();
				}
				else
				{
					keypressed.value = key.value;
				}
				
			}

			function clear()
			{
				var key = document.getElementById("key");
				key.value="";
			}
			
		</script>
	</head>
	<body>
		<table>

			<tr>
				<td>
					Type the chracter here : 
				</td>
				<td>
					<input type="text" id="key" name="key" onkeyup="getSelectedValue();">
				</td>
			</tr>

			<tr>
				<td>
					you have pressed the key
				</td>
				<td>
					<input type="text" readonly id="keypressed" >
				</td>
			</tr>

			<tr>
				<td>
					Decimal Value
				</td>
				<td>
					<input type="text" readonly id="decimal">
				</td>
				<td>
					<input type="button" name="PressButton" value="Press Here" id="btnid" onclick="convertToDecimal();">
				</td>
			</tr>
		</table>
	</body>
</html>