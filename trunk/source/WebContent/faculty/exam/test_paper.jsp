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
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title>
<script type="text/javascript" language="javascript" >
function checkMarks(totalMarks,maxMarks)
{
	var marks = window.document.examForm.marks.value;
	
	var finalMarks = parseInt(totalMarks) + parseInt(marks);
	
	if(maxMarks != finalMarks)
	{
		
		alert("Question Paper total Marks does not equals Mximum Marks");
		return false;
	}
	return true;	 
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
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../../header.jsp" %>
		<%
			String marksCount = (String)request.getSession().getAttribute("marksCount");
		 %>
		<div id = "insert"></div>						
		<div id="insert_response">
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
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
				</div>
				<div class="calendar">
					<p><%=month %><br /><%=day %></p>
				</div>
				<h2><a href="#"><u>Test Paper</u></a></h2>
				<p class="description">Set the Question Paper</p>
				<p>
				
			<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_js.js"></script>
			<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
			</p>
			
			<div><a href= "paperPreview.jsp"  target = "_blank"><span><b>Preview</b></span></a><div align = "right"><b>Total marks till now: <%=marksCount %></b></div></div>
			<%
			 java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("list");
			 String quesno1 = (String)request.getSession().getAttribute("quesno");
		 	 
		 	 int quesno2 = Integer.parseInt(quesno1);
			 System.out.println("Quesno2: " + quesno2);
			 Test_paper test_paper = (Test_paper)request.getSession().getAttribute("test_paper");
			 int quesno3 = test_paper.getQuesno();
			 String ques = test_paper.getQues();
			 String maxmarks = (String)request.getSession().getAttribute("maxmarks");
			 System.out.println(maxmarks + " ");
		 %>
		<form method="post" action="done_test.jsp"  name = "examForm">
			
		
		
		
		<table border="0">
			<tbody>
				<tr>
					<td width ="200px"><b>Question No:</b></td>
					<td><input type="text" name="quesno" size="20" id="quesno" value="<%=((quesno2)+1)%>"></td>
				</tr>
				<tr>
					<td width ="200px"><b>Marks : </b></td>
					<td><input type="text" name="marks" size="20" id="marks"></td>
				</tr>
				<tr>
					<td width ="200px"><b>Question :</b></td>
					<td><textarea rows="10" cols="40" name="ques" id="ques"></textarea></td>
				</tr>
				
				
			</tbody>
			</table><br>
			<center>
				<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=marksCount%>,<%=maxmarks%>)">
				<input type="submit" name="mode" value="Next" id="mode" onclick="javascript:jah3('post_exam.jsp','insert_response')"><form></form>
			</center>
	</form></div>
	</div>
			
			
			
		
		
		<div id="right">
			
			
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Questions</u></b><br>
					<%
					for(int i=1;i<25;i++)
					{
						
					 if(i <= list.size())
					 {
					 %>
					 
					 <a href="javascript:jah('post_exam2.jsp','inner_response','<%=i%>');"> <font color="red"><%=i%></font> </a>
					 &nbsp&nbsp&nbsp&nbsp
					 <%
					 }
					 else
					 {
					 	if(i == (list.size()+1))
					 	{
					 	 
					 	%>
					 	<a href="#"> <font color="blue"><%=i%></font> </a>
					 	&nbsp&nbsp&nbsp&nbsp
					 	<%
					 	}
					 	else
					 	{
					 	%>
					 	<a href="#"> <font color="green"><%=i%></font> </a>
					 	&nbsp&nbsp&nbsp&nbsp
					 <%}
					 }
					 if(((i + 1)%5) == 0)
					 {
					 
					 %>
					  <br>
					 <%}
					 }
					  %>
					  
				</p>
				
			
			</div>
			<div id = "inner_response"></div>
			</div>	
			</div>	
			
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
