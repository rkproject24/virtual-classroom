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
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
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
				<h2><a href="#"><u>Notices.</u></a></h2>
				<p class="description"><b>Select a subject Or Click on General to view General Notices.</b></p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<div id="id">
				<p>
					Notices makes the users of the Virtual Classroom aware of the different activites that are either recently going on or the upcoming ones.Notices can be:
					<ol>
					<li><b>Viewed</b></li>
					<li><b>Uploaded</b></li>
					<li><b>Deleted</b></li>
					</ol>
					Notices can be uploaded by any of them- <u>Administrator </u>, <u>Management</u> or the <u>Faculty</u>. 
					Administrator and Management can upload any General notice whwereas faculties can upload notices pertaining to their respective courses and subjects which can be viewed by the students.
					Faculties can inform students about the discussion times for their subjects,can inform them regarding any upcoming assignment ,their date of submission etc.
					They can even view the notices uploaded by Management and Administrator as per their access rule, for there may be certain notices that can be just viewed by adminisitrator and Management or any one of them. 
					Management can inform through notices about any recent advancement - like addition or removal of some courses or about some extra curricular activities etc, in its Virtual Classroom System and tne Administrator can do the same.
									

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
						String userID = (String) request.getSession().getAttribute("userId");
						CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
						com.ignou.vcs.commons.beans.UserBean userBean = dbObject.getUserInfo(userID);
						System.out.println("USER ID:" + userIDForName);
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
								String link = "subject_notices.jsp?sid=" + subjectID +"&cid=" + courseID + "&pageNum=0";
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
							for( int i = 0; i < courses.size(); i++) {
								String cid = (String)courses.get(i);
								String courseName = dbObject.getCourseName(cid);
								System.out.println("Course Name:" + courseName);
								String sid = userBean.getSubjectID();
								String link = "subject_notices.jsp?cid=" + cid + "&sid=" + sid + "&pageNum=0";
					%>
							<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
						<a href="javascript:fetchData('link','<%=i %>','id')" accesskey="m"><%= courseName %></a><br />
						
					<%				
								 
							}
						} if(level.equals("0") || level.equals("1") || level.equals("2") || level.equals("3")) {
									
					 %>
									 
					 <a href="javascript:jah('subject_notices.jsp?cid=0&sid=0&pageNum=0','id')" accesskey="m">General</a><br />
					 <% 
					 	} if(level.equals("3")) {
					 		RegistrationDatabaseActivities regObject = new RegistrationDatabaseActivities();
					 		java.util.ArrayList allCoursesAdmin = regObject.getAllCourse();
					 		System.out.println("Size of Courses list:" + allCoursesAdmin.size());
					 		for (int k = 0; k < allCoursesAdmin.size(); k++) {
					 			com.ignou.vcs.registration.beans.CourseBean cBean = (com.ignou.vcs.registration.beans.CourseBean)allCoursesAdmin.get(k);
					 			String cName = cBean.getName();
					 			String cid = cBean.getCourseId();
					 			String sid = "0";
					 			String link = "subject_notices.jsp?cid=" + cid + "&sid=" + sid + "&pageNum=0";
					 		
					 		
					 	
					 	%>
							<input type = "hidden" name="link<%=k%>" id="link<%=k%>" value=<%=link %> >
							 
						<a href="javascript:fetchData('link','<%=k %>','id')" accesskey="m"><%= cName %></a><br />
						
					<%				
								 }
							}
					  %>
				</p>
				
			</div>
			
			<div id="id_box">
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>