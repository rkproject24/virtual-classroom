<%@page import="java.util.ArrayList"%>
<%
	String testType = request.getParameter("testType");
	String facultyid = (String)request.getSession().getAttribute("userId");
	
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	ArrayList testList = (ArrayList)dbObj.getTestList(facultyid,Integer.parseInt(testType));
	
%>
	<%@page import="com.ignou.vcs.beans.getTests"%>

<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><table>
		<tr>
			<td><b>TestName</b></td>
			<td><b>Course</b></td>
		</tr>
		
<%
	for(int i = 0;i < testList.size();i++)
	{
		getTests TestBean = (getTests)testList.get(i);
		String testName = TestBean.getTest_name();
		String course = TestBean.getCourseid();
		String testid = TestBean.getTestid();
		String maxmarks = TestBean.getMax_marks();
		String url = "modifyTest1.jsp?testid=" + testid + "&maxmarks=" + maxmarks;; 
%>
	<tr>
		<td><a href = "<%=url %>" ><%=testName %></a></td>
		<td><%=course %></td>
	</tr>
<%
	}
 %>
 	</table>						