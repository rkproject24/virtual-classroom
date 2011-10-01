<%
	String type = request.getParameter("type");
	String userid = request.getParameter("userid");
	
	VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
	
	java.util.ArrayList schedule = db_ob.getMgmtSchedule(type,userid);
	 
	%>
	
<%@page import="com.ignou.vcs.forms.Schedule"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><table>
		<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Date</u></th><th class="top" scope="col"><u>Time</u></th></tr>
	<%
	for(int i = 0;i<schedule.size();i++)
	{
		Schedule scheduleForm = (Schedule)schedule.get(i); 
		String title = scheduleForm.getTitle();
		String Date = scheduleForm.getDate();
		String Time = scheduleForm.getTime();
		String duration = scheduleForm.getDuration();
		String description = scheduleForm.getDescription();
		String url = "discussion_description.jsp?description=" + description  + "&title=" + title + "&type=0";
	%>
		<tr><th scope="row"><a href="#" onclick = "javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= Date %></td><td><%= Time %></td></tr>
	<%}
	
	
%>
</table>
	
	
