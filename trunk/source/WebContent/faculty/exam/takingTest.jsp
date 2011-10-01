<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>

<html:html>
<head>
<script language="javascript">
function document.onkeydown()
{
if ( event.keyCode==116)
{
event.keyCode = 0;
event.cancelBubble = true;
return false;
}
}
</script>
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
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/countDown.js"></script>
</head>
<body onload = "javascript:loadCss()">
<%@include file="../../header.jsp" %>
<%
	
	String duration = (String)request.getSession().getAttribute("duration"); %>

	<div id="content">
		<img src="${pageContext.request.contextPath}/theme/images/vcs.jpg" height="71" width="190">
		<div class="left">
			<div class="left_articles">
		<form name="cd">
				<div align = "right">
				<b>Time Left: </b>
				
				
				<input id="txt" readonly="true" type="text" value="<%=duration %>" border="0" name="disp">
					
				</div>
				</form>	
			</div>
		</div>			
		<div id = "inner_response">	
		<div class="left">
			<div class="left_articles">
				
				
				<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax_student.js"></script>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_student_js.js"></script>		
				
		<%
		String quesno = (String)request.getSession().getAttribute("quesno");	
			
		System.out.println("QUESNO:" + quesno);
		int quesno1 = Integer.parseInt(quesno);
		String userid = (String)request.getSession().getAttribute("studentid");
		
		String testid = (String)request.getSession().getAttribute("testid");
		System.out.println("TESTID HERE:joj " + testid);
		int itestid = Integer.parseInt(testid);
		System.out.println("TESTID HERE: " + itestid);
		VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
		
		int flag = 0;
		
		flag = db_obj.check(itestid,userid);
		
		if(flag == 1)
		{
		%> 	<br><br>
			<b>You have given this test</b>
		<%
		
		}
		else
		{
			
			VCSDatabaseActivities testPaper = new VCSDatabaseActivities();
			com.ignou.vcs.forms.Test_paper test_Paper = new com.ignou.vcs.forms.Test_paper();
			System.out.println(testid);
			ArrayList ques_list = testPaper.getPaper(testid); 
			int noOfQues = ques_list.size();
			
			request.getSession().setAttribute("ques_list",ques_list);
			String ques ="";
			String marks = "";
			String solnFile = "C:\\" + "file_" + testid +"_" + userid +  ".xml";
			request.getSession().setAttribute("solnFile",solnFile);
			
			
			
			
			if(quesno1 == 0)
			{	
				test_Paper = (com.ignou.vcs.forms.Test_paper)ques_list.get(quesno1);
				
				ques = test_Paper.getQues();
				marks = test_Paper.getQuesmarks();
				ques = addXML.unescapeForXML1(ques);
			}
			if(quesno1 > 0)
			{
				
				ques = request.getParameter("ques") ;
				String ans  = request.getParameter("ans");
				quesno1 = Integer.parseInt(quesno);
				
				com.ignou.vcs.beans.AnswerBean soln = new com.ignou.vcs.beans.AnswerBean();
				ans = addXML.unescapeForXML(ans);
				soln.setAnswer(ans);
				soln.setQuesno(quesno1);
				
				ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
				ArrayList soln_list = (ArrayList)request.getSession().getAttribute("soln_list");
				soln_list.add(soln);
				request.getSession().setAttribute("soln_list",soln_list);
				test_Paper = (com.ignou.vcs.forms.Test_paper)ques_list.get(quesno1);

				ques = test_Paper.getQues();
				marks = test_Paper.getQuesmarks();
				ques = addXML.unescapeForXML1(ques);
			}
			
			%>
			
			<form method = "post" action = "done_soln.jsp">
			<table>
			<tr>
				<td>
					<b> Ques No:</b></td><td><b> <%=(Integer.parseInt(quesno)+1) %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Marks</b></td><td><b> <%=marks %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Question: </b> </td><td><b> <%= ques %></b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Answer: </b> </td><td>
					<textarea rows="5" cols="30" name="answer" id = "answer1"></textarea>
				</td>
			</tr>
			
			<input type = "hidden" name = "quesno" id = "quesno" value = "<%=(quesno1 + 1)%>" >
			<input type = "hidden" name = "ques" id = "ques" value = "<%= ques %>" >
			
			
			<tr><td>
			<input type="submit" name="mode" value="Done" id = "mode">	
			</form>
			<form>
			
			</td><td><%if(quesno1 < (ques_list.size()-1))
			{
				 %><input type="submit" name="mode" id = "mode" value="Next" onclick = "javascript:jah1('takingTest2.jsp','inner_response','Next');" >
			</td></tr>
			<%} %>
				</table>
				</form>
			
			
	
				</div>	
			</div>
		
		<div id = "right">
			<div class="boxtop"></div>
			
			<div class="box">
			<p><b><u>Questions</u></b><br />
			<%
			int flag_ans[] = (int[])request.getSession().getAttribute("flag"); 
			for(int i = 1;i <= noOfQues;i++)
			{
				
				System.out.println(flag_ans[i] + " ");
				String url = "takingTest3.jsp?quesno=" + i; 
			%>
			<a href = "javascript:jah2('<%=url %>','inner_response')"><font color = "green"><%=i %></font></a>
			&nbsp&nbsp&nbsp&nbsp&nbsp
			<%} %>
			</div>
		
		</div>
		</div>
	</div>
	<%
	} 
	%>
</body>
</html:html>
