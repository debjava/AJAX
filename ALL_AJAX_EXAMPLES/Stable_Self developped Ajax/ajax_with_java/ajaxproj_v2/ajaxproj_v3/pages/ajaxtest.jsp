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
			function getMessage()
			{
				var key = document.getElementById("nameid");
				var url = "/ajaxproj_v3/response?name="+escape(key.value);
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
						var dummyval = document.getElementById("sid");					
						dummyval.innerHTML = req.responseText;
					}
				}
								
			}
									
		</script>
	</head>
	<body>
		Project Name is ajaxproj_v3.
		<br>This application has been developped by Debadatta Mishra for learning purpose.</br>
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
	</body>
</html>