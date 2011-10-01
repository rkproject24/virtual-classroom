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
<title>Delete Question</title>
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
		String quesNo = request.getParameter("quesno");
		int iquesNo = Integer.parseInt(quesNo);
		ArrayList ques_list = (ArrayList)request.getSession().getAttribute("old_list");
		System.out.println("QUESLIST SIZE" + ques_list.size());	 	
		String marks_old = (String)request.getSession().getAttribute("old_marks");
		String totalMarks = (String)request.getSession().getAttribute("totalMarks");
		int iTotalMarks = Integer.parseInt(totalMarks);
		String maxMarks = (String)request.getSession().getAttribute("maxMarks");
		iTotalMarks = iTotalMarks - (Integer.parseInt(marks_old));
		request.getSession().setAttribute("totalMarks",Integer.toString(iTotalMarks));
		int i = 0;
		for(i = 0;i < ques_list.size();i++)
		{
			Test_paper testObj = (Test_paper)ques_list.get(i);
			System.out.println("QUES " + testObj.getQues() + " " +  testObj.getQuesno());
		}	 	
		for(i = (iquesNo - 1);i < (ques_list.size() - 1);i++)
		{
			Test_paper paperBean = (Test_paper)ques_list.get(i+1);
			paperBean.setQuesno(i + 1);
			ques_list.set(i,paperBean);
		}
		ques_list.remove(i);
		System.out.println("QUESLIST SIZE" + ques_list.size());	 	
		for(i = 0;i < ques_list.size();i++)
		{
			Test_paper testObj = (Test_paper)ques_list.get(i);
			System.out.println("QUES " + testObj.getQues() + " " +  testObj.getQuesno());
		}	 	
		if(iquesNo != (ques_list.size() + 1))
		{
		 Test_paper testObj = (Test_paper)ques_list.get(iquesNo - 1);
		 int quesno = testObj.getQuesno();
		 String ques = testObj.getQues();
		 String quesMarks = testObj.getQuesmarks();
		 ques = addXML.unescapeForXML1(ques);
		 request.getSession().setAttribute("old_marks",quesMarks);
	 %>
	<div align = "right"><b>Total marks till now: <%=iTotalMarks %></b></div>
	 <form method="post" action="modified.jsp">
					<table border="0">
						<tbody>
							<tr>
								<td><b>Question No:</b></td>
								<td><input type="text" name="quesno" size="20" id="quesno" value="<%=quesno%>" disabled></td>
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
						<% String url = "deleteQues.jsp?quesno=" + quesno;  %>
						<center>
							<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=iTotalMarks%>,<%=maxMarks%>)">
							<% 	if(quesno < ques_list.size())
							{
						%>	
								<input type="submit" name="mode" value="Next" id="mode" onclick="javascript:jah3('modifyTest2.jsp','insert_response')">
						<%
							}
							else
							{
							
						 %>	
								<input type="submit" name="mode" value="Add More" id="mode" onclick="javascript:jah5('addMoreQues.jsp','insert_response')">
						<%	}
						 %>		
							<input type="submit" name="mode" value="Delete" id="mode" onclick="javascript:jah1('<%=url%>','insert_response')">
						</center>
					</form>
			<%}
			else
			{
				Test_paper testObj = (Test_paper)ques_list.get(iquesNo - 2);
				 int quesno = testObj.getQuesno();
				 String ques = testObj.getQues();
				 String quesMarks = testObj.getQuesmarks();
				 ques = addXML.unescapeForXML1(ques);
				 request.getSession().setAttribute("old_marks",quesMarks);
				
			 %>	
			 <div align = "right"><b>Total marks till now: <%=iTotalMarks %></b></div>
	 			<form method="post" action="modified.jsp" >
					<table border="0">
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
						<% String url = "deleteQues.jsp?quesno=" + quesno;  %>
						<center>
							<input type="submit" name="mode" value="Done" id="mode">
							<% 	if(quesno < ques_list.size())
							{
						%>	
								<input type="submit" name="mode" value="Next" id="mode" onclick="javascript:jah3('modifyTest2.jsp','insert_response')">
						<%
							}
							else
							{
							
						 %>	
								<input type="submit" name="mode" value="Add More" id="mode" onclick="javascript:jah5('addMoreQues.jsp','insert_response')">
						<%	}
						 %>		
							<input type="submit" name="mode" value="Delete" id="mode" onclick="javascript:jah1('<%=url%>','insert_response')">
						</center>
					</form>
			<%}	%>
				</div>	
			</div>
			
			
			
		
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
			<b><u>Questions</u></b><br>
			<%
				for(i = 0;i < ques_list.size();i++)
				
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
