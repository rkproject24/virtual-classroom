<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%><html:html>
<head>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<title>addMOreQues</title>
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
		ArrayList ques_list = (ArrayList)request.getSession().getAttribute("old_list");
		String flag = request.getParameter("flag");
		System.out.println("FLAG " + flag);
		
		String quesno_new = request.getParameter("quesno");
		System.out.println("QUESN" + quesno_new);
		String ques_new = request.getParameter("ques");
		String marks_new = request.getParameter("marks");
	 	String totalMarks = (String)request.getSession().getAttribute("totalMarks");
	 	String maxMarks = (String)request.getSession().getAttribute("maxMarks");
			
		int iTotalMarks = Integer.parseInt(totalMarks);
	 	if(flag.equals("0"))
	 	{
			
			iTotalMarks = iTotalMarks + (Integer.parseInt(marks_new));
		
			request.getSession().setAttribute("totalMarks",Integer.toString(iTotalMarks));
		 	
		 	Test_paper paperBean = new Test_paper();
			ques_new = addXML.unescapeForXML(ques_new); 
			paperBean.setQues(ques_new);
			paperBean.setQuesno(Integer.parseInt(quesno_new));
			paperBean.setQuesmarks(marks_new);
			ques_list.add(paperBean);
	 	}
	 	else
	 	{
	 		String marks_old = (String)request.getSession().getAttribute("old_marks");
	 		iTotalMarks = iTotalMarks - (Integer.parseInt(marks_old)) + (Integer.parseInt(marks_new));
	 		request.getSession().setAttribute("totalMarks",Integer.toString(iTotalMarks));
	 		Test_paper paperBean = new Test_paper();
			ques_new = addXML.unescapeForXML(ques_new); 
			paperBean.setQues(ques_new);
			paperBean.setQuesno(Integer.parseInt(quesno_new));
			paperBean.setQuesmarks(marks_new);
			
			ques_list.set((Integer.parseInt(quesno_new) - 1),paperBean);
			
		}	
		
	 %>
	<div align = "right"><b>Total marks till now: <%=iTotalMarks %></b></div>
	<form method="post" action="${pageContext.request.contextPath}/faculty/exam/modified.jsp">
					<input type = "hidden" name = "flag" id = "flag" value="0">
					<table border="0">
						<tbody>
							<tr>
								<td><b>Question No:</b></td>
								<td><input type="text" name="quesno" size="20" id="quesno" value="<%= (Integer.parseInt(quesno_new) + 1)%>" disabled></td>
									<input type = "hidden" name = "quesNo" id = "quesNo" value = "<%= (Integer.parseInt(quesno_new) + 1)%>">
							</tr>
							<tr>
								<td><b>Marks : </b></td>
								<td><input type="text" name="marks" size="20" id="marks" value = ""></td>
							</tr>
							<tr>
								<td><b>Question :</b></td>
								<td><textarea rows="10" cols="35" name="ques" id="ques"></textarea></td>
							</tr>
						
						</tbody>
						</table><br>
						
						<center>
							<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=iTotalMarks%>,<%=maxMarks%>)">
						
							<input type="submit" name="mode" value="Add More" id="mode" onclick="javascript:jah6('addMoreQues.jsp','insert_response')">
							
							
						</center>
					</form>
					
			</div>	
			</div>
			
			
			
		
		
		<div id="right">
			<div class="boxtop"></div>
			<div class="box">
			<b><u>Questions</u></b><br>
			<%
				for(int i = 0;i < ques_list.size();i++)
				
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
