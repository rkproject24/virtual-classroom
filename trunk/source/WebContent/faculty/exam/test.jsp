<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.forms.Test_paper"%><html:html>
<head>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
		<title>Virtual Classroom System</title>
<script type="text/javascript">
function getSelectValues(){
	
	
	alert("HI");
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
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />

<!-- LightBox css and scripts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>

</head>
<body onLoad="javascript:loadCss()">

<%@include file="../../header.jsp" %>								
		<% 
						Date date = new Date();
						DateFormat formatterMonth = new SimpleDateFormat("MMM");
						DateFormat formatterDay = new SimpleDateFormat("dd");
						
						String month = formatterMonth.format(date);
						String day = formatterDay.format(date);
						month = month.toUpperCase();
						
						if(day.equals("1") || day.equals("21") || day.equals("31")) {
							day = day + "st";
						} else if(day.equals("2") || day.equals("22")) {
							day = day + "nd";						
						} else if(day.equals("3") || day.equals("23")) {
							day = day + "rd";						
						} else {
							day = day + "th";						
						} 
						
					%>
		<div class="left">
			<div class="left_articles">
				<div class="buttons">

	</div>
		<div class="calendar">
		<p><%=month %><br /><%=day %></p>
		</div>
		<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
		<h2><a href="#"><u>Prepare Test</u></a></h2>
		<p class="description">Click on the type of test to prepare</p>
		<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
		<div id="id1">
		
		
		There are two types of Tests that are conducted in Virtual Classroom System namely:
		
		<ol>
		<li><b>Minor Tests</b></li>
		<li><b>Major Tests</b></li>
		</ol>
			<p>	Minor Test covers syllabus specified by the faculty and has some pre requirements that each student must fulfill in order to appear for the test. </p>
				
			<p>	Major Test covers the whole syllabus and is conducted at the end of course of the student. Student has completed the course until and unless he/she has passes all the tests given by him/her.</p>
				
			<p>	Faculty is responsible for preparing and evaluating the test. Student can view his individual and class performance report of each test. </p>
		
		
		</div>
		<%@page import="java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*"%>
		<%
		ArrayList list = new ArrayList();
		String marksCount = "0";
		request.getSession().setAttribute("marksCount",marksCount);
		request.getSession().setAttribute("list",list);
		 System.out.println(list.size());
		 String quesno = "0"; 
		request.getSession().setAttribute("quesno",quesno);
		 Test_paper test_paper= new Test_paper();
		 request.getSession().setAttribute("test_paper",test_paper);
		 %>
		

	</div>


	</div>	
		
		
		<div id="right">
		<script src="${pageContext.request.contextPath}/faculty/course/ajax.js"></script>
		<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Type of Test</u></b><br>
		<a href="#" accesskey="m" onclick="jah('minor_test.jsp','id1')">Minor
		Test</a><br>
		<a href="#" accesskey="m" onclick="jah('MajorTestCheck.jsp','id1')">Major
		Test</a><br>
		</p>

		</div>


	</div>	
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
