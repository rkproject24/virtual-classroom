<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%>

<%@page import="com.ignou.vcs.exams.database.ExamsDatabaseActivities"%>
<%@page import="com.ignou.vcs.exams.beans.ExamBean"%>
<%
	String subject = request.getParameter("s");
	String course = request.getParameter("c");
	ExamsDatabaseActivities eda = new ExamsDatabaseActivities();
	ArrayList<ExamBean> allExams= eda.getAllSubjectExams(Integer.parseInt(subject));
 %>
<center>

<table>
<%
		if(allExams.size()>0)
		{
%>
		<tr><td>S.No</td><td>Exam Name</td></tr>

			<%
			for(int i = 0;i<allExams.size();i++)
			{
				ExamBean eb = allExams.get(i);
			%>
			<tr><td><%=i+1 %></td><td><a href=""><%=eb.getExamName() %></a><br /></td></tr>
			<%
			} 
		}else
		{
			out.println("<tr><td><font color='red'>No exams available.</font></td></tr>");
		}
		%>
	</table>
<div class="buttons">
		<p><a href="javaScript: self.parent.location.href='AddExam.jsp?c=<%=course %>&s=<%=subject %>'" class="bluebtn"><span>Add Exam</span></a></p>
	</div>
</center>