
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.beans.AnswerBean"%>
<%@page import="com.ignou.vcs.xml.addXML"%><script src = "${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
<%
	String testid = request.getParameter("testid");
	String studentid = request.getParameter("studentid");
	String quesno = (String)request.getSession().getAttribute("quesno");
	int quesno1 = Integer.parseInt(quesno);
	
	quesno1 = quesno1 + 1;
	request.getSession().setAttribute("testid",testid);
	quesno = Integer.toString(quesno1);
	
	request.getSession().setAttribute("quesno",quesno);
	request.getSession().setAttribute("studentid",studentid);
	
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
	java.util.ArrayList solution = db_obj.getSolution(testid,studentid);
	
 	java.util.ArrayList ques_list = db_obj.getPaper(testid);
 	
 	request.getSession().setAttribute("solution",solution);
 	request.getSession().setAttribute("ques_list",ques_list);
 	
 	Test_paper quesPaper = (Test_paper)ques_list.get(quesno1-1);
 	String ques = quesPaper.getQues();
 	String quesMarks = quesPaper.getQuesmarks();
 	AnswerBean ans = new AnswerBean();
 	String answer = "";
 	System.out.println("SOLUTION SIZE" + solution.size() + " " + quesno1);
 	for(int i = 0;i < ques_list.size();i++)
 	{  
 		ans = (AnswerBean)solution.get(i);
 		
 		int tempQuesno = ans.getQuesno();
 		String answ  = ans.getAnswer();
 		System.out.println("TEMPQUESNo " + tempQuesno + " " + answ);
 		if(tempQuesno == quesno1)
 		{
 			
 			answer = ans.getAnswer();
 		}	
 	}
 	
 	String total_marks = "0";
 	request.getSession().setAttribute("total_marks",total_marks);
 	java.util.ArrayList list = new java.util.ArrayList();
 	request.getSession().setAttribute("list",list);
 	
 	
 	answer = addXML.unescapeForXML1(answer);
 	ques = addXML.unescapeForXML1(ques);
	String url = "evaluation.jsp";
 %>


<p><b>Ques No</b>: <%=quesno %></p>
<p><b>Question</b> : <%=ques %></p>
<p><b>Marks</b> : <%=quesMarks %>
<p><b>Answer</b>: <%=answer %></p>
<form method = "post" action = "evaluation_done.jsp">
<input type="hidden" name="quesno" size="20" id = "quesno" value = "<%=quesno%>">
<input type="hidden" name="ques" size="20" id = "ques" value = "<%=ques%>">
<input type="hidden" name="answer" size="20" id = "answer" value = "<%=answer%>">

<table border="0">
	<tbody>
		<tr>
			<td><b>Marks:</b></td>
			<td><input type="text" name="marks" size="20" id = "marks"></td>
		</tr>
		<tr>
			<td><b>Total Marks:</b></td>
			<td><input type="text" name="total_marks" size="20" id = "total_marks" value = "<%=total_marks %>"></td>
		</tr>
		<tr>
			
			<td><input type="submit" name="Next" value="Next" onclick = "javascript:jah2('<%=url %>','id1')"></td>
			<td></td>
		</tr>
	</tbody>
</table>
</form>