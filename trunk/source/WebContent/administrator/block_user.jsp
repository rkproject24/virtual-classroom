<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<title>block_user</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<%
	String uid = request.getParameter("uid");
	CommonsDatabaseActivities dbObj = new CommonsDatabaseActivities();
	dbObj.blockUser(uid);
 %>
 
 <div class="boxtop"></div>
	<div class="box">
	<p>
		The User has been Blocked successfully.
	</p>
	</div>
</body>
</html:html>
