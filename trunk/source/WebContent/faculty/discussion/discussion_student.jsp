<%
	String subjectid = request.getParameter("subjectid");
	String courseid = request.getParameter("courseid");
	
	
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	java.util.ArrayList schedule = db_obj.getSchedule(subjectid,courseid,"0");
	%>
	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Schedule"%>
<%@page import="com.ignou.vcs.beans.FacultyBean"%><table>
		<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Date</u></th><th class="top" scope="col"><u>Time</u></th><th class="top" scope="col"><u>Organized By</u></th></tr>
	<%
	for(int i = 0;i<schedule.size();i++)
	{
		Schedule scheduleForm = (Schedule)schedule.get(i); 
		String title = scheduleForm.getTitle();
		String Date = scheduleForm.getDate();
		String Time = scheduleForm.getTime();
		String duration = scheduleForm.getDuration();
		String description = scheduleForm.getDescription();
		String organizedby = scheduleForm.getOrganizedBy();
		VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
		FacultyBean facultyInfo = db_ob.getFacultyDetails(organizedby);
		String facultyname = facultyInfo.getName();   
		String url = "student_description.jsp?description=" + description;
	%>
		<tr><th scope="row"><a href="#" onclick = "javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= Date %></td><td><%= Time %></td><td><%=facultyname %></td></tr>
	<%}
	
	
%>
</table>
	