<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
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
<title>Virtual Classroom System - News</title>
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
				<center><h3><u><i>News</i></u></h3></center>
				<p>
				1. <a href="news/AdobeSummit.jsp" accesskey="m">New Java Courses launched. </a><br />
				2. <a href="news/AdobeSummit.jsp" accesskey="m">Exclusive video	training offered for all adobe courses.</a><br />
				3. <a href="news/SunTechDays.jsp" accesskey="m">Sun Tech days here back again for 2011.</a><br />
				4. <a href="news/AdobeSummit.jsp" accesskey="m">Watch out this space for more up coming courses.</a><br />
				5. <a href="news/AdobeSummit.jsp" accesskey="m">Ansca Mobile offers special subscription pricing for current students and educators. </a><br />
				6. <a href="news/AdobeSummit.jsp" accesskey="m">Adobe is back again with Dev Summit on mobile platform.</a><br />
				7. <a href="news/AdobeSummit.jsp" accesskey="m">New Java Courses launched. </a><br />
				8. <a href="news/AdobeSummit.jsp" accesskey="m">Exclusive video	training offered for all adobe courses.</a><br />
				9. <a href="news/SunTechDays.jsp" accesskey="m">Sun Tech days here back again for 2011.</a><br />
				10. <a href="news/AdobeSummit.jsp" accesskey="m">Watch out this space for more up coming courses.</a><br />
				11. <a href="news/AdobeSummit.jsp" accesskey="m">Ansca Mobile offers special subscription pricing for current students and educators. </a><br />
				12. <a href="news/AdobeSummit.jsp" accesskey="m">Adobe is back again with Dev Summit on mobile platform.</a><br />
				13. <a href="news/AdobeSummit.jsp" accesskey="m">New Java Courses launched. </a><br />
				14. <a href="news/AdobeSummit.jsp" accesskey="m">Exclusive video	training offered for all adobe courses.</a><br />
				15. <a href="news/SunTechDays.jsp" accesskey="m">Sun Tech days here back again for 2011.</a><br />
				16. <a href="news/AdobeSummit.jsp" accesskey="m">Watch out this space for more up coming courses.</a><br />
				17. <a href="news/AdobeSummit.jsp" accesskey="m">Ansca Mobile offers special subscription pricing for current students and educators. </a><br />
				18. <a href="news/AdobeSummit.jsp" accesskey="m">Adobe is back again with Dev Summit on mobile platform.</a><br />
				</p>
			</div>
		</div>	
		
		
		<div id="right">
			<%@include file="Collaborate.jsp" %>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
