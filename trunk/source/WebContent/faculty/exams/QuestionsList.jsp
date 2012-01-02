<%
	String course = request.getParameter("i");
	int courseId = Integer.parseInt(course);
	ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
	
	ArrayList<QuestionBean> questions = eda.getCourseQuestions(courseId);
 %>
 


<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="com.ignou.vcs.exams.beans.QuestionBean"%>

<div >
<table>
					<%
					for(int i = 0;i<questions.size();i++)
					{
						QuestionBean qb = questions.get(i);
						
						%>
						<tr><td><%=i+1 %></td>
						<td><%=qb.getQuestion() %></td>
						<td>
							<a href="javaScript: self.parent.location.href='UpdateQuestion.jsp?q=<%=qb.getQuestionId() %>'" class="bluebtn">Update</a>
							<a href="javaScript: self.parent.location.href='DeleteQuestion.jsp?q=<%=qb.getQuestionId() %>'" class="bluebtn">Delete</a>
					</td></tr>
						<%
					} 
					%>
</table>
			</div>