<%@ page import = "com.ignou.vcs.xml.addXML" %>
<%@ page import = "java.util.*" %>

<%

	String quesno = request.getParameter("quesno");
	String ques = request.getParameter("ques") ;
	String ans  = request.getParameter("ans");
	
	
	String testid = (String)request.getSession().getAttribute("testid");
	
	int quesno1 = Integer.parseInt(quesno);
	
	AnswerBean soln = new AnswerBean();
	ans = addXML.unescapeForXML(ans);
	soln.setAnswer(ans);
	soln.setQuesno(quesno1);
	
	ArrayList ques_list = (ArrayList)request.getSession().getAttribute("ques_list");
	ArrayList soln_list = (ArrayList)request.getSession().getAttribute("soln_list");
	soln_list.add(soln);
	
	request.getSession().setAttribute("quesno",quesno);
	
	
	
	Test_paper test_Paper = (Test_paper)ques_list.get(quesno1);

	String ques2 = test_Paper.getQues();
	String marks = test_Paper.getQuesmarks();
	ques2 = addXML.unescapeForXML1(ques2);
%>
		
<%@page import="com.ignou.vcs.beans.AnswerBean"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%><form method = "post" action = "done_soln.jsp">
		<table>
		<tr><td>
		<b> Ques No:</b></td><td><b> <%=(quesno1+1) %> </b></td>
		</tr>
		<tr>
				<td>
					<b> Marks</b></td><td><b> <%=marks %> </b>
				</td>
			</tr>
		<tr>
		<td><b> Question: </b> </td><td><b> <%= ques2 %></b>
		</td></tr>
		<tr><td>
		<b> Answer </b> </td><td>
		<textarea rows="5" cols="30" name="answer" id = "answer1"></textarea>
		</td></tr>
		
		<input type = "hidden" name = "quesno3" id = "quesno1" value = "<%=(quesno1 + 1)%>" >
		<input type = "hidden" name = "ques3" id = "ques1" value = "<%= ques2 %>" >
		
		
		<tr><td>
		<input type="submit" name="mode" value="Done" id = "mode">	
		</form>
		<form>
		
		</td><td><%if(quesno1 < (ques_list.size()-1))
		{
			 %><input type="submit" name="mode" id = "mode" value="Next" onclick = "javascript:jah1('post_exam_soln.jsp','inner_response','Next');" >
		</td></tr>
		<%} %>
		</table>
		</form>