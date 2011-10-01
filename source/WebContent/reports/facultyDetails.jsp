<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.database.ReportDatabaseActivities"%>
<%

	String subjectid = request.getParameter("subjectid");
	int isubjectid = Integer.parseInt(subjectid);
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	ArrayList facultyList = (ArrayList)dbObj.getFaculty(isubjectid);
	
	%>
	<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.beans.FacultyBean"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><table>
	<tr>
		<td><b>Name</b></td>
		<td><b>Email</b></td>
		<td><b>Course</b></td>
	</tr>
	<%
	for(int i =  0;i<facultyList.size();i++)
	{
		FacultyBean bean = (FacultyBean)facultyList.get(i);
		String facultyid = (String)bean.getUserID();	
		String name = (String)bean.getName();
		String emailP = (String)bean.getEmailP();
		String course = (String)bean.getCourseID();
		Utilities ob = new Utilities();
		ArrayList courseIdList = ob.getSeparateValue(course);
		ArrayList coursenameList = new ArrayList();
		VCSDatabaseActivities dbObj1 = new VCSDatabaseActivities();
		%>
		<tr>
			<td><%=name%></td>
			<td><%=emailP%></td>
			<td>
		<%
		System.out.println("courseIdList.size()" + courseIdList.size());
		for(int j = 0;j < courseIdList.size();j++)
		{
			String tempcourseid = (String)courseIdList.get(j);  
			
			String tempCourseName = dbObj1.getCourseName(tempcourseid);
			String url = "facultyGraph.jsp?courseid=" + tempcourseid + "&facultyid=" + facultyid;
		%>
		
			<a href = "<%=url %>" target = "new"><%=tempCourseName%></a><%="|" %>
		<%	
		}%>
	</td></tr>
	<%
	}
	%>
	</table>
