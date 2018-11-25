function loadScript(scriptURL)
{
	var newScript = document.createElement("script");
	newScript.src = scriptURL;
	document.body.appendChild(newScript);
}


function loadData(URL)
{
	xmlReq = getXmlHttpRequestObject;
// Anonymous function to handle changed request states
	if (xmlReq.readyState == 4 || xmlReq.readyState == 0) 
	{
		alert("I am here");
		xmlReq.open ('GET', URL, true);
		xmlReq.onreadystatechange = handleRequest(xmlReq); 
		xmlReq.send (null);
	}

}

function handleRequest(receiveReq) 
{
	//Check to see if the XmlHttpRequests state is finished.
	alert(receiveReq.readyState);
	if (receiveReq.readyState == 4) 
	{	
		var str = receiveReq.responseXML.getElementsByTagName('quote')[0].firstChild.data
		
		doSomethingWithData(receiveReq.responseXML.getElementsByTagName('quote')[0].firstChild.data);
	}
}
function getXmlHttpRequestObject() 
{
	if (window.XMLHttpRequest) 
	{
		//For others except for Microsoft Internet Explorer IE
		return new XMLHttpRequest(); 
	}
	else if(window.ActiveXObject) 
	{
		//Object specific to Microsoft Internet Explorer IE
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else 
	{
		alert("Your current browser doesn't support the Ajax application.");
	}
}			
