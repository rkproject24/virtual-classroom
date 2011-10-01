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

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><html:html>
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
<script src = "${pageContext.request.contextPath}/faculty/discussion/ajax.js"></script>
<script>
function getSelectValues() {
	
	
	
	if(window.document.scheduleForm.subject != null)
	{
	selectList2 = window.document.scheduleForm.subject;
	
	var selected2 = "";
	
	for(var j = 0; j < selectList2.length; j++) {
		if(selectList2.options[j].selected == true) {
			selected2 = selected2 + selectList2.options[j].value + "|";
		}
	}
	
	document.scheduleForm.subjectValues.value=selected2;
	}
	if(window.document.scheduleForm.course1 != null)
	{
	selectList1 = window.document.scheduleForm.course1;
	
	
	
	var selected1 = "";
	
	for(var i = 0; i < selectList1.length; i++) {
		if(selectList1.options[i].selected == true) {
			selected1 = selected1 + selectList1.options[i].value + "|";
		}
	}
	
	document.scheduleForm.courseValues.value=selected1;
	}
	return true;
	
	
}	
function getSelectValues1() {
	
	
	var check = document.getElementById('timeslot').innerHTML;
	
	
	if(check == "")
	{
		alert("Check the Availability");
		return false;
	}
	if(window.document.scheduleForm.subject != null)
	{
	selectList2 = window.document.scheduleForm.subject;
	
	var selected2 = "";
	
	for(var j = 0; j < selectList2.length; j++) {
		if(selectList2.options[j].selected == true) {
			selected2 = selected2 + selectList2.options[j].value + "|";
		}
	}
	
	document.scheduleForm.subjectValues.value=selected2;
	}
	if(window.document.scheduleForm.course1 != null)
	{
	selectList1 = window.document.scheduleForm.course1;
	
	
	
	var selected1 = "";
	
	for(var i = 0; i < selectList1.length; i++) {
		if(selectList1.options[i].selected == true) {
			selected1 = selected1 + selectList1.options[i].value + "|";
		}
	}
	
	document.scheduleForm.courseValues.value=selected1;
	}
	return true;
	
	
}
function formValidator(){
	
	
	var date = window.document.scheduleForm.date;
	var title = window.document.scheduleForm.title;
	var time = window.document.scheduleForm.time;
	var description = window.document.scheduleForm.description;
	var duration = window.document.scheduleForm.duration;
	var check = document.getElementById('timeslot').innerHTML;
	
	
	if(check == "")
	{
		alert("Check the Availability");
		return false;
	}
	
		if(notEmpty(date, "Date must be filled")){
		if(notEmpty(title, "Title must be filled")){
			if(notEmpty(time, "Time must be filled")){
			if(notEmpty(description, "Description must be filled")){
				if(notEmpty(duration, "Duration must be filled")){
				if(isNumeric(duration, "Duration should be a number")){
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

</script>	
<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../../header.jsp"%>		
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
				<h2><a href="#"><u>Schedule Discussion</u></a></h2>
				<p class="description">Fields marked * are necessary</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<script src = "${pageContext.request.contextPath}/faculty/discussion/discussion_ajax.js"></script>
				<%
					String userid = (String)request.getSession().getAttribute("userId");
					VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
					request.getSession().setAttribute("userid",userid); 
					int level = db_ob.getLevel(userid);
					
					
					%>
					<div id = "faculty">
					<%
					if(level == 1)
					{
					
						VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
						com.ignou.vcs.beans.FacultyBean faculty_bean = db_obj
								.getFacultyDetails(userid);
						String courseid = faculty_bean.getCourseID();
	
						com.ignou.vcs.commons.Utilities pipe = new com.ignou.vcs.commons.Utilities();
	
						java.util.ArrayList course_list = pipe.getSeparateValue(courseid);
						java.util.ArrayList course_name = new java.util.ArrayList();
						for (int i = 0; i < course_list.size(); i++) {
							VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
							String courseids = (String) course_list.get(i);
							String courseName = db_obj1.getCourseName(courseids);
							course_name.add(courseName);
	
						}
					%>
					
					<p>
				<html:form action = "schedule"  name = "scheduleForm"  type = "com.ignou.vcs.forms.Schedule" onsubmit = "return formValidator()">
				<table border="0">
					<tbody>
						<tr>
							<td><b>*Course:</b></td>
							<td><html:select property="course">
								<%
										for (int i = 0; i < course_name.size(); i++) {
										String name = (String) course_name.get(i);
										String courseid1 = (String)course_list.get(i);
										
								%>
								<html:option value="<%=courseid1 %>"><%=name%></html:option>
								<%
								}
								%>
							</html:select></td>
						</tr>
						<tr>
							<td><b>*Date:</b></td>
							<td><html:text property="date" ></html:text>
								<a href = "#"  onclick = "displayCalendar(document.scheduleForm.date,'yyyy-mm-dd',this)"><span><b>Calendar</b></span></a>
							</td>
						
						</tr>
						<tr>
							<td><b>*Time Slot:</b></td>
							<td><html:select property="time">

							<html:option value="00:00AM-01:00AM">00:00AM-01:00AM</html:option>
							<html:option value="01:00AM-02:00AM">01:00AM-02:00AM</html:option>
							<html:option value="02:00AM-03:00AM">02:00AM-03:00AM</html:option>
							<html:option value="03:00AM-04:00AM">03:00AM-04:00AM</html:option>
							<html:option value="04:00AM-05:00AM">04:00AM-05:00AM</html:option>
							<html:option value="05:00AM-06:00AM">05:00AM-06:00AM</html:option>
							<html:option value="06:00AM-07:00AM">06:00AM-07:00AM</html:option>
							<html:option value="07:00AM-08:00AM">07:00AM-08:00AM</html:option>
							<html:option value="08:00AM-09:00AM">08:00AM-09:00AM</html:option>
							<html:option value="09:00AM-10:00AM">09:00AM-10:00AM</html:option>
							<html:option value="10:00AM-11:00AM">10:00AM-11:00AM</html:option>
							<html:option value="11:00AM-12:00PM">11:00AM-12:00PM</html:option>
							<html:option value="12:00PM-01:00PM">12:00PM-01:00PM</html:option>
							<html:option value="01:00PM-02:00PM">01:00PM-02:00PM</html:option>
							<html:option value="02:00PM-03:00PM">02:00PM-03:00PM</html:option>
							<html:option value="03:00PM-04:00PM">03:00PM-04:00PM</html:option>
							<html:option value="04:00PM-05:00PM">04:00PM-05:00PM</html:option>
							<html:option value="05:00PM-06:00PM">05:00PM-06:00PM</html:option>
							<html:option value="06:00PM-07:00PM">06:00PM-07:00PM</html:option>
							<html:option value="07:00PM-08:00PM">07:00PM-08:00PM</html:option>
							<html:option value="08:00PM-09:00PM">08:00PM-09:00PM</html:option>
							<html:option value="09:00PM-10:00PM">09:00PM-10:00PM</html:option>
							<html:option value="10:00PM-11:00PM">10:00PM-11:00PM</html:option>
							<html:option value="11:00PM-00:00AM">11:00PM-00:00AM</html:option>
						</html:select>
						
						<a href = "javascript:insert()"><b>Check Availability</b></a>
						<div id = "timeslot"></div>
						</td>
						</tr>
						<tr>
							<td><b>*Title:</b></td>
							<td><html:text property="title"></html:text></td>
						</tr>
						<tr>
							<td><b>Description:</b></td>
							<td><html:textarea property="description" rows="5" cols="30"></html:textarea></td>
						</tr>
						</tbody>
						</table>
							
						<br>	
							<center>
							<html:submit property="submit" value="Submit"></html:submit>
							</center>
							
						
					
				
			</html:form> 
					</p>
			<%}
			 else {
			 %>
				<p>Discussion Board is a means of interaction between the students and faculty and between faculty and the management. It helps students to resolve their queries by having discussion with the concern faculty and students are able to interact with the faculty directly.</p>

				<p>Faculty can schedule discussion with the students and specify details of the discussion. Faculty has to attend the scheduled discussion on the time specified.	</p>

				<p>Management can also schedule discussion with the faculty either course wise or subject wise. This way management is in touch with the faculties which are registered in VCS.</p>
				
				<%} %>
				</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<%
			if(level == 2)
			{
			%>
				<div class="boxtop"></div>
				<div class="box">
					<p>
						<b><u>Faculty</u></b><br />
						<a href="#" accesskey="m" onclick="jah('faculty_type.jsp','faculty','subject')">Subject
							Wise
						</a><br>
						<a href="#" accesskey="m" onclick="jah('faculty_type.jsp','faculty','course')">Course
							Wise
						</a><br> 
					</p>
					
				</div>
			<%
			}
			 %>
			<div class="boxtop"></div>
			<%@include file="../../../latest_news.jsp" %>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../../../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>