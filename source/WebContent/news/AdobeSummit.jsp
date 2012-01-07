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
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%

//response.sendRedirect("http://localhost:8080/VCS/UnderMaintainance.jsp");


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
<title>Virtual Classroom System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="index.jsp"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
					<img src="${pageContext.request.contextPath}/theme/images/thumb1.jpg" class="thumbnail" alt="thumbnail" />
					
					<b>Devices. Experiences. Innovation</b><br>

					Adobe Systems Incorporated is at the forefront of enabling rich 
					experiences across digital surfaces including smartphones, televisions, 
					tablets and the desktop. With industry leading runtimes, Adobe AIR and 
					Adobe Flash, development IDEs and frameworks, Adobe has established a 
					strong portfolio of technology that is unparalleled in its reach. 
					<br>
					With Adobe technologies, developers can now target iOS, Android, 
					WebOS and the Playbook with this single, robust technology platform.
					<br>
					The Adobe Flash Platform Summit is the single, largest Flash Platform event in India. In keeping with Adobe's strong strides in 
					creating an experience platform across devices and the desktop, 
					the 2011 event focused on the core themes of Devices, Experiences and Innovation.
					<br><br>
					AFPS 2011 was home spun by Saltmarch Media for Adobe.
					Knowledge Partner Tata consultancy and Cognizant
					mobile Partner: Airtel.
					<br /> 
				</p>
				
				<%-- /tpl:put --%>
			</div>
			
		<%@include file="../InfoBox.jsp" %>
		
		<div id="right">
			<%@include file="../latest_news.jsp" %>
			
			<!--  <div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Coming Soon...</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="http://localhost:8080/login.jsp" class="bluebtn"><span>Enter..</span></a></p></div>
			</div>-->
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>