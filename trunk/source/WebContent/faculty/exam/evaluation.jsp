<%@ page import = "java.util.*" %>

<%@page import="com.ignou.vcs.beans.Answersheet"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.beans.AnswerBean"%>
<%@page import="com.ignou.vcs.xml.addXML"%><script src = "${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
<%
	String marks = request.getParameter("marks");
	String quesNo = request.getParameter("quesno");
	String Ques = request.getParameter("ques");
	String Answer = request.getParameter("answer");
	System.out.println(marks + " " + quesNo + " " +Answer); 
	

	Answersheet answerBean = new Answersheet();
	answerBean.setAnswer(Answer);
	answerBean.setQuesno(quesNo);
	answerBean.setMarks(marks);
	answerBean.setQues(Ques);
	
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	list.add(answerBean);
	
	String total_marks = (String)request.getSession().getAttribute("total_marks");
	int marks1 = Integer.parseInt(marks);
	int total_marks1 = Integer.parseInt(total_marks);
	
	total_marks1 = total_marks1 + marks1;
	request.getSession().setAttribute("total_marks",Integer.toString(total_marks1));
	
	String quesno = (String)request.getSession().getAttribute("quesno");
	int quesno1 = Integer.parseInt(quesno);
	
	quesno1 = quesno1 + 1;
	
	quesno = Integer.toString(quesno1);
	request.getSession().setAttribute("quesno",quesno);
	
	ArrayList ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
	ArrayList solution = (ArrayList)request.getSession().getAttribute("solution");
	Test_paper quesPaper = (Test_paper)ques_list.get(quesno1-1);
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
 	String ques = quesPaper.getQues();
 	String quesMarks = quesPaper.getQuesmarks();
 	String url = "evaluation.jsp";
 	
 	ques = addXML.unescapeForXML1(ques);
 	System.out.println("QUES" + ques);
 	answer = addXML.unescapeForXML1(answer);
 	
%>

<p><b>Ques No</b>: <%=quesno %></p>
<p><b>Question</b> : <%=ques %></p>
<p><b>Marks</b> : <%=quesMarks %>
<p><b>Answer</b>: <%=answer %></p>
<form method = "post" action = "evaluation_done.jsp">
<input type="hidden" name="quesno" id = "quesno" size="20"  value = "<%=quesno%>">
<input type="hidden" name="ques" id = "ques" size="20" value = "<%=ques%>">
<input type="hidden" name="answer" id = "answer" size="20" value = "<%=answer%>">
<table border="0">
	<tbody>
		<tr>
			<td><b>Marks:</b></td>
			<td><input type="text" name="marks" size="20" id = "marks"></td>
		</tr>
		<tr>
			<td><b>Total Marks:</b></td>
			<td><input type="text" name="total_marks" size="20" id = "total_marks" value = "<%=total_marks1 %>"></td>
		</tr>
		<tr>
			<%if(quesno1 < (ques_list.size()))
			{
			 %>
			<td><input type="submit" name="Next" value="Next" onclick = "javascript:jah2('<%=url %>','id1')"></td>
			<td></td>
			<%}
			else
			{
			 %>
			 <td><input type="submit" name="Done" value="Done"></td>
			<td></td>
			<%}
			 %>
		</tr>
	</tbody>
</table>
</form>