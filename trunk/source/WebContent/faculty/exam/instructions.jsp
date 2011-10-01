<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>

<head>
<script language="javascript">
function document.onkeydown()
{
if ( event.keyCode==116)
{
event.keyCode = 0;
event.cancelBubble = true;
return false;
}
}
</script>
<script type="text/javascript" language="javascript">
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
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/countDown.js"></script>
</head>
<body onload = "javascript:loadCss()">


	<%@include file="../../header.jsp"%>
	

	<div id="content">
		<div class="left">
			<div class="left_articles">
			
			</div>
		</div>			
		<div id = "inner_response">	
		<div class="left">
			<div class="left_articles">
				
				
				<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax_student.js"></script>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_student_js.js"></script>		
				
				<b> Instructions: </b><br>
		1. All questions are compulsary. <br>
		2. Questions in <b>red</b> are attemptd questions.<br>
		3. Questions in <b>green</b> are unattempted questions. <br>
		4. You can change answer any number of times.But once submitted(clicking on Done button) you are not allowed to take the test again. <br><br>
		<a href = "#" class = "greenbtn" onclick = "window.open('takingTest.jsp','newWIndow','toolbar=no,scrollbars=no,location=no,resizable =no')"><span>Start Test</span></a>  
			
	
				</div>	
			</div>
		
		<div id = "right">
			
		
		</div>
		
	</div>
	 
	
</body>
</html:html>


