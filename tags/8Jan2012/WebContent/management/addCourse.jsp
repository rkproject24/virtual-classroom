<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%><html:html>
<head>
<script type="text/javascript" language="javascript" >
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>

<script>
function getSelectValues() {
	
	var flag =  formValidator();
	
	if(flag == false)
		
	{
		
		return false;
	}
	
	if(window.document.addcourseForm.subject != null)
	{
	selectList2 = window.document.addcourseForm.subject;
	
	var selected2 = "";
	
	for(var j = 0; j < selectList2.length; j++) {
		if(selectList2.options[j].selected == true) {
			selected2 = selected2 + selectList2.options[j].value + "|";
		}
	}
	
	document.addcourseForm.subjectValues.value=selected2;
	}
	return true;
}	

function formValidator(){
	
	
	var name = window.document.addcourseForm.name;
	var duration = window.document.addcourseForm.duration;
	var fees = window.document.addcourseForm.fees;
	
	
	
	if(notEmpty(name, "Name must be filled")){
		if(notEmpty(duration, "Duration must be filled")){
			if(notEmpty(fees, "Fees must be filled")){
				if(isNumeric(duration, "Duration should be a number")){
					return true;
					}
				}
			}		
		}
	
	
	return false;
	
}
function notEmpty(elem, helperMsg){
	if(elem.value.length == 0){
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}

function isNumeric(elem, helperMsg){
	
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
}


</script>
<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Add Course</u></a></h2>
				<p class="description">All Fields are necessary</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
					<html:form action="/addcourse" name = "addcourseForm" type = "com.ignou.vcs.forms.AddCourseForm" onsubmit="return getSelectValues()">
				<input type = "hidden" name = "subjectValues">

			<TABLE>
				<TBODY>
					<TR>
						<TD align="left" width="180"><b>Name:</b></TD>
						<TD><html:text property="name" size="40"></html:text></TD>
						<TD><html:errors property="courseName"/></TD>
					</TR>
					<TR>
						<TD align="left" width="180"><b>Duration(in months):</b></TD>
						<TD><html:text property="duration" size="40"></html:text></TD>
						<TD><html:errors property="courseDuration"/></TD>
					</TR>
					<TR>
						<TD align="left" width="180"><b>Fees (in INR )</b></TD>
						<TD><html:text property="fees" size="40"></html:text></TD>
						<TD><html:errors property="courseFees"/></TD>
					</TR>
					<TR>
						<TD align="left" width="180"><html:submit property="Submit"
							value="Submit"></html:submit></TD>
						
						<TD><html:reset /></TD>
					</TR>
				</TBODY>
			</TABLE>

		</html:form>
	
				</p>
				
		</div>	
		
		
		<div id="right">
			<%@include file="../latest_news.jsp" %>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
