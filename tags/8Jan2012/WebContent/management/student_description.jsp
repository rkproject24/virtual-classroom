<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>
<head>
<title>student_description</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>

<%
	String uid = request.getParameter("uid");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String dob = request.getParameter("dob");
	String startdate = request.getParameter("startDate");
	String enddate = request.getParameter("endDate");
	
 %>

<div class="boxtop"></div>
	<div class="box">
	<p>
		<b>Email ID :</b> <%= email %><br />
		<b>Contact Number :</b> <%= contact %><br />
		<b>Date Of Birth :</b> <%= dob %><br />
		<b>Course Start Date :</b> <%= startdate %><br />
		<b>Course End Date :</b> <%= enddate %><br />
		
	</p>
	</div>
	

	


</body>
</html:html>
