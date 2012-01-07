<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.SubjectBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.beans.CourseBean"%>
<%@page import="com.ignou.vcs.beans.courseBean"%><html:html>
<head>
<script type="text/javascript" language="javascript">
	function loadCss() {
		var browser = navigator.appName.toLowerCase();
		// document.write(browser);
		var stylesheet = document.getElementById("pagestyle");
		var menusheet = document.getElementById("menustyle");
		if (browser.indexOf("microsoft internet explorer") != -1) {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style_ie.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu_ie.css";
		} else {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style1.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu.css";
		}
	}

	function selectQuestions()
	{
		var crsId = document.getElementById("crs").value;
		var subId = document.getElementById("sub").value;
		var param = "ShowQuestions.jsp?c="+crsId+"&s="+subId;

		newwindow=window.open(param,'chld','height=500,width=580');
		if (window.focus) {newwindow.focus();}
	}

	function questions()
	{
		var qiDs = document.getElementById("questionIds").value;
		if(qiDs.length<1)
		{
			alert("Please select questions");
			return false;
		}
		return true;
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
<body onLoad="javascript:loadCss()">

	<%@include file="../../header.jsp"%>

	<div class="left">
		<div class="left_articles">
			<div class="buttons"></div>
			<%@include file="../../DisplayCalendar.jsp"%>
			<h2>
				<a href="#"><u>Virtual Classroom System</u></a>
			</h2>
			<p class="description">Studying the e-way.</p>
			<center>
					<h2>Updating Exam</h2>
					<br><FONT color="red"><html:errors property="ServerError"/></FONT><br>
				<html:form action="/addExam.do" onsubmit="return questions();">
					<input type="hidden" name="examId">
					<table>
						<tr>
							<td>Exam Name</td>
							<td><html:text property="examName"></html:text></td>
							<td><FONT color="red"><html:errors property="examName"/></FONT></td>
						</tr>
						<tr>
							<td>Questions</td>
								<td><input type="text" name="questionIds" id="questionIds"><br><html:button property="questionIds" value="Select Questions" onclick="selectQuestions()"></html:button></td>
							<td><FONT color="red"><html:errors property="questions"/></FONT></td>
						</tr>
						<tr>
							<td>Maximum Marks</td>
							<td><html:text property="maxMarks"></html:text></td>
							<td><FONT color="red"><html:errors property="maxMarks"/></FONT></td>
						</tr>
						<tr>
							<td>Pass Marks</td>
							<td><html:text property="passMarks"></html:text></td>
							<td><FONT color="red"><html:errors property="passMarks"/></FONT></td>
						</tr>
						<tr>
							<td>Exam Duration</td>
							<td><html:text property="duration"></html:text></td>
							<td><FONT color="red"><html:errors property="examDuration"/></FONT></td>
						</tr>
						<tr>
							<td></td>
							<td align="left" width="180"><html:submit property="Submit"
								value="Submit"></html:submit>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset /></td>
							<td></td>
						</tr>

					</table>
				</html:form>
				
			</center>
		</div>


		<div id="right">
			<%@include file="../../latest_news.jsp"%>

			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Collaborate</u></b><br /> <a href="#" accesskey="m"><span
						class="key">I</span>nteractive White Boards</a><br /> <a href="#"
						accesskey="m"><span class="key">C</span>hat with friends,
						Faculties</a><br /> <a href="#" accesskey="m"><span class="key">V</span>oice
						Mailboxes</a><br />
				</p>
				<div class="buttons">
					<p>
						<a href="#" class="bluebtn"><span>More</span></a>
					</p>
				</div>
			</div>
		</div>
		<%@include file="../../footer.jsp"%>
	</div>
</body>
</html:html>
