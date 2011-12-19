<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forums.beans.SubjectBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.forums.ForumDatabaseOperations"%>
<%@page import="com.ignou.vcs.forums.beans.PollBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Virtual classroom system - Forums</title>
<script type="text/javascript">
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

function statusChange(pollId)
{
	document.forms['fm'].elements['submit'].disabled=false;
	document.forms['fm'].elements['selectedPoll'].value = pollId;
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
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="../index.jsp"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
<center>
<form action="ChangePollStatus.jsp" method="post" name="fm">
<input type="hidden" name="selectedPoll">
<table>
	<%
		ArrayList<PollBean> polls = ForumDatabaseOperations.getAllPolls();
		if (polls.size()>0) 
		{
			for(int i=0;i<polls.size();i++)
			{
				
			 PollBean poll = polls.get(i);
			 String acti = (poll.getPollStatus()==0)?"Active":"Inactive";
	%>
	<tr>
		<td><b><%=poll.getPollQuestion()%></b></td>
		<td><b><%=poll.getPollOptions().toString()%></b></td>
		<td><b><input type="radio" name='pollStatus' onchange="statusChange(<%=poll.getPollId() %>)"><%=acti %></b></td>
	</tr>
	<%
			}
		}
		else 
		{
			out.println("<font color='red'><b>No polls found.</b></font>");
		}
	%>
</table>
<input type="submit" value="Change Poll Status" name="submit" disabled="disabled">
</form>
</center></div>
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html>