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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<%-- tpl:put name="buttons_blue_green" --%>
					
				<%-- /tpl:put --%>
				</div>
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
				<%-- tpl:put name="calendar" --%>
				
				<div class="calendar">
					
					<p><%=month %><br /><%=day %></p>
				</div>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_heading" --%>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<h3><b><u>FAQ's</u></b></h3>
				<p>
					<b>Q 1.</b> What is the registration process for the student?<br/>

			  		<b>A 1.</b>Student Registration is five step process.<br/>
					<ul>
			       <li>(i)  Student needs to fill his/her personal details.</li>
			
			       <li>(ii)  Then user needs to select the course to which he/she intends to apply.</li>
			
			       <li>(iii) After selecting the course, user can view the syllabus of each subject of that course.</li>
			
			       <li>(iv) After approving the course, user is required to fill in payment details viz. payment amount, card number,name etc.</li>
			
			       <li>(v) After confirmation, e-mail is sent to the user containing username and password.</li>
			
			</ul><br/>
			   <b>Q 2. </b>Can I register for more than one course at the same time as a student?<br/>
			
			   <b> A 2.</b> No, Student can register for only one course at a time.After completion of his/her course, he/she may register for another
			
			           course.<br/><br/>
			
			
			  <b> Q 3.</b> As a faculty, how many courses can I teach?<br/>
			
			  <b>A 3.</b> It depends upon the management what courses they provide you to teach. It purely on the management discretion as to what 
			  courses faculty can teach.<br/><br/>
			
			
			  <b> Q 4.</b> What is the meaning of Minor Test and Major Test?
				<p>
			   <b>A 4. </b> Minor Test is conducted after any topic or after any unit.It  depends upon the faculty what syllabus faculty wants to
			           cover in minor test.It has some pre requirements that student must fulfill in order to appear for the test.Pre requirements 
			           may include number of assignments submitted by the student.Students must submit minimum number of assignments in order to 
			           appear for minor test.Major Test is conducted on the completion of the course and  covers whole syllabus of that subject.
			           Student must clear major test of each subject in order to  complete his/her course.  
			 </p> 
				
				
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<%@include file="latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Important Links</u></b><br />
					<a href="http://localhost:8080/VCS/faculty_registration.jsp" accesskey="m"><span class="key">R</span>egister as a Faculty</a><br />
					<a href="http://localhost:8080/VCS/faculty_registration.jsp" accesskey="m"><span class="key">B</span>ecome a Manager</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>iew Demo</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>ontact Us</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>