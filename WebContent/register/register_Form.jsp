<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.ignou.vcs.registration.database.RegistrationDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><html:html>
<head>
<script type="text/javascript" language="javascript" >

function loadCss() {
	var browser = navigator.appName.toLowerCase();
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 <%
 }
  %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script type = "text/javascript">
function validate_email(field,alerttxt)
{
with (field)
{
apos=value.indexOf("@")
dotpos=value.lastIndexOf(".")
if (apos<1||dotpos-apos<2) 
  {alert(alerttxt);return false}
else {return true}
}
}
function validate_required(field,alerttxt) {
with (field)
{
if (value==null||value=="")
  {alert(alerttxt);return false}
else {return true}
}
}

	
function validate_form(thisform)
{
with (thisform)
{
	var digits = "0123456789";
	
	for (var i = 0; i < thisform.contact_no_primary.value.length; i++)
  	{
    	temp = thisform.contact_no_primary.value.substring(i, i+1)
    	if (digits.indexOf(temp) == -1 &&
   		thisform.contact_no_primary.value != "")
    	{
      		alert("Phone Number should have digits only.\n");
      		break;
    	}
  	}
  	
  for (var i = 0; i < thisform.contact_no_secondary.value.length; i++)
  	{
    	temp = thisform.contact_no_secondary.value.substring(i, i+1)
    	if (digits.indexOf(temp) == -1)
    	{
      		alert("Phone Number should have digits only.\n");
      		break;
    	}
  	}
 if (validate_required(name,"Name must be filled out!")==false)
  {name.focus();return false}
if (validate_required(password,"Password must be filled out!")==false)
  {password.focus();return false}
 if (validate_required(email_id_primary,"primary email-id must be filled out!")==false)
  {email_id_primary.focus();return false}
 if (validate_email(email_id_primary,"Not a valid e-mail address!")==false)
  {email_id_primary.focus();return false}
if (validate_required(contact_no_primary,"Contact Number must be filled out!")==false)
  {contact_no_primary.focus();return false}

if (validate_required(address,"Address must be filled out!")==false)
  {address.focus();return false} 
if (validate_required(father_name,"Father Name must be filled out!")==false)
  {father_name.focus();return false}   
 }
}
</script>	
<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp"%>									
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../../DisplayCalendar.jsp"%>
				<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:9080/VCS/DATA/lectures/reg2.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
				<h2><a href="#"><u>Student Registration Form</u></a></h2>
				
				<p class="description">Please enter following details:</p>
 				
				<div id="insert_response" >        
				</div> 
				<div id="forms">
				<form onsubmit = "return validate_form(this);" action="javascript:insert()" method="post" name="register">
						
				<table height="400" border="0" cellpadding="0"  cellspacing="5">
			

				<tr>
					<td>*Name</td>
					<td><input type="text" name="name" size="30" maxlength="50" id="name" value=""></td>
				</tr>
				<tr>
					<td>*Password</td>
					<td><input type="password" name="password" size="30"
						maxlength="50" id="password" value=""></td>
				</tr>
				<tr>
					<td>*Date Of Birth</td>
					<td> <select name="dayBirth" id="dayBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script>
						</select>
						<select name="monthBirth" id="monthBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=01;i<=12;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
						</select>
						<select name="yearBirth" id="yearBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=1980;i<=2010;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
						</select>
					</td>
				</tr>
				<tr>
					<td>*Email-Id(Primary)</td>
					<td><input type="text" name="email_id_primary" size="30"
						maxlength="50" id="email_id_primary" value=""></td>
				</tr>
				<tr>
					<td>Email-Id(Secondary)</td>
					<td><input type="text" name="email_id_secondary" size="30"
						maxlength="50" id="email_id_secondary" value=""></td>
				</tr>
				<tr>
					<td>*Contact-No(Primary)</td>
					<td><input type="text" name="contact_no_primary" size="30"
						maxlength="50" id="contact_no_primary" value=""></td>
				</tr>
				<tr>
					<td>Contact-No(Secondary)</td>
					<td><input type="text" name="contact_no_secondary" size="30"
						maxlength="50" id="contact_no_secondary" value=""></td>
				</tr>
				<tr>
					<td>*Address</td>
					<td><textarea rows="5" cols="25" name="address" id = "address"></textarea></td>
				</tr>
				<tr>
					<td>*Father Name</td>
					<td><input type="text" name="father_name" size="30"
						maxlength="50" id="father_name" value=""></td>
				</tr>
				<tr>
					<td>Occupation</td>
					<td><input type="text" name="occupation" size="30"
						maxlength="100" id="occupation" value=""></td>
				</tr>
				<tr>
					<td>Please enter the text:<img src="Captcha.jpg"></td> 
					<td><input type="text" name="image" size="30"
						maxlength="100" id="image" value=""></td>
				</tr>				
				<tr>
					<td></td>
					<td>
						<input type="submit" name="submit" value="submit">
						<input type="reset" value="reset">
					</td>
				</tr>
				
		</table>
		*Indicating fields are mandatory
		</form>
	</div>
			</div>
		</div>	
		
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
				<div id="id1">
			</div>
			</div>
			
			<div class="boxtop"></div>
			<div class="box">
				<div id="id2">
			</div>
			</div>
		</div>	
		<%@include file="../../footer.jsp" %>
</body>
</html:html>
