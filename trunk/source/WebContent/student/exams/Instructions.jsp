<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
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

function returnToMain()
{
	window.location.href = "ShowExams.jsp";
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
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				
<center>
					<html:form action="/UserAcceptance.do" onreset="returnToMain()">
						<p>
						Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
						Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
						when an unknown printer took a galley of type and scrambled it to make a type 
						specimen book. It has survived not only five centuries, but also the leap into 
						electronic typesetting, remaining essentially unchanged. It was popularised in the 
						1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more 
						recently with desktop publishing software like Aldus PageMaker including versions 
						of Lorem Ipsum.
						</p>
						<br><br>
						<p>
						Contrary to popular belief, Lorem Ipsum is not simply random text. 
						It has roots in a piece of classical Latin literature from 45 BC, 
						making it over 2000 years old. Richard McClintock, a Latin professor at 
						Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, 
						consectetur, from a Lorem Ipsum passage, and going through the cites of the word in 
						classical literature, discovered the undoubtable source. Lorem Ipsum comes from 
						sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of 
						Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory 
						of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 
						"Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
						</p>
						<p>
						<ul>
							<li>You need to click on Start Exam button to enable the questions</li>
							<li>You need to click on End Exam if you wish to end the exam.</li>
							<li>You cannot click on back button when you start the exam.</li>
							<li>You cannot write again the same exam if you refresh the browser.</li>
						</ul>
						<input type="hidden" name='userstatus'>
						<input type="hidden" name='userAcceptance'>
						<input type="hidden" name='exam' value="">
						<br>
						<html:submit property="Submit" value="Accept"></html:submit>
							&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="Decline" />
					</html:form>
				</center>


			</div>
		
		
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
