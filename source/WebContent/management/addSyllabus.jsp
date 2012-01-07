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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Add Syllabus</u></a></h2>
				<p class="description">Click on the Subject to add Syllabus</p>
			<FONT color="red"><html:errors property="ServerError"/></FONT>
				<p>
					<html:form action="/addSyllabus" name = "addSyllabusForm" type = "com.ignou.vcs.forms.AddSyllabusForm" onsubmit="return getSelectValues()">

			<TABLE>
				<TBODY>
					<TR>
						<TD align="left" width="180"><b>Name:</b></TD>
						<TD><html:text property="subjectId" size="40"></html:text></TD>
						<TD><FONT color="red"><html:errors property="subjectId"/></FONT></TD>
					</TR>
					<TR>
						<TD align="left" width="180"><b>Name:</b></TD>
						<TD><html:text property="subjectId" size="40"></html:text></TD>
						<TD><FONT color="red"><html:errors property="subjectId"/></FONT></TD>
					</TR>
					<TR>
						<TD align="left" width="180"><b>Name:</b></TD>
						<TD><html:text property="subjectId" size="40"></html:text></TD>
						<TD><FONT color="red"><html:errors property="subjectId"/></FONT></TD>
					</TR>
					
					<TR>
						<TD align="left" width="180"></TD>
						<TD><html:submit property="Submit"
							value="Submit"></html:submit> &nbsp;&nbsp;&nbsp;&nbsp;<html:reset /></TD>
					</TR>
				</TBODY>
			</TABLE>

		</html:form>
	
				</p>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>