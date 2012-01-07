<%@ page import="com.ignou.vcs.registration.beans.*,com.ignou.vcs.commons.Utilities,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*" %>

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
<%-- tpl:put name="headarea" --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
			<%@include file="../DisplayCalendar.jsp"%>
				<h3><u>Faculty Appointment Requests</u></h3>			
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<div id="forms">	
				<table border="2" cellpadding="0"  cellspacing="5">
					<tr>
					</tr>
					<tr>
					<td><u><b>Name of Applicant</b></u></td><td><u><b>Subject</b></u></td><td><u><b>Qualification</b></u></td><td><u><b>Resume</b></u></td><td><u><b>Status</b></u></td>
					</tr>
					<tr>
						<%
						
						String filePath = Utilities.RESUME_FILES_UPLOAD_PATH;
						String fileDownloadLink = "";
						RegistrationDatabaseActivities dbObj= new RegistrationDatabaseActivities();
						java.util.ArrayList requests= dbObj.getAllRequest();
						
						for(int i=0;i<requests.size();i++)
						  	{
						   		FacultyBean facultyBean=(FacultyBean)requests.get(i);
						   		String fileName = facultyBean.getResume();
						   		filePath = Utilities.RESUME_FILES_UPLOAD_PATH;
						   		filePath=filePath + "\\" + fileName; 
								fileDownloadLink = "http://localhost:8080/VCS/download.jsp?fileName="+fileName+"&filePath="+filePath;						   	
						   		String appId=facultyBean.getAppointmentid();
						   		String subjectId=facultyBean.getSubjectId();
						   		String link="approve.jsp?appointmentid="+appId +"&subjectId="+subjectId; 
						   		String link2="disapprove.jsp?appointmentid="+appId;
						   		System.out.println(link);
						   		System.out.println(link2);
						 %> 
					<td><%=facultyBean.getName() %></td><td><%=facultyBean.getSubjectName()%></td><td><%=facultyBean.getQualification()%></td>
					<td><a href="<%= fileDownloadLink %>"><u>Download</u></a></td>
					<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%= link %> >
					<td><a href="javascript:fetchData('link',<%=i%>,'id2')" accesskey="m" disabled="true"><u>Approve</u></a>/<a href=javascript:fetchData('link2',<%=i%>,'id2')" accesskey="m"><u>Disapprove</u></a></td>
					</tr>
					<%
						}
					%>
					</table>
				</div>
				
				
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<%@include file="../latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
			<div id="id2">
				<div id="insert_response"></div>
				<p>
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>