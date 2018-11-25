<html>
<head>
	<script>
	function checkNumerals( obj )
	{
		var key;
		if (window.event)
			key = window.event.keyCode;
		if(key == 13)
		{
			
			document.inputForm.submit();
		}
		if((key<48 || key>57 || key==32))
			return false;
		else
			return true;
	}
	</script>
	<body>
		
			<form name="inputForm" action="test.do" method="POST">
				<table>
					<tr>
						<td>
							Please enter the total no of records: <input type="text" name="inputText" onkeypress="return checkNumerals(this)">
						</td>
					</tr>

					<tr>
						<td>
							<input type="submit" value="Test">
						</td>
					</tr>
				</table>
			</form>

	</body>
</head>
</html>