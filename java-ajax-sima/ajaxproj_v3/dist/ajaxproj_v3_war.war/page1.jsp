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
				if( window.XMLhttpRequest )
				{
					return new XMLHttpRequest();
				}
				//For Microsoft Internet Explorer
				else if( window.ActiveXObject )
				{
					return new ActiveXObject( "Microsoft.XMLHTTP" );
				}
				else
				{
					alert("Your browser does not support ajax, please upgrade your browser");
				}
			}
			var req = getXMLHttpRequestObject();
			function getMessage()
			{
				var key = document.getElementById("nameid");
				var url = "/ajaxproj_v3/response?name="+escape(key.value);
				//For other browsers except for Microsoft Internet Explore IE
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
						var dummyval = document.getElementById("sid");					
						dummyval.innerHTML = req.responseText;
					}
				}
								
			}
									
		</script>
	</head>
	<body>
		<br>
		<table>

			<tr>
				<td>
					Please Enter your Name: 
				</td>
				<td>
					<input type="text" id="nameid" name="key;">
				</td>
							
				<td>
					<input type="button" name="PressButton" value="Press Here" id="btnid" onclick="getMessage();">
				</td>
			</tr>
		</table>
		<table>		

			<tr>
				<td>
					Comments from AJAX
				</td>
				<td>
					<b><span id="sid"></span></b>
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