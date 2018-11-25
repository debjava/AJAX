/*
* It obtains the browser specific
* XMLHttpRequest object.
*/
function getXmlHttpRequestObject() 
{
	if (window.XMLHttpRequest) 
	{
		return new XMLHttpRequest();
	}
	else if(window.ActiveXObject) 
	{
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	else 
	{
		alert("Your Browser Sucks!\nIt's about time to upgrade don't you think?");
	}
}

//Our XmlHttpRequest object to get the auto suggest
var searchReq = getXmlHttpRequestObject();

//Called from keyup on the search textbox.
//Starts the AJAX request.
function searchSuggest() {
	if (searchReq.readyState == 4 || searchReq.readyState == 0) 
	{
		var str = escape(document.getElementById('txtSearch').value);
		searchReq.open("GET", 'temp1.xml?getvalue=' + str, true);
		searchReq.onreadystatechange = handleSearchSuggest; 
		searchReq.send(null);
	}		
}

//Called when the AJAX response is returned.
function handleSearchSuggest() {
	if (searchReq.readyState == 4) {
		var ss = document.getElementById('search_suggest');
		ss.innerHTML = '';
	
		var str = searchReq.responseText.split("\n");
		for(i=0; i < str.length - 1; i++) 
		{	
			var suggest = '<div ';	
			suggest += 'onclick="javascript:setSearch(this.innerHTML);" ';
			suggest += str[i] + '</div>';
			ss.innerHTML += suggest;
		}
	}
}

//Click function
function setSearch(value) 
{
	document.getElementById('txtSearch').value = value;
	document.getElementById('search_suggest').innerHTML = '';

	
}