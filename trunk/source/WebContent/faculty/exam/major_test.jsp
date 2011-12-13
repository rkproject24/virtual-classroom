<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forms.Test"%>
<script type="text/javascript">
function getSelectValues(){
	
	
	
	if(window.document.Testform1.prereq != null)
	{
		selectList2 = window.document.Testform1.prereq;
	
	var selected2 = "";
	
	for(var j = 0; j < selectList2.length; j++) {
		if(selectList2.options[j].selected == true) {
			selected2 = selected2 + selectList2.options[j].value + "|";
		}
	}
	
	document.Testform1.testValues.value=selected2;
	}
	return true;
}

function formValidator(){
	// Make quick references to our fields
	var testname = window.document.Testform.test_name;
	var maxmarks = window.document.Testform.max_marks;
	var passmarks = window.document.Testform.pass_marks;
	var prereq = window.document.Testform.prereq;
	var syllabus = window.document.Testform.syllabus;
	var duration = window.document.Testform.time;
	
	// Check each input in the order that it appears in the form!
	if(notEmpty(testname, "Test Name should be filled")){
		if(notEmpty(prereq, "Prerequisites should be filled")){
			if(notEmpty(syllabus, "Syllabus should be filled")){
				if(notEmpty(duration, "Duration should be filled")){
			if(isNumeric(maxmarks, "Please enter a valid number")){
				if(isNumeric(passmarks, "Please enter a valid number")){
					if(isNumeric(duration, "Please enter valid number for duration")
					return true;
					}
				  }		
				}
			}	
					
		}
	}
	return false;
	
}
function notEmpty(elem, helperMsg){
	if(elem.value.length == 0){
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}

function isNumeric(elem, helperMsg){
	
	
	var numericExpression = /^[0-9]+$/;
	if(elem.value.match(numericExpression)){
		return true;
	}else{
		alert(helperMsg);
		elem.focus();
		return false;
	}
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

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><html:html>
<%
	String userid = (String)request.getSession().getAttribute("userId");
	
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
	com.ignou.vcs.beans.FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
	String courseid = faculty_bean.getCourseID();
					
	String course = request.getParameter("courseid");
	ArrayList minorTestList = (ArrayList)db_obj.getMinorTest(userid,Integer.parseInt(course));
					
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
<html:form action="/test" onsubmit = "javascript:getSelectValues();" method = "post" name = "Testform1" type = "com.ignou.vcs.forms.Test">
<table border="0">
	<input type="hidden" name = "course" id = "course" value = "<%=course %>">
	<input type="hidden" name = "testValues" id = "testValues" value = "null">
	<tbody>
		<tr>
			<td><b>*Test Name</b>:</td>
			<td><html:text property="test_name"></html:text></td>
		</tr>
		<tr>
			<td><b>*Pre Requisites:</b></td>
			<td><html:select property="prereq" multiple="true" size = "3">
			<%
			for(int i = 0;i < minorTestList.size();i++)
			{
				Test bean = (Test)minorTestList.get(i);
				String testname = (String)bean.getTest_name();
				String testid = (String)bean.getTestid();
				System.out.println(testname + " " + testid);
			%>	
				<html:option value="<%=testid %>"><%=testname%></html:option>
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