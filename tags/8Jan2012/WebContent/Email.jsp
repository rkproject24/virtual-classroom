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

function mailValidations()
{
	var toMail,ccMail,bccMail,sub,msg;

	toMail = document.fm.toAddr.value;
	ccMail = document.fm.ccAddr.value;
	bccMail = document.fm.bccAddr.value;
	sub = document.fm.subject.value;
	msg = document.fm.msgContent.value;

	if(toMail.length <1 && ccMail.length<1 && bccMail.length<1)
	{
		alert("Please enter any of the addresses: TO,CC,BCC");
		document.fm.toAddr.focus();
		return false;
	}else if(sub.length<1)
	{
		alert("Please enter subject");
		document.fm.subject.focus();
		return false;
	}else if(msg.length<1)
	{
		alert("Please enter your message");
		document.fm.msgContent.focus();
		return false;
	}	
	
	return true;
	
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
	else
	{
		response.sendRedirect("./NewLogin.jsp");
	}
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<center><h3><u><i>Email</i></u></h3></center>
				<form action="SendEmail.jsp" method="post" name="fm" onsubmit="return mailValidations()">
					<table width="100%">
					<% 
						CommonsDatabaseActivities cba = new CommonsDatabaseActivities();
						String fromAddr = cba.getEmailId(userIDForName,Integer.parseInt(userLevel));
					%>
					<tr><td>From</td><td><input type="hidden" name="fromAddr" value="<%=fromAddr %>"><%=fromAddr %></td></tr>
					<tr><td>To</td><td><input type="text" name="toAddr"></td></tr>
					<tr><td>CC</td><td><input type="text" name="ccAddr"></td></tr>
					<tr><td>BCC</td><td><input type="text" name="bccAddr"></td></tr>
					<tr><td colspan="2"></td></tr>
					<tr><td>Subject</td><td><input type="text" name="subject"></td></tr>
					<tr><td>Message</td><td><textarea name="msgContent"></textarea></td></tr>
					<tr><td colspan="2"></td></tr>
					<tr><td colspan="2" align="center">
						<input type="submit" value="Send Mail">
						<input type="reset" value="Clear">
					</td></tr>
					</table>
				</form>
			</div>
		</div>	
		
		
		<div id="right">
			<%@include file="latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
