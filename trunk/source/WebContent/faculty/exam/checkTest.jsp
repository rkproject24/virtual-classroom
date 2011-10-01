<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.FacultyBean"%><html:html>
<head>
<title>checkTest</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
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
</head>
<body>
	<%
		
		String courseid = request.getParameter("course");
		System.out.println("COURSE: " + courseid);
		String userid = (String)request.getSession().getAttribute("userId");
	
		VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
		
		FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
		String subjectid = faculty_bean.getSubjectID();
		String testid = db_obj.checkMajorTest(Integer.parseInt(courseid),Integer.parseInt(subjectid));
		System.out.println("TEST ID:" + testid);
		
		String url1 = "major_test.jsp?courseid="+ courseid;
		if(testid.equals(""))
			response.sendRedirect(url1);
		else
		{
			String maxmarks = db_obj.getTotalMarks(Integer.parseInt(testid));
			String url = "modifyTest1.jsp?testid=" + testid + "&maxmarks=" + maxmarks;
			%>
			<br><br>
			<font size="3"> Test has already been created.Click <b><a href = "<%=url %>">here</a></b> to modify the test.</font>
		<%}
		 %>	 	

</body>
</html:html>
