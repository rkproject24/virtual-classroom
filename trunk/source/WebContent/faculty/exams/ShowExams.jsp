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
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.beans.courseBean"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%><html:html>
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

<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../../DisplayCalendar.jsp"%>
				<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
				<h2><a href="#"><u>Exams</u></a></h2>
				<p class="description">Click on course to select to select student</p>
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
					VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
					ArrayList<courseBean> courses = db_obj.getAllCourses();
							
					
					
				%>
			</div>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<script src = "${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Courses</u></b><br />
					<%
						for(int i = 0;i<courses.size();i++)
						{
							courseBean cb = courses.get(i);
							int course = cb.getCourseid();
							String courseName = cb.getCoursename();
					 %>
						<a href="javascript:jah('SubjectsList.jsp','id2','<%= course%>')"><%=courseName %></a><br />
					<%} %>
					
				</p>
			 </div>
			 <br>
			 <div id = "id2">
		</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
