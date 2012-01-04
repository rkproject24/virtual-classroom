<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.ignou.vcs.exams.beans.ExamBean"%>
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="com.ignou.vcs.exams.beans.StudentExamStatusBean"%>
<%@page import="com.ignou.vcs.exams.beans.StudentExamBean"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page
	import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript">  function loadCss() { 	
	var browser = navigator.appName.toLowerCase(); 	
	// document.write(browser); 	
	var stylesheet = document.getElementById("pagestyle"); 	
	var menusheet = document.getElementById("menustyle"); 	
	if(browser.indexOf("microsoft internet explorer") != -1) 
	{ 		
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css"; 		
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css"; 	
		} 	
	else 
	{ 		
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css"; 		
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		 	
		} 
	} 
	</script>
<link id="pagestyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute(
				"userId");
		if (usid != null) {
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css"
	media="screen,projection" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
<%
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:window.history.forward(1);javascript:loadCss()">
	<%@include file="../../header.jsp"%>
	<div class="left">
		<div class="left_articles">
			<div class="buttons"></div>
			<%@include file="../../DisplayCalendar.jsp"%>
			<h2>
				<a href="#"><u>Virtual Classroom System</u></a>
			</h2>
			<p class="description">Studying the e-way.</p>
			<%
				String exam = request.getParameter("e");
				int examId = Integer.parseInt(exam);
				
				ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
				ExamBean eb = eda.getExamDetails(examId);
				StudentExamStatusBean sesb = eda.getStudentExamResults(examId);
				
				if(sesb!=null)
				{ 
					String result = sesb.getResult();
					
					int percentage = (sesb.getScore() * 100) / eb.getMaxMarks();
					
					String subjectName = eda.getSubjectName(sesb.getSubjectId());
					String courseName = eda.getCourseName(sesb.getCourseId());
					
					%>
					<table>
						<tr><td>Exam Id</td><td></td><td><%=sesb.getExamId() %></td></tr>
						<tr><td>Exam Name</td><td></td><td><%=eb.getExamName() %></td></tr>
						<tr><td>Course Name</td><td></td><td><%=courseName %></td></tr>
						<tr><td>Subject Name</td><td></td><td><%=subjectName %></td></tr>
					</table>
					<br>
					<hr>
					<br>
					<table>
						<tr><td>Maximum Marks</td><td></td><td><%=eb.getMaxMarks() %></td></tr>
						<tr><td>Your Marks</td><td></td><td><%=sesb.getScore() %> and <%=percentage %>%</td></tr>
						<tr><td>Result</td><td></td>
						<td><%
							if(result.equalsIgnoreCase("fail"))
							{
								out.println("<b><font color='red'>Fail</font></b>");
							}else
							{
								out.println("<b><font color='green'>Pass</font></b>");
							}
						%></td></tr>
						<tr><td colspan="3">
						</td></tr>
						<tr><td colspan="3">
						<%
							String comment = "";
						
							if (percentage >= 35 && percentage <= 59) 
							{ 		
								comment = "Congratulations"; 	
							} 
							else if (percentage >= 60 && percentage <= 69) 
							{ 		
								comment = "Congratulations. Your marks are GOOD"; 	
							} else if (percentage >= 70 && percentage <= 79) 
							{ 		
								comment = "Congratulations. Your marks are VERY GOOD"; 		
							} 
							else if (percentage >= 80) 
							{ 		
								comment = "Congratulations. Your marks are EXCELLENT"; 	
							}
							else
							{
								comment = "Better luck next time."; 	
							}
							
							if(percentage<=35)
							{
								out.println("<b><font color='red'>"+comment+"</font></b>");
							}else
							{
								out.println("<b><font color='green'>"+comment+"</font></b>");
							}
						%>
						</td></tr>
					</table>
					<%
				}
			%>
		</div>
		
		<%@include file="../../footer.jsp"%>
	</div>
</body>
</html:html>
