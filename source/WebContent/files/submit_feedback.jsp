<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ignou.vcs.files.database.FilesDatabaseActivities"%>
<html>
<head>
<title>submit_feedback</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<%
	String feedback = request.getParameter("feedback");
	String status = request.getParameter("status");
	String solutionId = request.getParameter("solutionId");
	System.out.println("Feed Back: " + feedback);
	FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
	
	dbObject.insertFeedback(solutionId,feedback,status);
	
 %>
</body>
</html>
