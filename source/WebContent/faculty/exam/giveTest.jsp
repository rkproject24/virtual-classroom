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
		<title>Virtual Classroom System</title>
		
		
	<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp"%>		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../../DisplayCalendar.jsp"%>

		<%@page import="com.ignou.vcs.beans.StudentBean,java.util.*"%>
		<%
			String userid = (String)request.getSession().getAttribute("userId");
			VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
			
			request.getSession().setAttribute("studentid",userid);
			com.ignou.vcs.beans.StudentBean stu_bean = db_obj.getStudentDetails(userid);
			String courseid = stu_bean.getCourseId();
			
			request.getSession().setAttribute("courseid", courseid);
			VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
			ArrayList getSubjects = new ArrayList();
			getSubjects = db_obj1.getSubjects(courseid, false);
			
			
		%>
		<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
		<h2><a href="#"><u>Give Test</u></a></h2>
		<p class="description">Click on the subject to view Tests.</p>
	<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
		
		<div id="inner_response">
		
		There are two types of Tests that are conducted in Virtual Classroom System namely:
		
		<ol>
		<li><b>Minor Tests</b></li>
		<li><b>Major Tests</b></li>
		</ol>
			<p>	Minor Test covers syllabus specified by the faculty and has some pre requirements that each student must fulfill in order to appear for the test. </p>
				
			<p>	Major Test covers the whole syllabus and is conducted at the end of course of the student. Student has completed the course until and unless he/she has passes all the tests given by him/her.</p>
				
			<p>	Faculty is responsible for preparing and evaluating the test. Student can view his individual and class performance report of each test. </p>
		
		
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
		<p><b><u>Subjects</u></b><br />
		<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax_student.js"></script>
		<%
		for(int i = 0;i < getSubjects.size();i++)
		{
			com.ignou.vcs.beans.SubjectBean subBean  = new com.ignou.vcs.beans.SubjectBean();
			VCSDatabaseActivities db_obj2 = new VCSDatabaseActivities();
			
			subBean = (com.ignou.vcs.beans.SubjectBean)getSubjects.get(i);
			String subjectid = subBean.getSubjectId();
			String subjectName = db_obj2.getSubjectName(subjectid);
			String url = "post_exam_student.jsp?subjectid=" + subjectid +"&courseid=" + courseid;
			%>
			<a href="javascript:jah('<%=url %>','inner_response')"><%=subjectName %></a><br />
		<%
		}
		 %>
		
		</p>

		</div>
		<div id = "inner_response1"></div>

	<%-- /tpl:put --%>
		</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>
