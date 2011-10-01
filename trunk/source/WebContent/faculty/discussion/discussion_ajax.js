
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

function insert() 
{
	document.getElementById('timeslot').innerHTML = "Just a second...";
	
	var date= window.document.scheduleForm.date.value;
	var time = window.document.scheduleForm.time.value;
	var courseid = window.document.scheduleForm.course.value;
	nocache = Math.random();
	
	http.open('get', 'checkTimeslot.jsp?date='+date+'&time=' +time + '&courseid=' + courseid + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function insert_mgmt() 
{
	document.getElementById('timeslot').innerHTML = "Just a second...";
	
	var date= window.document.scheduleForm.date.value;
	var time = window.document.scheduleForm.time.value;
	
	var courseid = document.getElementById('courseValues').value;
	
	var subjectid = document.getElementById('subjectValues').value;
	
	nocache = Math.random();
	
	http.open('get', 'checkTimeslotMgmt.jsp?date='+date+'&time=' +time + '&courseid=' + courseid +'&subjectid=' + subjectid + '&nocache = '+nocache+'',true);
	http.onreadystatechange = insertReply;
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
}
function insertReply() {
	if(http.readyState == 4){
	var response = http.responseText;
	document.getElementById('timeslot').innerHTML = response;
}
}