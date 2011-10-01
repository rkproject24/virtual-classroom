<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.beans.FileBean"%><html:html>
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
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/theme/images/logo_small.JPG" type="image/x-icon">
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
<script>
function colorchange(str){
	
	
	document.getElementById(str).style.color = 'green';
	
}
</script>

</head>
<body onload="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
					
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
				
				<div class="calendar">
					
					<p><%=month %><br><%=day %></p>
				</div>
				<script src="${pageContext.request.contextPath}/search/ajax.js"></script>
				<div id="id1">
				<ul id="searchtabs">
					
					<li id="tab1"><a href="javascript:jah('search_file.jsp','id1')" onclick="colorchange('file')"><div id="file"><font color="green">Files</font></div></a></li>
					<li id="tab2"><a href="javascript:jah('search_notice.jsp','id1')" onclick="colorchange('notice')"><div id="notice">Notices</div></a></li>
					<li id="tab3"><a href="javascript:jah('search_test.jsp','id1')" onclick="colorchange('test')"><div id="test">Tests</div></a></li>
					
					<li id="tab4"><a href="javascript:jah('search_student.jsp','id1')" onclick="colorchange('student')"><div id="student">Students</div></a></li>
					<li id="tab5"><a href="javascript:jah('search_faculty.jsp','id1')" onclick="colorchange('faculty')"><div id="faculty">Faculty</div></a></li>
					<li id="tab6"><a href="javascript:jah('search_course.jsp','id1')" onclick="colorchange('course')"><div id="course">Courses</div></a></li>
				</ul>
				
				
				
				<br>
				
					
				
				<%
				java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("fileList");	
				if(!(list.size() == 0))
				{
 				%>
					<script src="${pageContext.request.contextPath}/search/ajax.js"></script>
					<table>
					<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>UploadedBy</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<list.size();i++)
						{
							FileBean filebean = (FileBean)list.get(i);
							String title = filebean.getTitle();
							String uploadedby = filebean.getUploadedby();
							String description = filebean.getDescription();
							String filepath  = filebean.getFilepath();
							String filetype = filebean.getFiletype();
							String name = filebean.getName();
							
							int fileid = filebean.getFileid();
							String url = "file_description.jsp?desc=" + description + "&fileid=" + fileid;
						
						%>
							<tr><th scope="row"><a href="#" onclick="javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= uploadedby %></td></tr>	
						<%
						}	
						%>
				</table>
<%				
			}
				else{
				 %>
				 <br><br><b>No Matching Results Found.</b>
				<%} %> 					
					
			
			</div>
			
				</div></div>
			
			
			</div>	
		
		
		<div id="right">
			<div id="id2"></div>
			
			</div>	
		<%@include file="../footer.jsp" %>
	<div></div>
</body>
</html:html>
