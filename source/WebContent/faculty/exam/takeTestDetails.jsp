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
<html:html>
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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<%-- tpl:put name="buttons_blue_green" --%>
					
				<%-- /tpl:put --%>
				</div>
				<% 
						Date date = new Date();
						DateFormat formatterMonth = new SimpleDateFormat("MMM");
						DateFormat formatterDay = new SimpleDateFormat("dd");
						
						String month = formatterMonth.format(date);
						String day = formatterDay.format(date);
						month = month.toUpperCase();
						
						if(day.equals("1") || day.equals("21") || day.equals("31")) {
							day = day + "st";
						} else if(day.equals("2") || day.equals("22")) {
							day = day + "nd";						
						} else if(day.equals("3") || day.equals("23")) {
							day = day + "rd";						
						} else {
							day = day + "th";						
						} 
						
					%>
				<%-- tpl:put name="calendar" --%>
				
				<div class="calendar">
					
					<p><%=month %><br /><%=day %></p>
				</div>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_heading" --%>
				<h2><a href="#"><u>Test</u></a></h2>
				<%@page import = "com.ignou.vcs.xml.addXML" %>
				<%@page import = "java.util.*" %>
				<p class="description">
					<%
	
	
	
					String testid =  request.getParameter("testid");
					String testtype = request.getParameter("testtype");
					String prereq = request.getParameter("prereq");
					String syllabus = request.getParameter("syllabus");
					String maxmarks = request.getParameter("maxmarks");
					String passmarks = request.getParameter("passmarks");
					String duration = request.getParameter("duration");
					request.getSession().setAttribute("testid",testid);
					System.out.println("DURATION" + duration + " " + passmarks);
					ArrayList soln_list = new ArrayList();
					request.getSession().setAttribute("soln_list",soln_list);
					prereq = addXML.unescapeForXML1(prereq);
					syllabus = addXML.unescapeForXML1(syllabus);
					duration = addXML.unescapeForXML1(duration);
					int flag[] = new int[50];
					for(int i = 0;i<50;i++)
						flag[i] = 0;
					
					%>
					<div class="boxtop"></div>
						<div class="box">
						<p><b><u>Test Details</u></b><br />
						<script src="${pageContext.request.contextPath}/faculty/exam/ajax_student.js"></script>
							<b>Test Type : </b> <%=testtype %><br>
							<%if(testtype.equals("Minor"))
							{ %>
							<b>Pre Requisites : </b> <%=prereq %><br>
							<b>Syllabus : </b> <%=syllabus %><br>
							<%}
							 %>
							<b>Max Marks : </b> <%=maxmarks %><br>
							<b>Pass Marks : </b> <%=passmarks %><br>
							<b>Duration : </b> <%=duration %><br><br>
							<% 
								request.getSession().setAttribute("flag",flag);
								request.getSession().setAttribute("quesno","0");
								request.getSession().setAttribute("duration",duration);	
							%>
							<form>
							
							<a href = "takingTest.jsp" class = lbOn><span>Give</span></a>  
							</form>
						
						<a href="http://localhost:8080/VCS/login.jsp" accesskey="m" class=lbOn><b>Login</b></a>
						</div>
								
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
								<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>