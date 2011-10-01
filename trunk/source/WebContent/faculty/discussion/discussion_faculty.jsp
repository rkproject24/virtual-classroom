<%
	String type = request.getParameter("type");
	String userid = request.getParameter("userid");
	String mgmtName = "";
	String designation = "";
	VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
	java.util.ArrayList schedule = db_ob.getFacultySchedule(type,userid);
	%>
	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Schedule"%>
<%@page import="com.ignou.vcs.beans.MgmtBean"%><table>
		<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Date</u></th><th class="top" scope="col"><u>Time</u></th>
		<%
			if(type.equals("Mgmt"))
			{	
		 %>
			<th class="top" scope="col"><u>OrganizedBy</u></th>
			<%} %>
		</tr>
	<%
	for(int i =0;i<schedule.size();i++)
	{
		Schedule scheduleForm = (Schedule)schedule.get(i);
		String title = scheduleForm.getTitle();
		String Date = scheduleForm.getDate();
		String Time = scheduleForm.getTime();
		String duration = scheduleForm.getDuration();
		String description = scheduleForm.getDescription();
		String organizedBy = scheduleForm.getOrganizedBy(); 
		if(type.equals("Mgmt"))
			{	
		VCSDatabaseActivities db_ob1 = new VCSDatabaseActivities();
		MgmtBean bean = db_ob1.getMgmDetails(organizedBy);
		mgmtName = bean.getName();
		designation = bean.getDesignation(); 
		}
		String url = "discussion_description.jsp?description=" + description + "&title=" + title + "&type=" + type;
		%>
		<tr><th scope="row"><a href="#" onclick = "javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= Date %></td><td><%= Time %></td>
		<%
		if(type.equals("Mgmt"))
			{	
		%>	<td><%=mgmtName + "(" + designation +")"%></td>	
		 <%} %>
		</tr>
	<%}
	
	
%>
</table>
	
	