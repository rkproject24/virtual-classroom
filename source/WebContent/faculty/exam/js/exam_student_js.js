
function createObject()
{
var xmlHttp;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
 return xmlHttp;
 }

	var http = createObject();

	var nocache = 0;

function display(str) 
{
	document.getElementById('inner_response').innerHTML = "Just a second..."
	
	
	var str1 = encodeURIComponent(str);
	nocache = Math.random();
	
	document.write(str);
	http.open('get', 'post_exam_student.jsp?str = ' + str1 + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function insert() 
{
	
	document.getElementById('inner_response').innerHTML = "Just a second..."
	
	var quesno= encodeURIComponent(document.getElementById('quesno').value);
	var ques= encodeURIComponent(document.getElementById('ques').value);
	
	var ans = encodeURIComponent(document.getElementById('answer').value);
	
	nocache = Math.random();
	
	http.open('get', 'post_exam_soln.jsp?quesno='+quesno+'&ques=' +ques+'&ans=' + ans + '&nocache='+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}

function insertReply() {
	if(http.readyState == 4){
	var response = http.responseText;
	document.getElementById('inner_response').innerHTML = 'next please'+response;
}
}