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
<%-- tpl:put name="headarea" --%>
<title>Virtual Classroom System</title>
<script type='text/javascript' src="${pageContext.request.contextPath}/theme/js/player/swfobject.js"></script>
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script>
var i = 0;
</script>
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question" width="80" height="80"></a>
				<h2><a href="#"><u>Files</u></a></h2>
				<p class="description">Choose your subject/courses.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<div id="id">
				<p>
					There are three types of files namely:
					<ol>
						<li><b>General Files</b></li>
						<li><b>Lecture Files</b></li>
						<li><b>Assignments</b></li>
					</ol>
							General files can be uploaded by all including Administrator, Management or Faculty. The functionality assist students to the maximum for here they can view and download their assignments with solutions, lecture notes made available to the students on various subjects, presentations or videos uploaded by faculties on various topics to make student feel studying in a live environment etc. They can download their test papers as per the prerequisites and even their solutions later to better analyze their performance.
							Student can even view and download his/her progress reports at later time when he/she is finish with his/her term.
							Administrator and Management can view or upload or download general files containing information related to some circular or the rules list of VCS etc.

				</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<%
						String userID = (String)request.getSession().getAttribute("userId");
						
						//String fileType = "2";
						String fileType = request.getParameter("fileType");
						//String userID = (String)request.getSession().getAttribute("userID");
						CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
						com.ignou.vcs.commons.beans.UserBean userBean = dbObject.getUserInfo(userID);
						
						String level = userBean.getLevel();
						System.out.println("Level:" + level);
						if(level.equals("0")) {
						
							String courseID = userBean.getCourseID();
							System.out.println("Course: " + courseID);
							java.util.ArrayList subjects = dbObject.getSubjects(courseID, false);
							 						
						
					 %>
					<b><u>Subjects</u></b><br />
					<%
							for ( int i =0 ; i < subjects.size(); i++ ) {
								com.ignou.vcs.commons.beans.SubjectBean SubjectBean = (com.ignou.vcs.commons.beans.SubjectBean) subjects.get(i);
								String subjectName = SubjectBean.getSubjectName();
								String subjectID = SubjectBean.getSubjectId();
								String link = "subject_files.jsp?sid=" + subjectID +"&cid=" + courseID + "&pageNum=0&fileType=" + fileType;
								System.out.println("link: " + link );
					%>
						<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
						<a href="javascript:fetchData('link','<%=i %>','id')" accesskey="m"><%= subjectName %></a><br />
						
					<%			
								
							}
						
						}
						 
						else if(level.equals("1")) {
							String courseID = userBean.getCourseID();
							System.out.println("Course Ids:" + courseID);
							com.ignou.vcs.commons.Utilities util = new com.ignou.vcs.commons.Utilities();
							java.util.ArrayList courses = util.getSeparateValue(courseID);
					%>
					<b><u>Courses</u></b><br />
					<%		
							System.out.println("No of Courses : "+ courses.size());
							for( int i = 0; i < courses.size(); i++) {
								String cid = (String)courses.get(i);
								String courseName = dbObject.getCourseName(cid);
								System.out.println("Course Name:" + courseName);
								String sid = userBean.getSubjectID();
								String link = "subject_files.jsp?cid=" + cid + "&sid=" + sid + "&pageNum=0&fileType=" + fileType;
					%>
							<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
						<a href="javascript:fetchData('link','<%=i %>','id')" accesskey="m"><%= courseName %></a><br />
						
					<%				
								 
							}
						}
						else if(level.equals("2") || level.equals("3")) {
							RegistrationDatabaseActivities dbObject1 = new RegistrationDatabaseActivities();	
							java.util.ArrayList allCourses = dbObject1.getAllCourse();
					%>
					<b><u>All Courses</u></b><br />
					<%
							for(int i = 0; i < allCourses.size(); i++) {
								com.ignou.vcs.registration.beans.CourseBean courseBean = (com.ignou.vcs.registration.beans.CourseBean)allCourses.get(i);
								String crsID = courseBean.getCourseId();
								String crsName = courseBean.getName();
								String link = "subject_files.jsp?cid=" + crsID + "&sid=0&pageNum=0&fileType=" + fileType;
					%>
							<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
						<a href="javascript:fetchData('link','<%=i %>','id')" accesskey="m"><%= crsName %></a><br />
						
					<%				
							}
						}
					%>
				</p>
				
			</div>
			
			<div id="id_box">
				<div id="insert_response">
				</div>
			</div>
			<div id="id_feeback">
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>