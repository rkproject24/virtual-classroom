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

<%@page import="com.ignou.vcs.registration.database.RegistrationDatabaseActivities"%><html:html>
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
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
					<div id = "forms">
					VCS (Virtual Classroom System) aims to promote a greater count of students to splurge into the field of Education.
					It integrates the benefits of a physical classroom with the convenience of a "no-physical-bar" virtual learning environment, minus the commuting hazards and expenses. 
					It will usher in the immense flexibility and sophistication in the existing learning platform structures, with the perfect blend of synchronous and asynchronous interaction. 
					It provides a means of collaborative learning for the students.
					<br /> 
					</div>
				</p>
				
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
			<div class="boxtop"></div>
			<div class="box">
			<%@ page import="com.ignou.vcs.registration.beans.*;" %>
<br>
				<p><b><u>Courses</u></b><br /></p>
				<%RegistrationBean regBean = (RegistrationBean)request.getSession().getAttribute("regBean");
				//System.out.println("Day Birth:" + request.getParameter("dayBirth"));
				RegistrationDatabaseActivities db = new RegistrationDatabaseActivities();
					java.util.ArrayList course = db.getAllCourse();
					 for(int i=0; i < course.size(); i++)
				    {	
						CourseBean courseBean = (CourseBean)course.get(i);
						
						String courseName = courseBean.getName();
						String cId=courseBean.getCourseId();
						String duration=courseBean.getDuration();
						String fees=courseBean.getFees();
						String link = "showSubjects.jsp?cid=" +cId+"&duration="+duration +"&fees="+fees; 
						System.out.println("link:"+link);
				%>
				<input type = "hidden" name="link<%= i%>" id="link<%= i%>" value="<%= link %>">
				<a href="javascript:fetchData('link','<%=i %>','id2')"><%= courseName %></a><br/>
				<%
					}
				 %>	
			</div>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<div id = "id2">
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
					</div>
				</p>
				
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>