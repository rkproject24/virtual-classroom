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
<%@page import="com.ignou.vcs.beans.FacultyBean"%><html:html>
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
<%@include file="../../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../../DisplayCalendar.jsp"%>
				<br><br>
				<h2><a href="#"><u>Courses</u></a></h2>
				<p class="description">Select Course to view syllabus and students</p>
					<%
						String userid = (String)request.getSession().getAttribute("userId");
						VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
						FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
						String courseid = faculty_bean.getCourseID();
						String subjectId = faculty_bean.getSubjectID();
						
	
						com.ignou.vcs.commons.Utilities pipe = new com.ignou.vcs.commons.Utilities();
	
						java.util.ArrayList course_list = pipe.getSeparateValue(courseid);
						java.util.ArrayList course_name = new java.util.ArrayList();
						for (int i = 0; i < course_list.size(); i++) {
							VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
							String courseids = (String) course_list.get(i);
							String courseName = db_obj1.getCourseName(courseids);
							course_name.add(courseName);
						}
						%>
				<div id = "id1">
				<p>
				You can view the syllabus and the students corresponding to each course of your subject. Just select course from right side and view syllabus of that course. You can also view student profile and performance of each course.
				</p>
				</div>
					 
				
				<script src = "${pageContext.request.contextPath}/faculty/course/ajax.js"></script>
			</div>
		</div>	
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Courses</u></b><br />
					<%
						for (int i = 0; i < course_name.size(); i++) {
						String name = (String) course_name.get(i);
						String courseid1 = (String)course_list.get(i);
						String url = "course_syllabus.jsp?courseId="+courseid1+"&sid="+subjectId;
						System.out.println("link "+url);
						%>
						<a href="#" accesskey="m" onclick = "jah('<%=url %>','id1')"><%=name %></a><br />
					<%}
					 %>
				</p>
				
			</div>
			<div id = "student">
			</div>
		</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>