<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
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
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style3.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style3.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<p>
					<h3><U><i>FACULTY DESCRIPTION</i></U></h3>
					<table border="0" width="900px">
					<tr></tr>
					<tr>
					<td><b><u>Director:</u>&nbsp;Prof Manohar Lal</b></td></tr>
					<tr>
					<td>Prof Manohar Lal is a product of IIT Kanpur, IIT Delhi and University of Delhi. 
						He completed his MTech in Computer Science and Engineering (CSE) from IIT Kanpur; pursued his second PhD in CSE from IIT, Delhi. 
						Earlier, he completed his master's and PhD programmes in Mathematics from University of Delhi. He has vast teaching experience 
						of more than 42 years at various universities including University of Delhi and JNU. He has been Professor and Head of Computer 
						Science Department and Director, Computer Centre/Division at HP University, Shimla as well as MD University, Rohtak. Prof Lal has 
						long research experience. Earlier he worked in the area of 'Error - Correcting Codes' (a branch of networking/Data Communications). 
						Currently he is working in the areas of 'Automation of Reasoning' (a branch of Artificial Intelligence) and Computer Networks. He has 
						large number of publications in these areas in national and international journals of repute and has been guiding research students
						 in these areas. Also he is associated with large number of academic bodies in various capacities. Dr Lal is with IGNOU as Professor 
						since July 1998 and as Director, SOCIS from January 03, 2000. </td>
					</tr>
					<tr></tr>
					<tr>
					<td><b><u>FACULTY OF SCIENCE:</u>&nbsp;Mr.Raj Kumar</b></td></tr>
					<tr>
					<td>Mr.Raj Kumar teaches maths subject to classes Vth and VIIth.She comes from a very elite institute.He had done honours with Science from
					IIT kanpur. He has 3years of teaching experience in many of the schools and for the first time he is offering her services to the students 
					in the form of E-Learning through our portal Virtual Classroom System.</td>
					</tr><tr></tr>
					<tr>
					<td><b><u>FACULTY OF ENGLISH:</u>&nbsp;Mrs.Sonal Sharma</b></td></tr>
					<tr>
					<td>Mrs.Sonal teaches maths subject to classes Ist and IInd.She comes from a very elite institute.She had done honours with English from
					IIT kanpur. She has 3years of teaching experience in many of the schools and for the first time she is offering her services to the students 
					in the form of E-Learning through our portal Virtual Classroom System.</td>
					</tr><tr></tr>
					<tr>
					<td><b><u>FACULTY OF HISTORY:</u>&nbsp;Ms.Aashtha Agarwal</b></td></tr>
					<tr>
					<td>Ms.Aashtha teaches maths subject to classes VIIth and VIIIth.She comes from a very elite institute.She had done honours with history from
					LSR. She has 4years of teaching experience in many of the schools and for the first time she is offering her services to the students 
					in the form of E-Learning through our portal Virtual Classroom System.</td>
					</tr><tr></tr>
					<tr>
					<td><b><u>FACULTY OF EVS:</u>&nbsp;Mr.Prasoon chaudhary</b></td></tr>
					<tr>
					<td>Mr.Prasoon teaches maths subject to classes Vth and VIth.He comes from a very elite institute.He had done honours with Maths from
					IIT kanpur. He has 2years of teaching experience in many of the schools and for the first time he is offering her services to the students 
					in the form of E-Learning through our portal Virtual Classroom System.</td>
					</tr>
					
				</table>	
				</p>		
				</div>
			
			
			</div>	
		
		
			<%@include file="footer.jsp" %>
	</div>
</body>
</html:html>
