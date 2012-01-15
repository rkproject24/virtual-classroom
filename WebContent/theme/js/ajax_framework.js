function createObject() {
	var request_type;
	 if (window.XMLHttpRequest) {
        request_type = new XMLHttpRequest();
        // IE/Windows ActiveX version
    } else if (window.ActiveXObject) {
        request_type = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return request_type;
}
var http = createObject();
var nocache = 0;
function insert() 
{
	document.getElementById('insert_response').innerHTML = "Just a second..."
	var name= encodeURI(document.getElementById('name').value);
	var password= encodeURI(document.getElementById('password').value);
	var dayBirth= encodeURI(document.getElementById('dayBirth').value);
	var monthBirth= encodeURI(document.getElementById('monthBirth').value);
	var yearBirth= encodeURI(document.getElementById('yearBirth').value);
	var email_id_primary= encodeURI(document.getElementById('email_id_primary').value);
	var email_id_secondary= encodeURI(document.getElementById('email_id_secondary').value);
	var contact_no_primary= encodeURI(document.getElementById('contact_no_primary').value);
	var contact_no_secondary= encodeURI(document.getElementById('contact_no_secondary').value);
	var address= encodeURI(document.getElementById('address').value);
	var father_name= encodeURI(document.getElementById('father_name').value);
	var occupation= encodeURI(document.getElementById('occupation').value);
	var image = encodeURI(document.getElementById('image').value);
	nocache = Math.random();
	http.open('post', 'post.jsp?name='+name+'&password='+password+'&dayBirth='+dayBirth+'&monthBirth='+monthBirth+'&yearBirth='+yearBirth+'&email_id_primary='+email_id_primary+'&email_id_secondary='+email_id_secondary+'&contact_no_primary='+contact_no_primary+'&contact_no_secondary='+contact_no_secondary+'&address='+address+'&father_name='+father_name+'&occupation=' +occupation+'&image=' +image+'&nocache = '+nocache+'',false);
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
	document.register.name.disabled = true;
	document.register.password.disabled = true;
	document.register.dayBirth.disabled = true;
	document.register.monthBirth.disabled = true;
	document.register.yearBirth.disabled = true;
	document.register.email_id_primary.disabled = true;
	document.register.contact_no_primary.disabled = true;
	document.register.contact_no_secondary.disabled = true;
	document.register.address.disabled = true;
	document.register.father_name.disabled = true;
	document.register.occupation.disabled = true;
	document.register.email_id_secondary.disabled = true;
	http.onreadystatechange = insertReply();
	
}
function insertReply() {
	if(http.readyState == 4){
		var response = http.responseText;
		document.getElementById('insert_response').innerHTML =response;
		
	}
}

function insertPayment()
{
document.getElementById('insert_response').innerHTML = "Just a second..."
	var card_name= encodeURI(document.getElementById('card_name').value);
	var card_no= encodeURI(document.getElementById('card_no').value);
	var details=card_name+"|"+card_no;
	nocache = Math.random();
	http.open('post', 'payment_submit.jsp?details='+details+'&nocache='+nocache+'',false);
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
	document.payment.card_name.disabled = true;
	document.payment.card_no.disabled = true;
	http.onreadystatechange = insertReply();
}

function insertFeedback()
{	
	var feedback=encodeURI(document.getElementById('feedback').value);
	var status=encodeURI(document.getElementById('status').options[document.getElementById('status').selectedIndex].value);
	var solutionID = encodeURI(document.getElementById('solutionId').value);
	document.getElementById('id_box').innerHTML = "Just a second...";
	nocache = Math.random();
	http.open('post', 'submit_feedback.jsp?feedback='+feedback+'&status='+status+'&solutionId='+solutionID+'&nocache='+nocache+'',false);
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
	if(http.readyState == 4){
		var response = http.responseText;
		document.getElementById('id_box').innerHTML =response;
		
	}
}

function insertCourse()
{
	selectList1 = window.document.coursesForm.name;
	var selected1 = "";
	
	for(var i = 0; i < selectList1.length; i++) {
		if(selectList1.options[i].selected == true) {
			selected1 = selected1 + selectList1.options[i].value + "|";
		}
	}
	alert(selected1);
	document.getElementById('insert_response').innerHTML = "Just a second..."
	// var courselist= encodeURI(document.getElementById('courseValues').value);
	nocache = Math.random();
	http.open('post', 'insertFaculty.jsp?courselist='+selected1+'&nocache = '+nocache+'',false);
	http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded,charset=UTF-8")
	http.send(null);
	http.onreadystatechange = insertReply();
}

function getSelectValues() {
	
	selectList1 = window.document.coursesForm.name;
	var selected1 = "";
	
	for(var i = 0; i < selectList1.length; i++) {
		if(selectList1.options[i].selected == true) {
			selected1 = selected1 + selectList1.options[i].value + "|";
		}
	}
	alert("Its Here!!");
	document.coursesForm.courseValues.value=selected1;
	
	alert(selected1);
	
}