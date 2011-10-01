
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

function insert(str) 
{
	document.getElementById('insert_response').innerHTML = "Just a second...";
	
	var quesno= encodeURIComponent(document.getElementById('quesno').value);
	var ques= encodeURIComponent(document.getElementById('ques').value);
	var str1 = encodeURIComponent(str);
	nocache = Math.random();
	
	http.open('get', 'post_exam.jsp?quesno='+quesno+'&ques=' +ques+'&mode=' + str1 + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function update() 
{
	
	document.getElementById('insert').innerHTML = "Just a second..."
	
	var quesno= encodeURIComponent(document.getElementById('quesno1').value);
	var ques = encodeURIComponent(document.getElementById('ques1').value);
	var marks = encodeURIComponent(document.getElementById('marks1').value);
	var oldmarks = encodeURIComponent(document.getElementById('oldmarks').value);
	
	nocache = Math.random();
	
	http.open('get', 'exam_post1.jsp?quesno='+quesno+'&ques=' +ques+ '&marks=' + marks + '&oldmarks=' + oldmarks + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function insert1(i) 
{
	document.getElementById('insert_response').innerHTML = "Just a second..."
	
	
	var i1 = encodeURIComponent(i);
	nocache = Math.random();
	
	http.open('get', 'exam_post1.jsp?i1='+ i1 + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function insertReply() {
	if(http.readyState == 4){
	var response = http.responseText;
	document.getElementById('insert_response').innerHTML = 'next please'+response;
}
}