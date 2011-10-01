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

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><html:html>
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

<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp"%>								
		
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
				<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
				<h2><a href="#"><u>Evaluate Paper</u></a></h2>
				<p class="description">Click on course to select to select student</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
					
					 <div id = "id1">
					 
		There are two types of Tests that are conducted in Virtual Classroom System namely:
		
		<ol>
		<li><b>Minor Tests</b></li>
		<li><b>Major Tests</b></li>
		</ol>
			<p>	Minor Test covers syllabus specified by the faculty and has some pre requirements that each student must fulfill in order to appear for the test. </p>
				
			<p>	Major Test covers the whole syllabus and is conducted at the end of course of the student. Student has completed the course until and unless he/she has passes all the tests given by him/her.</p>
				
			<p>	Faculty is responsible for preparing and evaluating the test. Student can view his individual and class performance report of each test. </p>
		
		
					 </div>
				<%
					String userid = (String)request.getSession().getAttribute("userId");
					int subjectid = 1;
					VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
					request.getSession().setAttribute("userid",userid);
					com.ignou.vcs.beans.FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
					String courseid = faculty_bean.getCourseID();
					
					request.getSession().setAttribute("courseid", courseid);
					
					com.ignou.vcs.commons.Utilities pipe = new com.ignou.vcs.commons.Utilities();
					
					java.util.ArrayList course_list = pipe.getSeparateValue(courseid);
					
					
					  
					java.util.ArrayList course_name = new java.util.ArrayList();
					
					for(int i = 0;i<course_list.size();i++)
					{
						VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
						String courseids = (String)course_list.get(i);
						String courseName = db_obj1.getCourseName(courseids);
						course_name.add(courseName);
						
					}	  
					
				%>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<script src = "${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Course</u></b><br />
					<%
						for(int i = 0;i<course_name.size();i++)
						{
							String temp = (String)course_list.get(i);
							
					 %>
						<a href="javascript:jah('student_list.jsp','id2','<%= temp%>')"><%=(String)course_name.get(i) %></a><br />
					<%} %>
					
				</p>
			</div>
			<div id = "id2"> </div>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>