<%@taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
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
<title>Virtual Classroom System</title>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities" %>
<%@page import="com.ignou.vcs.commons.beans.UserBean" %>
<%@page import="com.ignou.vcs.commons.Utilities" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/calendar.css?random=20051112" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/show_calendar.js?random=20060118"></script>
<script>

function fetchCourses(index)	{
	if (index == 0 ) {
		document.noticeForm.courseID.disabled = false;
	} else {
		document.noticeForm.courseID.disabled = true;
	}
}

function getSelectValues() {
	
	selectList1 = window.document.noticeForm.postedTo;
	
	var selected1 = "";
	
	for(var i = 0; i < selectList1.length; i++) {
		if(selectList1.options[i].selected == true) {
			selected1 = selected1 + selectList1.options[i].value + "|";
		}
	}
	alert(selected1);
	document.noticeForm.postedToValues.value=selected1;
	if(document.noticeForm.courseID.disabled == false) {
		selectList2 = window.document.noticeForm.courseID;
		var selected2 = "";
		for(var i = 0; i < selectList2.length; i++) {
			if(selectList2.options[i].selected == true) {
				selected2 = selected2 + selectList2.options[i].value + "|";
			}
		}
		alert(selected2);
		document.noticeForm.courseIDValues.value=selected2;
	}
	
}
function formValidator(){
	
	
	var title = window.document.addcourseForm.title;
	var keyword = window.document.addcourseForm.keyword;
	var expirydate = window.document.addcourseForm.expiryDate;
	var desc = window.document.noticeForm.description;
	
	
	if(notEmpty(title, "Title must be filled")){
		if(notEmpty(keyword, "Keyword must be filled")){
			if(notEmpty(expirydate, "Expiry Date must be filled")){
				if(notEmpty(desc, "Description must be filled")){
					return true;
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

</script>

<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
	<%
	UserBean userBean = (UserBean)dbObjectForName.getUserInfo(userIDForName) ;
	%>		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Upload a Notice.</u></a></h2>
				<p class="description">kindly mention following details to upload a noitce.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<p>
				
				
				<html:form action="/uploadNotice" name="noticeForm" type="com.ignou.vcs.forms.NoticeForm" onsubmit="javascript:getSelectValues()">

			<input type="hidden" name = "postedToValues" value = "null">
			<input type="hidden" name = "courseIDValues" value = "null">
			<TABLE>
				<TBODY>
					<TR>
						<TD align="left"><b>Title</b></TD>
						
						<TD><html:text property="title" size="40"></html:text></TD>
					</TR>
					<TR>
						<TD align="left"><b>Keyword</b></TD>
						
						<TD><html:text property="keyword" size="40"></html:text></TD>
					</TR>
					<TR>
						<TD align="left"><b>Expiry Date</b></TD>
						
						<TD>
							<html:text property="expiryDate" size="30"></html:text>
							<input type="button" value="Cal" onclick="displayCalendar(document.noticeForm.expiryDate,'yyyy-mm-dd',this)">
						</TD>
					</TR>
					
					<TR>
						<TD align="left"><b>Post To</b></TD>
						
						<TD><html:select property="postedTo" multiple="true" onchange="javascript:fetchCourses(this.options[this.selectedIndex].value);" >
							<html:option value="0">Student</html:option>
							<html:option value="1">Faculty</html:option>
							<html:option value="2">Management</html:option>
							<html:option value="3">Administrator</html:option>
						</html:select></TD>
					</TR>
					<%
						String userID = (String)request.getSession().getAttribute("userId");
						CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
						
						
						if(userBean.getLevel().equals("0") || userBean.getLevel().equals("1")) {
							System.out.println("It comes Here!!!!!");
					 %>
					<TR>
						<TD align="left"><b>Choose courses</b></TD>
						
						<TD><html:select property="courseID" disabled="true" multiple = "true">
							<%
								String courseID = userBean.getCourseID();
								
								Utilities util = new Utilities();
								ArrayList courses = util.getSeparateValue(courseID);
								for (int i=0; i< courses.size(); i++) {
									String cid = (String) courses.get(i);
									String courseName = dbObject.getCourseName(cid);
							%>
								<html:option value="<%=cid %>"><%=courseName %></html:option>
							
							
							<%
								}
							
							%>
						</html:select></TD>
					</TR>
					<%
						}
					 %>
					<TR>
						<TD align="left"><b>Description</b></TD>
						
						<TD><html:textarea property="description" rows="10" cols="34"></html:textarea></TD>
					</TR>
					<TR>
						<TD align="left"><html:reset style="background-color: #88C355; border-style: hidden"/></TD>
						
						<TD><html:submit property="Submit"
							value="Submit" style="background-color: #4890B3; border-style: hidden"></html:submit></TD>
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
			<%@include file="../latest_news.jsp" %>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>