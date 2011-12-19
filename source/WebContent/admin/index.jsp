<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ page import="jChatBox.Util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<jsp:useBean id="SystemLogin" class="jChatBox.Service.SystemLogin" scope="request" />
<%
	
	String jspDisplay = SystemLogin.doLogin(request,session);
	if (jspDisplay != null)
	{
		%><jsp:forward page='<%= jspDisplay %>' /><%
		//response.sendRedirect(jspDisplay);
	}
%>
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
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System - Discussions</u></a></h2>
				<p class="description">Studying the e-way.</p>
<center>
				<p class="description">Please enter your discussion login and password as mailed to you.</p>
					



<form method="post" action="index.jsp" name="chat">
  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#FF0000">
  <%
  	String error = SystemLogin.getSysMessage();
  	if (error != null)
  	{
		if (error.equals(Conf.ACCESSDENIED)) out.print("Access Denied : "+request.getRemoteAddr());
  	}
  %>
  </font></b></font><br>
    <br>
  </div>
<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>
                          </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Login
                          :</font></b></font> </td>
                        <td nowrap>
                          <input type="text" name="name" size="16" class="SystemBox">
                        </td>
                      </tr>
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Password
                          :</font></b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="-2">
                          </font></td>
                        <td nowrap>
                          <input type="password" name="password" size="16" class="SystemBox">
                        </td>
                      </tr>
					<tr>
					<td align="center"></td>
			        <td align="center">
			          <input type="submit" name="SystemLogin" value="Submit" class="SystemButton">
			          &nbsp;&nbsp;
					  <input type="reset" value="Reset" class="SystemButton" name="reset">
			        </td>
			      </tr>
                    </table>
  <br>
  <br>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
 </center>
</div>	
</div>	
		
		
		<div id="right">
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
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
