<%@ page import="com.ignou.vcs.report.database.*,com.ignou.vcs.beans.*;" %>
<% 
	String stuId = (String)request.getSession().getAttribute("stuId");
	String facId = (String)request.getSession().getAttribute("userId");
	String cId = (String)request.getSession().getAttribute("cid");
	String testType = (String)request.getSession().getAttribute("testType");
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	java.util.ArrayList list = (java.util.ArrayList)request.getSession().getAttribute("list");
	
%>
<table>
	<tr><th class="top"><u>Test Name</u></th><th class="top" scope="col"><u>Max Marks</u></th><th class="top"><u>Pass Marks</u></th>
	<th class="top"><u>Marks Obtained</u></th><th class="top"><u>Highest Marks</u></th></tr>
					
	 <%
						
						
		for(int j = 0;j<list.size();j++)
		{
			major_studentBase r = (major_studentBase)list.get(j);
					
			String testName = r.getTest_name();
			int maxMarks = r.getMaxmarks();
			int passMarks = r.getPassmarks();
			int marksObtained = r.getMarksObtained();
			int highest = r.getHighestMarks();
			
	%>					
	<tr><th scope="row"><%=testName %></th><td><%= maxMarks %></td><td><%= passMarks %></td><td><%= marksObtained %></td><td><%=highest %></td></tr>
	
	<%
		}	
		
	%>
</table>
	