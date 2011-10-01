<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><html:html>
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
function checkMarks(totalMarks,maxMarks)
{
	if(totalMarks != maxMarks)
	{
		alert("Question Paper total Marks does not equals Mximum Marks");
		return false;
	}
	return true;	 
}	
</script> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/theme/images/logo_small.JPG" type="image/x-icon">
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="../../header.jsp" %>								
		<div id="insert_response">
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
				<h2><a href="#"><u>Modify Test</u></a></h2>
				<p class="description"></p>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_js.js"></script>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
				
				<%
					String testid = request.getParameter("testid");
					String maxmarks = request.getParameter("maxmarks");
					int imaxmarks = Integer.parseInt(maxmarks);
					
					VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
					java.util.ArrayList testpaper = (java.util.ArrayList)dbObj.getPaper(testid);
					com.ignou.vcs.forms.Test_paper paper = (com.ignou.vcs.forms.Test_paper)testpaper.get(0);
					
					String ques = paper.getQues();
					String quesMarks = paper.getQuesmarks();
					String quesno = "1";
					ques = com.ignou.vcs.xml.addXML.unescapeForXML1(ques);   		
					
					for(int i = 0;i < testpaper.size();i++)
					{
						com.ignou.vcs.forms.Test_paper testObj = (com.ignou.vcs.forms.Test_paper)testpaper.get(i);
						testObj.setQuesno(i+1);
						testpaper.set(i,testObj);
					}	 	
					
					java.util.ArrayList ques_list = new java.util.ArrayList();
					
					request.getSession().setAttribute("testid",testid);
					request.getSession().setAttribute("old_list",testpaper);
					request.getSession().setAttribute("totalMarks",maxmarks);
					request.getSession().setAttribute("maxMarks",maxmarks);
					request.getSession().setAttribute("old_marks",quesMarks);
				%>
				<div align="right"><b>Total marks till now: <%=imaxmarks %></b></div>
				<form method="post" action="modified.jsp">
					<input type="hidden" name="old_marks" id="old_marks" value="<%=quesMarks%>">
					<table border="0">
						<tbody>
							<tr>
								<td><b>Question No:</b></td>
								<td><input type="text" name="quesno" size="20" id="quesno" value="<%= quesno%>" disabled></td>
									<input type="hidden" name="quesNo" id="quesNo" value="<%= quesno%>">
							</tr>
							<tr>
								<td><b>Marks : </b></td>
								<td><input type="text" name="marks" size="20" id="marks" value="<%=quesMarks%>"></td>
							</tr>
							<tr>
								<td><b>Question :</b></td>
								<td><textarea rows="10" cols="35" name="ques" id="ques"><%=ques %></textarea></td>
							</tr>
						
						</tbody>
						</table><br>
						<center>
						<% String url = "deleteQues.jsp?quesno=" + quesno;  %>
							<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=maxmarks%>,<%=maxmarks%>)">
							<input type="submit" name="mode" value="Next" id="mode" onclick="javascript:jah3('modifyTest2.jsp','insert_response')">
							<input type="submit" name="mode" value="Delete" id="mode" onclick="javascript:jah1('<%=url%>','insert_response')">
						</center>
					</form>
				</div>	
			</div>
			
			
			
		
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
			<b><u>Questions</u></b><br>
			<%
				for(int i = 0;i < testpaper.size();i++)
				
				{
					String url1 = "modifyTest3.jsp?quesno=" + (i+1);
			%>
					<a href="javascript:jah1('<%=url1%>','insert_response')"><font color="green"><%=i+1 %></font></a>
					&nbsp&nbsp&nbsp&nbsp&nbsp			 
			<%	}
			%>	
			</div>
			
			
			</div>	
		</div>		
		<%@include file="../../footer.jsp" %>
	</div>
</body>
</html:html>
