<%
	
	String courseid = request.getParameter("courseid");
	
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	System.out.println("Courseid :" + courseid);
	java.util.ArrayList list = dbObj.getSubjects(courseid,true);
	System.out.println("list size :" + list.size());
%>	

	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%><div class="boxtop"></div>
		<div class="box">
		<p><b><u>Subjects</u></b><br />
		<%
		for(int i = 0;i < list.size();i++)
		{
			SubjectBean subBean  = new SubjectBean();
			VCSDatabaseActivities db_obj2 = new VCSDatabaseActivities();
			
			subBean = (SubjectBean)list.get(i);
			String subjectid = subBean.getSubjectId();
			String subjectname = subBean.getSubjectName();
			
			String url = "display_syllabus.jsp?subjectid=" + subjectid +"&courseid=" + courseid;
			%>
			<a href="javascript:jah1('<%=url %>','id1')"><%=subjectname %></a><br />
		<%
		}
		 %>
