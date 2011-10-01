<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript" >

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
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 	
 
 <%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/calendar.css?random=20051112" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/calendar.js?random=20060118"></script>
<title>Virtual Classroom System</title>
<script type="text/javascript">
function formValidator(){
	
	var date = window.document.addnewsForm.date;
	var subject = window.document.addnewsForm.subject;

	var desc = window.document.addnewsForm.description;

	

	if(notEmpty(subject, "Subject must be filled")){
		if(notEmpty(desc, "Description must be filled")){
			if(notEmpty(date, "Date must be filled")){
				return true;
				
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
</script>
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp"%>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<%-- tpl:put name="buttons_blue_green" --%>
					
				<%-- /tpl:put --%>
				</div>
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
				<%-- tpl:put name="calendar" --%>
				<div class="calendar">
					<p><%=month %><br /><%=day %></p>
				</div>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_heading" --%>
				<h2><a href="#"><u>Add News</u></a></h2>
				<p class="description">Fields marked * are necessary</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>	

		<html:form action = "/addnews" name = "addnewsForm" type = "com.ignou.vcs.forms.AddnewsForm" onsubmit = "return formValidator()">
			<TABLE>
				<TBODY>
					<TR>
						<TD align="left"><b>*Subject:</b></TD>
						
						<TD><html:text property="subject" size="32"></html:text></TD>
					</TR>
					<TR>
						<TD align="left"><b>*Description:</b></TD>
						
						<TD><html:textarea property="description" rows="5" cols="25"></html:textarea></TD>
					</TR>
					<TR>
						<TD align="left"><b>*Date:</b></TD>
						
						<TD><html:text property="date" size = "32"></html:text>
						<a href = "#" onclick = "displayCalendar(document.addnewsForm.date,'yyyy-mm-dd',this)"><img src = "${pageContext.request.contextPath}/theme/images/calendar.JPG"></a>
						
						</TD>
					</TR>
					<TR>
						<TD align="left"><html:submit property="Submit"
							value="Submit"></html:submit></TD>
						
						<TD><html:reset /></TD>
					</TR>
				</TBODY>
			</TABLE>

		</html:form>

					
				</p>
				
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>