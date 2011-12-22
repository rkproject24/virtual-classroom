<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%><html:html>
<head>
<title>Select Questions</title>
<script type="text/javascript">
	function getQuestionIds()
	{
		var values = [];
	
		if(document.fm.ans.length<1)
		{
			var altTxt = "You havn't selected questions. Do you still want to contine?";
			if (confirm(altTxt))
			{
				self.close();
			}
		}
		for(var i=0;i<document.fm.ans.length;i++)
		{
		  if(document.fm.ans[i].checked)
		  {
			  values.push(document.fm.ans[i].value);
		  } 
		 }
		
		if(values.length>0)
		{
			window.opener.fm.asdf.value = values.join('|');
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
<link id="pagestyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
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
</head>
<body>
	<center><form name="fm"><table>
		<tr>
			<td>S.No</td>
			<td>Question</td>
		</tr>
	<%
		ArrayList<QuestionBean> allQuestions = new ArrayList<QuestionBean>();
		String cId = request.getParameter("c");
		String sId = request.getParameter("s");
		int courseId = Integer.parseInt(cId);
		int subjectId = Integer.parseInt(cId);
		
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
		}
	%>
	</table>
	<input type="button" value="Select" onclick="javaScript: getQuestionIds();" class="greenbtn">
	<input type="button" value="Close" onclick="javaScript: closeMe();" class="greenbtn">
	</form></center>
</body>
</html:html>
