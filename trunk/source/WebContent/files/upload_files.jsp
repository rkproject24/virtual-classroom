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
<script src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script>
var i = 0;

function addFileType(index)	{
	var cid = document.uploadFileForm.crsID.value;
	var link = "getForm.jsp?type=" + index + "&cid=" + cid;
	jah(link,'id');
}
function loadCourseSubjects(index) {
	if(index == 0) {
		document.uploadFileForm.courseID.disabled=false;
		document.uploadFileForm.subjectID.disabled=true;		
	}
	if(index == 1) {
		document.uploadFileForm.courseID.disabled=true;
		document.uploadFileForm.subjectID.disabled=false;
	}
	if(index == 2) {
		document.uploadFileForm.courseID.disabled=true;
		document.uploadFileForm.subjectID.disabled=true;
	}
	if(index == 3) {
		document.uploadFileForm.courseID.disabled=true;
		document.uploadFileForm.subjectID.disabled=true;
	}
}

function getSelectValues() {
	selectList1 = window.document.uploadFileForm.courseID;
	
	var selected1 = "";
	
	if(document.uploadFileForm.courseID.disabled == false) {
		for(var i = 0; i < selectList1.length; i++) {
			if(selectList1.options[i].selected == true) {
				selected1 = selected1 + selectList1.options[i].value + "|";
			}
		}
	}
	
	selectList2 = window.document.uploadFileForm.subjectID;
	
	var selected2 = "";
	
	if(document.uploadFileForm.subjectID.disabled == false) {
		for(var i = 0; i < selectList2.length; i++) {
			if(selectList2.options[i].selected == true) {
				selected2 = selected2 + selectList2.options[i].value + "|";
			}
		}
	}
	
	document.uploadFileForm.courseIDValues.value=selected1;
	document.uploadFileForm.subjectIDValues.value=selected2;
	
	
	
}

function validateInput() {
document.write("It comes here");

	var title = window.document.uploadFileForm.title;

	var description = window.document.uploadFileForm.description;
	
	//Validating Input Data
	if(notEmpty(title, "Title must be filled")){
		return 	true;
	} else {
		return false;
	}
	
	if(notEmpty(description, "Description must be filled")){
			return true; 
	} 
  	
  	return false;
  			
	selectedFileType = window.document.uploadFileForm.fileType;
	for (var i = 0; i < selectedFileType.length; i++) {
		
		if(selectedFileType.options[i].selected == true) {
			document.write(i);
		}
	}
}
function formValidation(){
	var type = document.uploadFileForm.type.value;
	
	if(type == "Lecture")
	{
		
		if((document.uploadFileForm.imageFile.value.lastIndexOf(".png")==-1 ) &&
			(document.uploadFileForm.imageFile.value.lastIndexOf(".gif")==-1 ) &&
			(document.uploadFileForm.imageFile.value.lastIndexOf(".jpg")==-1 ) &&
			(document.uploadFileForm.imageFile.value.lastIndexOf(".jpeg")==-1 )){
			alert("Please upload image in .jpeg,.jpg,.gif,.png format");
			return false;
		}
		else
		{	
		if(document.uploadFileForm.theFile.value != "")
		{
		if((document.uploadFileForm.theFile.value.lastIndexOf(".flv")==-1 ) &&
			(document.uploadFileForm.theFile.value.lastIndexOf(".mpg")==-1 ) &&
			(document.uploadFileForm.theFile.value.lastIndexOf(".mov")==-1) &&
			 (document.uploadFileForm.theFile.value.lastIndexOf(".mpeg")==-1) &&
			 (document.uploadFileForm.theFile.value.lastIndexOf(".avi")==-1 )) {
  		 	alert("Please upload file in .flv,.mpeg,.mpg, mov or .avi format");
   		return false;
	}
	}
	}
	}
		
		return true;
	
}
function notEmpty(elem, helperMsg){
	if(elem.value.length == 0){
		alert(helperMsg);
		elem.focus(); // set the focus to this input
		return false;
	}
	return true;
}
function callMethods() {
	// validateInput();
	getSelectValues();
}
</script>
<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<a href="http://localhost:8080/VCS/player3_vid.jsp?filePath=http://localhost:8080/VCS/DATA/lectures/48.flv"  class=lbOn><img src="${pageContext.request.contextPath}/theme/images/qn1.jpeg" align="bottom" class="question"></a>
</div>				
<h2><a href="#"><u>Upload Files.</u></a></h2>
<%@include file="../DisplayCalendar.jsp"%>
				<p class="description">Please select Subject/Category .</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<div id="id">
				<p>
					There are three types of files namely:
					<ol>
						<li><b>General Files</b></li>
						<li><b>Lecture Files</b></li>
						<li><b>Assignments</b></li>
					</ol>
							General files can be uploaded by all including Administrator, Management or Faculty. The functionality assist students to the maximum for here they can view and download their assignments with solutions, lecture notes made available to the students on various subjects, presentations or videos uploaded by faculties on various topics to make student feel studying in a live environment etc. They can download their test papers as per the prerequisites and even their solutions later to better analyze their performance.
							Student can even view and download his/her progress reports at later time when he/she is finish with his/her term.
							Administrator and Management can view or upload or download general files containing information related to some circular or the rules list of VCS etc.
				</div>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
				<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<%
						String userID = (String)request.getSession().getAttribute("userId");
						
						CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
						com.ignou.vcs.commons.beans.UserBean userBean = dbObject.getUserInfo(userID);
						
						String level = userBean.getLevel();
						System.out.println("Level:" + level);
						
						if(level.equals("1")) {
							String courseID = userBean.getCourseID();
							System.out.println("Course Ids:" + courseID);
							com.ignou.vcs.commons.Utilities util = new com.ignou.vcs.commons.Utilities();
							java.util.ArrayList courses = util.getSeparateValue(courseID);
					%>
					<b><u>Courses</u></b><br />
					<%		
							for( int i = 0; i < courses.size(); i++) {
								String cid = (String)courses.get(i);
								String courseName = dbObject.getCourseName(cid);
								System.out.println("Course Name:" + courseName);
								
								String link = "uploadFile_form.jsp?cid=" + cid;
					%>
							<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
						<a href="javascript:fetchData('link','<%=i %>','id')" accesskey="m"><%= courseName %></a><br />
						
					<%				
								 
							}
						} else if(level.equals("2")) {
									
					 %>
									 
					 <a href="javascript:jah('uploadFile_form.jsp?cid=0','id')" accesskey="m">General Files</a><br />
					 <%
					 	}
					  %>
				</p>
				
			</div>
			
			<div id="id_box">
			</div>
			
			
			
			<div class="boxtop"></div>
			<%@include file="../latest_news.jsp" %>>
			
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>