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

<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style3.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="header.jsp" %>	
								
		
		<div class="left">
			<div class="left_articles">
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<div id="id">
				<table>
				
				<%
					if(userLevel.equals("0")) {
			 	%>
			 	<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/furl_48.png" class="thumbnail">
					<a href="http://localhost:8080/VCS/files/view_files.jsp?fileType=0" accesskey="m""><b><u>View General Files</u></b></a>
					<p>View all the relevant general files.</p></td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/profile/profile.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/user_48.png" class="thumbnail">
					<b><u>My Profile</u></b></a>
					<p>View or edit your profile.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/book_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/student/viewSyllabus.jsp"><b><u>My Subjects</u></b></a>
					<p>Know about your subjects and their respective syllabus.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/globe_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/student/explore.jsp"><b><u>Suggested Reading</u></b></a>
					<p>Time to gear up your learning process in a more innovative manner.</p></td>
				</tr>	
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/yahoo_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/student/fun.jsp"><b><u>Fun@VCS</u></b></a>
					<p>Its fun time at VCS..enjoy the stride..!!</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/table_green_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/student/generateReport.jsp"><b><u>My Report Card</u></b></a>
					<p>My Report Card</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/blue_speech_bubble_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/skin_multilanguage/login.jsp"><b><u>Chat</u></b></a>
					<p>Chat with Friends, Faculty and Management.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/email.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/Email.jsp"><b><u>Email</u></b></a>
					<p>Send email to Friends, Faculty, Management and Administrator.</p></td>
				</tr>
				
				
				<%
					} else if (userLevel.equals("1")) {
				 %>
				 <tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/furl_48.png" class="thumbnail">
					<a href="http://localhost:8080/VCS/files/view_files.jsp?fileType=0" accesskey="m""><b><u>View General Files</u></b></a>
					<p>View all relevant General Files.</p></td>
				</tr>
				
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/user_48.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/profile/profile.jsp"><b><u>My Profile</u></b></a>
					<p>View or edit your profile.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/book_48.png" class="thumbnail">
					<a href="http://localhost:8080/VCS/faculty/course/course_faculty.jsp"><b><u>My Courses</u></b></a>
					<p>Check the syllabus of your Subject in various courses that you teach.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/navigate_48.png" class="thumbnail">
<!--					<a href="http://localhost:8080/VCS/help_manual/Help_Manual.html"  target="_new" accesskey="m"><b><u>Help Manual</u></b></a>-->
					<p>Complete Help at your finger-tips.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/questionmark_48.png" class="thumbnail">
					<a href="http://localhost:8080/VCS/faculty/view_news.jsp"><b><u>News @ VCS</u></b></a>
					<p>Keep yourself updated with latest news from vcs.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/newspaper_48.png" class="thumbnail">

					<a href="${pageContext.request.contextPath}/faculty/booksJournals.jsp"><b><u>Ebooks/Journals</u></b></a>
					<p>Enhance your knowledge and General Awareness here!!</p></td>
				</tr>	
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/email.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/Email.jsp"><b><u>Email</u></b></a>
					<p>Send email to Friends, Management and Administrator.</p></td>
				</tr>
				<%
					} else if (userLevel.equals("2")) {
				 %>
				 <tr>
					<td><a href="${pageContext.request.contextPath}/profile/profile.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/user_48.png" class="thumbnail">
					<b><u>My Profile</u></b></a>
					<p>View or edit your profile.</p></td>
				</tr>
				
				<tr>
					<td><a href="${pageContext.request.contextPath}/management/viewCourses.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/users_two_48.png" class="thumbnail">
					<b><u>View Students</u></b></a>
					<p>View all the students and their profiles who are taking education at VCS</p></td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/management/exams/ViewExams.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/approve.png" class="thumbnail">
					<b><u>Exam Approvals</u></b></a>
					<p>View all the exams and exam approvals at VCS</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/faculty/view_news.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/newspaper_48.png" class="thumbnail">
					<b><u>News @ VCS</u></b></a>
					<p>Get yourself equipped with all the latest happenings at VCS !!!</p></td>
				</tr>	
				<tr>
					<td><a href="http://localhost:8080/VCS/administrator/view_faculties.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/table_48.png" class="thumbnail">
					<b><u>View Faculties</u></b></a>
					<p>View and Manage faculties here and the courses and subjects alloted to them.Also view students feedback for their faculties.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/email.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/Email.jsp"><b><u>Email</u></b></a>
					<p>Send email to Friends, Students,faculty and Administrator.</p></td>
				</tr>	
				<%
					} else if (userLevel.equals("3")) {
				 %>
				 <tr>
					<td><a href="${pageContext.request.contextPath}/profile/profile.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/user_48.png" class="thumbnail">
					<b><u>My Profile</u></b></a>
					<p>View or edit your profile.</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/administrator/archive_users.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/mail_write_48.png" class="thumbnail">
					<b><u>Archive Users</u></b></a>
					<p>Archive Users that have completed their course.</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/administrator/backup_db_form.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/app_48.png" class="thumbnail">
					<b><u>Backup Database</u></b></a>
					<p>Take Backup of VCS Database.</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/administrator/backup_db_form.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/app_48.png" class="thumbnail">
					<b><u>Restore Database</u></b></a>
					<p>Restoring VCS Database.</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/faculty/view_news.jsp"><img src="${pageContext.request.contextPath}/theme/images_links/questionmark_48.png" class="thumbnail">
					<b><u>News @ VCS</u></b></a>
					<p>Get yourself equipped with the latest hapenings @ VCS.</p></td>
				</tr>
				<tr>
					<td><a href="http://localhost:8080/VCS/admin/"><img src="${pageContext.request.contextPath}/theme/images_links/questionmark_48.png" class="thumbnail">
					<b><u>Manage Discussion</u></b></a>
					<p>Discuss with faculty,students and management.</p></td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/theme/images_links/email.png" class="thumbnail">
					<a href="${pageContext.request.contextPath}/Email.jsp"><b><u>Email</u></b></a>
					<p>Send email to Friends, Faculty, Management.</p></td>
				</tr>	
					
				<%  
						}
					
					 %>
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
<!--			<div class="box">-->
<!--				<p>-->
<!--					<%@ include file = "top_box.jsp" %>-->
<!--				</p>-->
<!--			</div>-->
		<%}
		else
		{
		 %>	
<!--			<div class="boxtop"></div>-->
			
			
		<%}
		if((userLevel.equals("0")) || (userLevel.equals("1")) || (userLevel.equals("2")))
		{
		 %>		
			<div class="box">
				<p>
					<%@ include file = "bottom_box.jsp" %>
				</p>
			</div>
				<%@include file="latest_news.jsp" %>
		<%}
		else
		{
		 %>
		 
		<%} %>	
		</div>
		<%@include file="footer.jsp" %>
	
</body>
</html:html>
