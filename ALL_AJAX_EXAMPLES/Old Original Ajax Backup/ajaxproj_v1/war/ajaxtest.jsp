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
				if( window.XMLHttpRequest )
				{
					req = new XMLHttpRequest();
				}
				else if( window.ActiveXObject )
				{
					req = new ActiveXObject( "Microsoft.XMLHTTP" );
				}
				req.open("Get",url,true);
				req.onreadystatechange = callback;
				req.send(null);
			}

			function callback()
			{
				if( req.readyState == 4 )
				{
					if( req.status == 200 )
					{
						var decimal = document.getElementById('decimal');
						decimal.value = req.responseText;
					}
				}
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
					Decimal
				</td>
				<td>
					<input type="text" readonly id="decimal">
				</td>
			</tr>
		</table>
	</body>
</html>