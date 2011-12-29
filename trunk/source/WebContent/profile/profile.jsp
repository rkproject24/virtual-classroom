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

<%@page import="com.ignou.vcs.profile.database.ProfileDatabaseOperations"%><html:html>
<head>
<script type="text/javascript" language="javascript" >
function formValidator()
{
	var searchString = window.document.searchForm.search;
	if(searchString.value.length == 0)
	{
		alert("Enter the search query");
		return false;
	}
	return true;

}
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
		<%@include file="../header.jsp"%>						
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u><%=userName %>'s Profile</u></a></h2>
				<p class="description"></p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<script src = "${pageContext.request.contextPath}/theme/js/ajax.js"></script>
				<div id = "id1">
					<%

						ProfileDatabaseOperations dbObj = new ProfileDatabaseOperations();
						com.ignou.vcs.profile.beans.profilebean bean = (com.ignou.vcs.profile.beans.profilebean)dbObj.Profile(userIDForName,userLevel);
						String name = bean.getName();
						String dob = bean.getDob();
						String emailp = bean.getEmailp();
						String contactp = bean.getContactp();
						String address = bean.getAddress();
						String url = "profile_edit.jsp?name="+ name + "&dob=" + dob + "&emailp=" + emailp + "&contactp=" + contactp + "&address=" + address + "&level=" + userLevel;
					%> 
					<br/>
					<b><u>Personal Information</u></b>
					 	<table>
					 		<tr>
					 			<td width = "200"><b>Name</b></td>
					 			<td><%=name %></td>
					 		</tr>
					 		<tr>
					 			<td width = "200"><b>Date of Birth</b></td>
					 			<td><%= dob%></td>
					 		</tr>
					 		<tr>
					 			<td width = "200"><b>  Primary Email</b></td>
					 			<td><%= emailp%></td>	
					 		</tr>
					 		<tr>
					 			<td width = "200"><b>Primary Contact No </b></td>
					 			<td><%= contactp%></td>
					 		</tr>
					 		
					 		<tr>
					 			<td width = "200"><b>Address</b></td>
					 			<td><%= address%></td>
					 		</tr>
					 	
					 	<%
					 		String userIdFromSession = (String)request.getSession().getAttribute("userId");
					 		CommonsDatabaseActivities dbObjectNew = new CommonsDatabaseActivities();
					 		UserBean userBean = (UserBean)dbObjectNew.getUserInfo(userIDForName) ;
					 		if(userBean==null)
					 		{
					 			response.sendRedirect("./NewLogin.jsp");
					 		}
					 		
					 		if(userBean.getLevel().equals("0")) {
					 			
					 	 %>
					 	<br/>
					 	<table>
					 	
							<tr>
								<td width = "200"><b> Course:</b></td>
								<td><%=bean.getCourseName() %></td>
							</tr>
							<tr>
								<td width = "200"><b>Course Completion Duration: </b></td>
								<td><%= bean.getPendingCourseDuration() %></td>
							</tr>
						</table>
							
						 <% 
						 	} else if(userBean.getLevel().equals("1")){
						 		
						 %>
						 <tr>
								<td width = "200"><b>My Subject: </b></td>
								<td><%= bean.getSubjectName() %></td>
							</tr>
						 <%						 
						 	}
							
						 %>
					 	
						</table>
					<a href = "javascript:jah('<%=url %>','id1')" class = "greenbtn"><span>Edit</span></a>
					</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<%@include file="../latest_news.jsp" %>
			
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
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>