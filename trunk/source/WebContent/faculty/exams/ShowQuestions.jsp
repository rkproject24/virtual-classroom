<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><html:html>
<head>
<title>Select Questions</title>
<script type="text/javascript">
	function getQuestionIds()
	{
		var values = [];
		if(document.fm.question.length<1)
		{
			var altTxt = "You havn't selected questions. Do you still want to contine?";
			if (confirm(altTxt))
			{
				self.close();
			}
		}
		
		for(var i=0;i<document.fm.question.length;i++)
		{
		  if(document.fm.question[i].checked)
		  {
			  values.push(document.fm.question[i].value);
		  } 
		 }
		
		if(values.length>0)
		{
			window.opener.document.getElementById('questionIds').value = values.join('|');
		}	
		self.close();
	}
	
	function closeMe()
	{
		var altTxt = "You havn't selected questions. Do you still want to contine?";
		if (confirm(altTxt))
		{
			self.close();
		}
	}

	function loadCss() 
	{
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

</script>
<%
	String usid = (String) request.getSession().getAttribute("userId");
		if (usid != null) {
%>
<%
	}
%>
</head>
<body>
	<center>
		<h2>Virtual Classroom Systems</h2><br>
		<form name="fm"><table>
		<tr>
			<td>S.No</td>
			<td align="center">Question</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
	<%
		ArrayList<QuestionBean> allQuestions = new ArrayList<QuestionBean>();
		String cId = request.getParameter("c");
		String sId = request.getParameter("s");
		int courseId = Integer.parseInt(cId);
		int subjectId = Integer.parseInt(sId);
		ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
		
		if(courseId>0)
		{
			allQuestions = eda.getCourseQuestions(courseId);
		}
		else if(subjectId>0)
		{
			allQuestions = eda.getSubjectQuestions(subjectId);
		}
		
		if(allQuestions.size()>0)
		{
			for(int i=0;i<allQuestions.size();i++)
			{
				QuestionBean qb = allQuestions.get(i);
			%>
			<tr>
				<td><%=i+1%></td>
				<td><input type="checkbox" name="question" value="<%=qb.getQuestionId()%>"><%=qb.getQuestion() %></td>
			</tr>
			<%
			}
		}else
		{
			out.println("No Questions Found..." + allQuestions.size());
		}
	%>
	</table>
	<hr>
	<input type="button" value="Select" onclick="javaScript: getQuestionIds();" class="greenbtn">
	<input type="button" value="Close" onclick="javaScript: closeMe();" class="greenbtn">
	</form>
	<hr>
	All rights reserved to Virtual Classroom Systems<br>
	<%
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd MMM, yyyy - hh:mm");
	%>
	<p align="right">Last Updated at <%=sdf.format(dt)%></p>
	</center>
</body>
</html:html>
