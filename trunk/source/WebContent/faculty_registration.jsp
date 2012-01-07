<%@ page import="com.ignou.vcs.commons.beans.*,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*" %>
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
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><u>Registration: </u></h2>
				<p class="description">Please enter following details.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<html:form action="/faculty_registration" method="post" enctype="multipart/form-data">
	<table>
		<tbody>
			<tr>
				<td width="200"><b>*Name</b></td>
				<td><html:text property="name" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Password</b></td>
				<td><html:password property="password" size="45"></html:password></td>
			</tr>
			<tr>
					<td><b>*Date Of Birth</b></td>
					<td> <html:select property="dayBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=01;i<=31;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							
							</script>
						</html:select>
						<html:select property="monthBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=01;i<=12;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
						</html:select>
						<html:select property="yearBirth" value="">
							<script type="text/javascript">
								var i=0
								for (i=1980;i<=2010;i++)	
									{
									document.write("<option value="+i+">"+i+"</option>");
									}
							</script>
						</html:select>
					</td>
				</tr>
			<tr>
				<td width="200"><b>*Email-Id (Primary)</b></td>
				<td><html:text property="email_id_primary" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>Email-Id (Secondary)</b></td>
				<td><html:text property="email_id_secondary" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Contact-No (Primary)</b></td>
				<td><html:text property="contact_no_primary" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Highest Qualification</b></td>
				<td><html:text property="highest_qualification" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Year of Passing</b></td>
				<td><html:text property="year" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Address</b></td>
				<td><html:text property="address" size="45"></html:text></td>
			</tr>
			<tr>
				<td width="200"><b>*Resume</b></td>
				<td><html:file property="resume" size="45"></html:file></td>
			</tr>
			<tr>
				<td width="200"><b>*Specialization</b></td>
				<td><html:select property="specializtion" onchange="javascript:addFileType(this.options[this.selectedIndex].value);">
					<%
						CommonsDatabaseActivities dbObj= new CommonsDatabaseActivities();
						java.util.ArrayList subject= dbObj.getAllSubjects();
						for(int i=0;i<subject.size();i++)
						  	{
						   		SubjectBean subjectBean=(SubjectBean)subject.get(i);
						   		
						 %> 
						<html:option value="<%=subjectBean.getSubjectId()%>"><%= subjectBean.getSubjectName()%></html:option>
						
					<%	 		
						   	}
						 
					%> 
				</html:select>
				</td>
				</tr>
			<tr>
				<td width="200" align="center"><html:submit property="Submit" value="Submit"></html:submit></td>
				<td><html:reset /></td>
			</tr>
</tbody>
</table>
*Indicating fields are mandatory
</html:form>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<%@include file="./latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>