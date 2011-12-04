<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<div class="left">
			<div class="left_articles">
				<div class="buttons">
					
				</div>
				<%@include file="../../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Modify Test</u></a></h2>
				<p class="description"></p>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/exam_js.js"></script>
				<script src="${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
				
<%
	
			String quesno_new = request.getParameter("quesno");
			String ques_new = request.getParameter("ques");
			String marks_new = request.getParameter("marks");
		
			String marks_old = (String)request.getSession().getAttribute("old_marks");
			String totalMarks = (String)request.getSession().getAttribute("totalMarks");
			System.out.println("marks_old " + marks_old + "totalMarks " + totalMarks); 
			int iTotalMarks = Integer.parseInt(totalMarks);
			iTotalMarks = iTotalMarks - (Integer.parseInt(marks_old)) + (Integer.parseInt(marks_new));
			
			request.getSession().setAttribute("totalMarks",Integer.toString(iTotalMarks));
			Test_paper paperBean = new Test_paper();
			ques_new = addXML.unescapeForXML(ques_new); 
			paperBean.setQues(ques_new);
			paperBean.setQuesno(Integer.parseInt(quesno_new));
			paperBean.setQuesmarks(marks_new);
			ArrayList old_list = (ArrayList)request.getSession().getAttribute("old_list");
			old_list.set((Integer.parseInt(quesno_new) - 1),paperBean);
			String maxMarks = (String)request.getSession().getAttribute("maxMarks");
			
			paperBean = (Test_paper)old_list.get(Integer.parseInt(quesno_new));
			
			int quesno = (Integer.parseInt(quesno_new)) + 1;
			String ques = paperBean.getQues();
			String quesMarks = paperBean.getQuesmarks();
			ques = addXML.unescapeForXML1(ques);
			request.getSession().setAttribute("old_marks",quesMarks);
%>	
	<div align = "right"><b>Total marks till now: <%=iTotalMarks %></b></div>
	<form method="post" action="modified.jsp" >
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
							<input type="submit" name="mode" value="Done" id="mode" onclick = "return checkMarks(<%=iTotalMarks%>,<%=maxMarks%>)">
						<% 	if(quesno < old_list.size())
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
				