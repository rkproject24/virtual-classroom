<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*"%>


<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><script src="${pageContext.request.contextPath}/faculty/exam/js/ajax_student.js"></script>
<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_student_js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/faculty/exam/js/countDown.js"></script>
<%
		
		String userid = (String)request.getSession().getAttribute("studentid");
		
		String testid = request.getParameter("testid");
		int itestid = Integer.parseInt(testid);
		
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
			request.getSession().setAttribute("testid",testid);
			VCSDatabaseActivities testPaper = new VCSDatabaseActivities();
			System.out.println(testid);
			ArrayList ques_list = testPaper.getPaper(testid); 
			
			request.getSession().setAttribute("ques_list",ques_list);
			
			String solnFile = "C:\\" + "file_" + testid +"_" + userid +  ".xml";
			request.getSession().setAttribute("solnFile",solnFile);
			
			ArrayList soln_list = new ArrayList();
			request.getSession().setAttribute("soln_list",soln_list);
			
			String quesno = (String)request.getSession().getAttribute("quesno");	
			int quesno1 = Integer.parseInt(quesno);
			Test_paper test_Paper = (Test_paper)ques_list.get(quesno1-1);
	
			String ques = test_Paper.getQues();
			String marks = test_Paper.getQuesmarks();
			String ques2 = addXML.unescapeForXML1(ques);
			%>
			<form name="cd">
			<input id="txt" readonly="true" type="text" value="10:00" border="0" name="disp">
			</form>
			<form method = "post" onsubmit = "javascript:insert();">
			<table>
			<tr>
				<td>
					<b> Ques No:</b></td><td><b> <%=quesno %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Marks</b></td><td><b> <%=marks %> </b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Question: </b> </td><td><b> <%= ques2 %></b>
				</td>
			</tr>
			<tr>
				<td>
					<b> Answer: </b> </td><td>
					<textarea rows="5" cols="30" name="answer" id = "answer1"></textarea>
				</td>
			</tr>
			
			<input type = "hidden" id = "quesno1" value = "<%=quesno%>" >
			<input type = "hidden" id = "ques1" value = "<%= ques2 %>" >
			
			
			<tr><td>
			<input type="submit" name="mode" value="Done" id = "mode">	
			</form>
			<form>
			
			</td><td><input type="submit" name="mode" id = "mode" value="Next" onclick = "javascript:jah1('post_exam_soln.jsp','inner_response','Next');" >
			</td></tr>
			</table>
			</form>
		
		<%
		} 
		%>
	

