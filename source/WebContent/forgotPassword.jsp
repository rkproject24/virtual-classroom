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

//response.sendRedirect("http://localhost:8080/VCS/UnderMaintainance.jsp");


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
<title>Virtual Classroom System - Forgot Password</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<p>
					<img src="${pageContext.request.contextPath}/theme/images/thumb1.jpg" class="thumbnail" alt="thumbnail" />
					
					<b>Forgot Password</b><br>

					
					<html:form action="/forgotPassword">
					
						<b><u><font style='font-family: "Times New Roman"; font-weight: bold'>Please enter your Login Details.</u></b>
						<br /><br />
						<TABLE>
							<TBODY>
								<TR>
									<TD style='font-family: "Times New Roman"; font-weight: bold'>User name</TD>
									<TD><html:text property="userName"></html:text></TD>
								</TR>
								<TR>
									<TD style='font-family: "Times New Roman"; font-weight: bold'>Email</TD>
									<TD><html:text property="email"></html:text></TD>
								</TR>
								<TR>
									<td></td>
									<TD align="center"><html:submit property="Submit" value="Submit"></html:submit>
									<a href="#" class="lbAction" rel="deactivate"><button>Cancel</button></a>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					
					</html:form>
				</p>
				<html:errors></html:errors>
			</div>
			
			<div class="thirds">
				<div class="smallboxtop"></div>
				<div class="smallbox">
					<p>
						<b><u>Coming Soon...</u></b><br />
						<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
						<a href="#" accesskey="m"><span class="key">V</span>ideo Conference with friends, Faculties</a><br />
						<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br /><br>
					</p>
				</div>
			</div>
		
			<div class="thirds">
				<div class="smallboxtop"></div>
				<div class="smallbox">
					<p><u><b>Important Links</b></u><br>
						<a href = "${pageContext.request.contextPath}/faculty_registration.jsp">Become a Faculty.</a><br>
						<a href ="${pageContext.request.contextPath}/faculty_registration.jsp">Become a Manager</a> <br>
						<a href = "#">Bookmark Virtual Classroom Systems.</a><br>
						<a href = "http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn>Demo Course.</a>
					
					</p>
				</div>
			</div>
		
			<div class="thirds">
				<div class="smallboxtop"></div>
				<div class="smallbox">
					<p><b><u>Contacts</u></b><br>
						<a href = "#">General Information</a><br>
						<a href = "#">Students Enquiries</a> <br>
						<a href = "#">Websites Technical Questions</a><br>
						<a href = "#">Faculty Enquiry</a>
					 </p>
				</div>
			</div>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<%@include file="../latest_news.jsp" %>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>