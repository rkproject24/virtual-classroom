<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<html:html>
<head>
<title>modifyTest3</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
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
			String quesno = request.getParameter("quesno");
			ArrayList old_list = (ArrayList)request.getSession().getAttribute("old_list");
			Test_paper paperBean = (Test_paper)old_list.get(Integer.parseInt(quesno) - 1);
			
			int iquesno = Integer.parseInt(quesno);
			String ques = paperBean.getQues();
			String quesMarks = paperBean.getQuesmarks();
			ques = addXML.unescapeForXML1(ques);
			request.getSession().setAttribute("old_marks",quesMarks);
			String totalMarks = (String)request.getSession().getAttribute("totalMarks");
			String maxMarks = (String)request.getSession().getAttribute("maxMarks");
	 %>
	 <div align = "right"><b>Total marks till now: <%=totalMarks %></b></div>
	<form method="post" action="modified.jsp">
					<table border="0">
						<input type = "hidden" name = "flag" id = "flag" value="1">
						<tbody>
							<tr>
								<td><b>Question No:</b></td>
								<td><input type="text" name="quesno" size="20" id="quesno" value="<%=quesno%>" disabled></td>
									<input type = "hidden" name = "quesNo" id = "quesNo" value = "<%=quesno %>">
									
							</tr>
							<tr>
								<td><b>Marks : </b></td>
								<td><input type="text" name="marks" size="20" id="marks" value = "<%=quesMarks%>"></td>
							</tr>
							<tr>
								<td><b>Question :</b></td>
								<td><textarea rows="10" cols="35" name="ques" id="ques"><%=ques %></textarea></td>
							</tr>
						
						</tbody>
						</table><br>
						<% String url = "deleteQues.jsp?quesno=" + quesno;  
							String url1 = "addMoreQues.jsp";  
							%>
						<center>
							<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=totalMarks%>,<%=maxMarks%>)">
						<% 	if(iquesno < old_list.size())
							{
						%>	
								<input type="submit" name="mode" value="Next" id="mode" onclick="javascript:jah3('modifyTest2.jsp','insert_response')">
						<%
							}
							else
							{
							
						 %>	
								<input type="submit" name="mode" value="Add More" id="mode" onclick="javascript:jah5('<%=url1 %>','insert_response')">
						<%	}
						 %>		
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
				for(int i = 0;i < old_list.size();i++)
				
				{
					String url2 = "modifyTest3.jsp?quesno=" + (i+1);
			%>
					<a href="javascript:jah1('<%=url2%>','insert_response')"><font color="green"><%=i+1 %></font></a>
					&nbsp&nbsp&nbsp&nbsp&nbsp			 
			<%	}
			%>	
			</div>
			
			
			</div>	
</body>
</html:html>
