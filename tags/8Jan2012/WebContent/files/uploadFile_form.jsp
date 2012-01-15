<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="com.ignou.vcs.registration.database.RegistrationDatabaseActivities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.beans.SubjectBean"%>
<%@page import="com.ignou.vcs.registration.beans.CourseBean"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><html:html>
<head>
<title>uploadFile_form</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">


</head>
<body>

<%
	String courseID = request.getParameter("cid");
	System.out.println("CourseID:" + courseID);
 %>


<html:form action="/uploadFile" name = "uploadFileForm" type = "com.ignou.vcs.forms.UploadFileForm" method="post" enctype="multipart/form-data" onsubmit="javascript:getSelectValues()">

	<input type = "hidden" name = "crsID" value = "<%=courseID %>">
	<TABLE>
		<TBODY>
			<TR>
				<TD align="left" width="200"><b>File Type</b></TD>
				<TD><html:select property="fileType" onchange="javascript:addFileType(this.options[this.selectedIndex].value);">
					<html:option value="0" >General</html:option>
					<%
						if(courseID.equals("0")) {
											
					 %>
					<html:option value="1" disabled="true">Lecture</html:option>
					<html:option value="2" disabled="true">Assignment</html:option>
					<%
						}else{
					 %>
					<html:option value="1" disabled="false">Lecture</html:option>
					<html:option value="2" disabled="false">Assignment</html:option>	
					<%	}
					 %>
				</html:select></TD>
			</TR>
			
			<TR>
				<TD align="left" width="200"><b>Title</b></TD>
				<TD><html:text property="title" size="45"></html:text></TD>
			</TR>
					
			<TR>
				<TD align="left" width="200"><b>File</b></TD>
				<TD><html:file property="theFile" size="45"></html:file></TD>
			</TR>
			<%
				if(courseID.equals("0")) {
				
			
			 %>
						<TR>
							<TD align="left" width="200"><b>Post To</b></TD>
							<TD><html:select property="uploadedTo" onchange="javascript:loadCourseSubjects(this.options[this.selectedIndex].value);">
								<html:option value="0">Students</html:option>
								<html:option value="1">Faculty</html:option>
								<html:option value="2">Management</html:option>
								<html:option value="3">Administrator</html:option>
							</html:select></TD>
						</TR>
						
						<TR>
							<TD align="left" width="200"><b>Select Courses for Students</b></TD>
							<TD><html:select property="courseID" size="3" multiple="true" disabled = "false">
			<%
						RegistrationDatabaseActivities dbObject = new RegistrationDatabaseActivities();	
						ArrayList allCourses = dbObject.getAllCourse();
						for(int i = 0; i < allCourses.size(); i++) {
							CourseBean courseBean = (CourseBean)allCourses.get(i);
							String crsID = courseBean.getCourseId();
							String crsName = courseBean.getName();
					
			 %>		
						 	<html:option value="<%=crsID %>"> <%= crsName%> </html:option>
			 <%
			 			}
			  %>	
						  </html:select></TD>
						</TR>
						<input type="hidden" name = "courseIDValues" value = "null" />
						<TR>
							<TD align="left" width="200"><b>Select Subjects for Faculties</b></TD>
							<TD><html:select property="subjectID" size="3" multiple="true" disabled = "true">
			<%
				
						CommonsDatabaseActivities obj = new CommonsDatabaseActivities();
						ArrayList allSubjects = obj.getAllSubjects();
						for(int i = 0; i < allSubjects.size(); i++) {
							SubjectBean subjectBean = (SubjectBean)allSubjects.get(i);
							String subID = subjectBean.getSubjectId();
							String subName = subjectBean.getSubjectName();
			 %>		
						 	<html:option value="<%=subID %>"> <%= subName%> </html:option>
			 <%
					 	}
					
			  %>	
						  </html:select></TD>
						</TR>
						<input type = "hidden" name = "subjectIDValues" value="null">
				<%
					}
				 %>		
			<TR>
				<TD align="left" disabled="false" width="200"><b>Description</b></TD>
				<TD><html:textarea property="description" rows="5" cols="45"></html:textarea></TD>
			</TR>
			
			<TR>
				<TD align="left" width="200"><html:submit property="Submit" value="Submit"></html:submit></TD>
				<TD><html:reset /></TD>
			</TR>
		</TBODY>
	</TABLE>

</html:form>

</body>
</html:html>
