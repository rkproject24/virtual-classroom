<%@ page import="com.ignou.vcs.report.beans.*,com.ignou.vcs.report.database.*;" %>
<%
	String courseId = request.getParameter("cid");
	String subId = request.getParameter("sid");
	request.getSession().setAttribute("cid",courseId);
	String testType = (String)request.getSession().getAttribute("testType");
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	testBean testBean = (testBean)dbObj.getTest(courseId,subId);
	String testId = (Integer.toString(testBean.getTestId()));
	request.getSession().setAttribute("testId",testId);
	request.getSession().setAttribute("testBean",testBean);
	int highest = testBean.getHighestMarks();
%>
<table>
	<tr><th class="top"><u>Test Name</u></th><th class="top" scope="col"><u>Syllabus</u></th>
	<th class="top"><u>Max Marks</u></th><th class="top"><u>Pass Marks</u></th><th class="top"><u>View Performance</u></th></tr>
					
	 <%
	 	String testName = testBean.getTestName();
	 	String syllabus = testBean.getSyllabus();
	 	int maxmarks = testBean.getMaxMarks();
	 	int passmarks = testBean.getPassMarks();
	 	
	 
	 %>
	<tr><th scope="row"><%=testName %></th><td><%= syllabus %></td><td><%= maxmarks %></td><td><%= passmarks %></td>
	<td><a href="class_performanceGraph.jsp" accesskey="m" target="new">Graphical Analysis</a>/
	<a href="javascript:jah('faculty_MajorNew.jsp','forms')" accesskey="m">View Report</a></tr>
</table>
	