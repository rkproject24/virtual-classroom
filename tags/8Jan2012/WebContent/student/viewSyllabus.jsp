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
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>View Syllabus</u></a></h2>
				<p class="description">Click on the subject to view syllabus</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
					<%@page import="com.ignou.vcs.beans.StudentBean,java.util.*"%>
			<div id = "id1">
		
		<%
			
			String userid = (String)request.getSession().getAttribute("userId");
			VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
			
			request.getSession().setAttribute("studentid",userid);
			StudentBean stu_bean = db_obj.getStudentDetails(userid);
			String courseid = stu_bean.getCourseId();
			
			request.getSession().setAttribute("courseid", courseid);
			
			ArrayList getSubjects = new ArrayList();
			getSubjects = db_obj.getSubjects(courseid, false);
			
			
		%>
			Students can view syllabus of each subject of his/her.To view the syllabus of any subject,just click on the subject
			in right side and you can view complete syllabus of that subject. 
			</div>
			</div>
		</div>	
		
		
		<div id="right">
			<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Subjects</u></b><br />
		<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
		<%
		for(int i = 0;i < getSubjects.size();i++)
		{
			SubjectBean subBean  = new SubjectBean();
			VCSDatabaseActivities db_obj2 = new VCSDatabaseActivities();
			
			subBean = (SubjectBean)getSubjects.get(i);
			String subjectid = subBean.getSubjectId();
			String subjectName = db_obj2.getSubjectName(subjectid);
			String url = "syllabus_student.jsp?subjectid=" + subjectid +"&courseid=" + courseid;
			%>
			<a href="javascript:jah1('<%=url %>','id1')"><%=subjectName %></a><br />
		<%
		}
		 %>
		</p>

		</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>