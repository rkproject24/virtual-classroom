<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>
<head>
<title>submit_solution</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>


<%
	String fileID = request.getParameter("fileId");
	String userID = request.getParameter("userId");
	System.out.println("USER IDDD:" + userID);
 %>
<div class="boxtop"></div>
<div class="box">
	<p>
<html:form action="/solutionUpload" name="solutionForm" type = "vcs.forms.SolutionForm" method="post" enctype="multipart/form-data">
<TABLE>
		
		<html:hidden property = "fileId" value = "<%= fileID %>" />
		<html:hidden property = "userId" value = "<%= userID %>"/>
		<TBODY>
		<TR>
				<TD width="60"><b>Solution File</b></TD>
				<TD><html:file property="solutionFile" size="16"></html:file></TD>
		</TR>
		<TR>
				<TD width="60"><html:submit property="Submit" value="Submit"></html:submit></TD>
				<TD><html:reset /></TD>
		</TR>	
		</TBODY>
	
		
</TABLE>
</html:form>
</p>
</div>

</body>
</html:html>
