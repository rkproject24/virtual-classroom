<%
	String courseid = request.getParameter("i");
	
	VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
	ArrayList<SubjectBean> subjects = db_ob.getSubjects(courseid,false);
 %>



<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%>
<center>
	<table>
		<tr><td>S.No</td><td>Subject Name</td></tr>

		<%
		for(int i = 0;i<subjects.size();i++)
		{
			SubjectBean sb = subjects.get(i);
			String subjectName = sb.getSubjectName();
			String subject = sb.getSubjectId();
		%>
		<tr><td><%=i+1 %></td><td><a href="javaScript: addExam('<%=subject %>')"><%=subjectName %></a><br /></td></tr>
		<%} %>
	</table>
</center>