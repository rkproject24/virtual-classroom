<%
	String courseid = request.getParameter("i");
	
	VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
	ArrayList<SubjectBean> subjects = db_ob.getSubjects(courseid,false);
 %>
 


<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Test"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%>

<div class="boxtop"></div>
<div class="box">
				<p>
					<b><u>Subjects</u></b><br />
					<%
					for(int i = 0;i<subjects.size();i++)
					{
						SubjectBean sb = subjects.get(i);
						String subjectName = sb.getSubjectName();
						String subject = sb.getSubjectId();
					%>
					<a href="javascript: getExams('ExamsList.jsp?c=<%=courseid %>','id1','<%= subject%>')"><%=subjectName %></a><br>
					<%} 
					%>
				</p>
			</div>