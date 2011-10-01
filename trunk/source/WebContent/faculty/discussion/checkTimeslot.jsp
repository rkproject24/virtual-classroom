<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>

<%
	String userid = (String)request.getSession().getAttribute("userId");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String courseid = request.getParameter("courseid");
	System.out.println(date +" "+ time + " " + courseid); 
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	int flag = dbObj.CheckTimeslot(date,time,courseid,userid);
	
	if(flag == 0)
	{
	%>
		 Slot Available 
	<%
	}
	else
	{
	%>
		 Slot Not Available 
	<%
	}
	%>	




