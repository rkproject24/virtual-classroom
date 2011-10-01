<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript">
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie2.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style3.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<script src="${pageContext.request.contextPath}/theme/js/player/flowplayer-3.0.3.min.js"></script>	
<script language="JavaScript">
	flowplayer("player", "${pageContext.request.contextPath}/theme/player_swf/flowplayer-3.0.3.swf");
</script>
	
<link rel="shortcut icon" href="${pageContext.request.contextPath}/theme/images/logo_small.JPG" type="image/x-icon">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style3.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				
				<% 
						Date date = new Date();
						DateFormat formatterMonth = new SimpleDateFormat("MMM");
						DateFormat formatterDay = new SimpleDateFormat("dd");
						
						String month = formatterMonth.format(date);
						String day = formatterDay.format(date);
						month = month.toUpperCase();
						
						if(day.equals("1") || day.equals("21") || day.equals("31")) {
							day = day + "st";
						} else if(day.equals("2") || day.equals("22")) {
							day = day + "nd";						
						} else if(day.equals("3") || day.equals("23")) {
							day = day + "rd";						
						} else {
							day = day + "th";						
						} 
						
					%>
				<div class="calendar">
					<p><%= month %><br><%= day %></p>
				</div>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<div id="id">
				
			<table height="180" width="500">
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/globe_48.png" class="thumbnail">
					<ul>
					<u><b>Some Ebooks and Journals.</b></u>
					<p>Go through the mentioned books/Journals for more reading and to increase awareness among students
					<p>The more you read the less you seem to know.Widen your area of knowledge here through few of these e-books that can help you gain practical knowledge.</p>
					</li></td>
				</tr>
				
				<tr></tr><tr></tr><tr></tr>
				<tr>
					<td><li><a href="${pageContext.request.contextPath}/student/The Complete Book of Intelligence Tests.pdf">
						<p><b><u>The Complete Book of Intelligence Tests</u></b></p></a></li>
					</td>
				</tr>
				<tr>
					<td><li><a href="${pageContext.request.contextPath}/student/Barron_s_How_to_Prepare_for_the_GRE_12th_Edition.pdf">
						<p><b><u>Improve your Vocabulary and Grammar</u></b></p></a></li>
					</td>
				</tr>
				<tr>
					<td><li><a href="${pageContext.request.contextPath}/student/Let Us C - Yashwant Kanetkar.pdf">
						<p><b><u>Time to study C</u></b></p></a></li>
					</td>
				</tr>
				<tr>
					<td><li><a href="${pageContext.request.contextPath}/student/htmlguide.pdf">
						<p><b><u>Learn Html</u></b></p></a></li>
					</td>
				</tr>
				<tr>
					<td><li><a href="http://www.timesofindia.com/">
						<p><b><u>Read today's Head lines.</u></b></p></a></li>
					</td>
				</tr>
				</ul>
			</table>

				</div>
				</div> 
			
			</div>	
		
		
		<div id="right">
		<%
		if((userLevel.equals("0")) || (userLevel.equals("1")))
		{
		%>  		
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<%@ include file = "top_box.jsp" %>
				</p>
			</div>
		<%}
		 %>	
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<%@ include file = "bottom_box.jsp" %>
				</p>
				
			</div>
			</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
