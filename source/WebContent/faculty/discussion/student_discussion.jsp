<%@ page import= "java.util.ArrayList" %>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.StudentBean"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%><script src = "${pageContext.request.contextPath}/faculty/discussion/ajax.js"></script>
<%
			String userid1 = (String)request.getSession().getAttribute("userId");
			VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
			
			request.getSession().setAttribute("studentid",userid1);
			StudentBean stu_bean = db_obj.getStudentDetails(userid1);
			String courseid = stu_bean.getCourseId();
			
			request.getSession().setAttribute("courseid", courseid);
			VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
			ArrayList getSubjects = new ArrayList();
			getSubjects = db_obj1.getSubjects(courseid, false);
	
	%>
	<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Subjects</u></b><br />
		<%
		for(int i = 0;i < getSubjects.size();i++)
		{
			SubjectBean subBean  = new SubjectBean();
			VCSDatabaseActivities db_obj2 = new VCSDatabaseActivities();
			
			subBean = (SubjectBean)getSubjects.get(i);
			String subjectid = subBean.getSubjectId();
			String subjectName = db_obj2.getSubjectName(subjectid);
			String url = "discussion_student.jsp?subjectid=" + subjectid +"&courseid=" + courseid;
			
			%>
			<a href="javascript:jah1('<%=url %>','id1')"><%=subjectName %></a><br />
		<%
		}
		 %>
		</p>

</div>