<%@page import="java.util.ArrayList"%>
<%@ page import="com.ignou.vcs.report.beans.*,com.ignou.vcs.report.database.*;" %>
<%
	String testId =(String)request.getSession().getAttribute("testId");
	int testid = Integer.parseInt(testId);
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	java.util.ArrayList list = dbObj.getStudentList(testid);	
%>
<table>
	<tr><th class="top"><u>Student Id</u></th><th class="top" scope="col"><u>Student Name</u></th>
	<th class="top"><u>Marks Scored</u></th></tr>
					
	 <%
	 	for(int i=0;i<list.size();i++)
	 	{
	 		com.ignou.vcs.report.beans.StudentBean bean = (com.ignou.vcs.report.beans.StudentBean)list.get(i);
	 		String studentId = bean.getStudentid();
	 		String name = bean.getName();
	 		String marks = bean.getTotalMarks();
	 %>
	<tr><th scope="row"><%=studentId %></th><td><%= name %></td><td><%= marks %></td></tr>
	 <%
	 	}
	  %>
	</table>  		