 <%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><html:html>

<%
	String userid = (String)request.getSession().getAttribute("userId");
	
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
	com.ignou.vcs.beans.FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
	String courseid = faculty_bean.getCourseID();
					
	
					
	com.ignou.vcs.commons.Utilities pipe = new com.ignou.vcs.commons.Utilities();
					
	java.util.ArrayList course_list = pipe.getSeparateValue(courseid);
    java.util.ArrayList course_name = new java.util.ArrayList();
    for(int i = 0;i<course_list.size();i++)
	{
		VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
		String courseids = (String)course_list.get(i);
		String courseName = db_obj1.getCourseName(courseids);
		course_name.add(courseName);
		
	}	  
 %>
<html:form action="/test" onsubmit = "return formValidator()" method = "post" name = "Testform" type = "com.ignou.vcs.forms.Test">
<table border="0">
	<tbody>
		<tr>
			<td>*<b>Test Name</b>:</td>
			<td><html:text property="test_name"></html:text></td>
		</tr>
		
		<tr>
			<td><b>*Syllabus</b>:</td>
			<td><html:textarea property="syllabus"></html:textarea></td>
		</tr>
		<tr>
			<td>*<b>Course</b>:</td>
			<td><html:select property="course">
			<%
			for(int i = 0;i < course_name.size();i++)
			{
				String courseid1 = (String)course_list.get(i);
				String name = (String)course_name.get(i);
				
			%>	
			<html:option value="<%=courseid1 %>"><%=name%></html:option>
			<%}
			 %>
			</html:select></td>
		</tr>
		<tr>
			<td><b>*Duration(in minutes)</b>:</td>
			<td><html:text property="time"></html:text></td>
		</tr>
		<tr>
			<td><b>*Max Marks</b>:</td>
			<td><html:text property="max_marks"></html:text></td>
		</tr>
		<tr>
			<td><b>*Pass Marks</b>:</td>
			<td><html:text property="pass_marks"></html:text></td>
		</tr>
		</tbody>
	</table>
	<br>
			<center>
			<html:submit value="Make Paper"></html:submit>
			</center>
		
</html:form>
</html:html>