<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>
<head>
<title>getForm</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>

<%

	String courseID = request.getParameter("cid");
	String fileType = request.getParameter("type");
	System.out.println("fileType:" + fileType);
	String name = "";
%>
<html:form action="/uploadFile" name = "uploadFileForm" type = "com.ignou.vcs.forms.UploadFileForm" method="post" enctype="multipart/form-data" onsubmit="javascript:getSelectValues();">

	<input type = "hidden" name = "crsID" value = "<%=courseID %>">
	<TABLE>
		<TBODY>
			<TR>
				<TD width="200"><b>File Type</b></TD>
				<TD><html:select property="fileType" onchange="javascript:addFileType(this.options[this.selectedIndex].value);">
				
					<html:option value="0" disabled = "true">General</html:option>
					<%
						if (fileType.equals("1")) {
							name="Lecture";						
					 %>
					<html:option value="1" disabled="false">Lecture</html:option>
					<html:option value="2" disabled="true">Assignment</html:option>
					<%
						} else {
							name="Assignment";
					 %>
					 <html:option value="1" disabled="true">Lecture</html:option>
					 <html:option value="2" disabled="false">Assignment</html:option>
					<%
						}
					 %>
				</html:select></TD>
			</TR>
			
			<TR>
				<TD width="200"><b>Title</b></TD>
				<TD><html:text property="title" size="45"></html:text></TD>
			</TR>
				<%
						if (fileType.equals("1")) {
				%>
			<TR>
				<TD width="200"><b>Topics</b></TD>
				<TD><html:textarea property="topics" rows="5" cols="45"></html:textarea></TD>
			</TR>
			<TR>
				<TD width="200"><b>Image File</b></TD>
				<TD><html:file property="imageFile" size="45" onchange = "return formValidation()"></html:file></TD>
			</TR>
				<%
					} else {
				%>
			<TR>
				<TD width="200"><b>Syllabus</b></TD>
				<TD><html:textarea property="syllabus" rows="5" cols="45"></html:textarea></TD>
			</TR>
			<TR>
				<TD width="200"><b>Solution File</b></TD>
				<TD><html:file property="solutionFile" size="45"></html:file></TD>
			</TR>	
				<%
					}
				 %>		
			<TR>
				<TD width="200"><b><%=name %> File</b></TD>
				<TD><html:file property="theFile" size="45" onchange = "return formValidation()"></html:file></TD>
				<input type = "hidden" name = "type" id = "type" value = "<%=name %>">			
			</TR>
			
			<TR>
				<TD width="200"><b>Description</b></TD>
				<TD><html:textarea property="description" rows="10" cols="45"></html:textarea></TD>
			</TR>
			<TR>
				<TD width="200"><html:submit property="Submit" value="Submit" onclick = "return formValidation()"></html:submit></TD>
				<TD><html:reset /></TD>
			</TR>
</TBODY>
</TABLE>
</html:form>
</body>
</html:html>
