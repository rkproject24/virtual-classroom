<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="java.util.*"%>
<%
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String courseid = request.getParameter("courseid");
	String subjectid = request.getParameter("subjectid");
	int flag =0;
	String userid = (String)request.getSession().getAttribute("userId");
	System.out.println(date +" "+ time + " " + courseid + " " + subjectid); 
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	if(subjectid.equals("null"))
	{
		
		Utilities util = new Utilities();
		ArrayList courseList = util.getSeparateValue(courseid);
		for(int i = 0;i < (courseList.size() - 1);i++)
		{
			String temp = (String)courseList.get(i);
			
			flag = dbObj.CheckTimeslotMgmt(date,time,1,temp,userid);
			if(flag == 1)
				break;
		}
	}
	else
	{
		Utilities util = new Utilities();
		ArrayList subjectList = util.getSeparateValue(subjectid);
		for(int i = 0;i < (subjectList.size() - 1);i++)
		{
			String temp = (String)subjectList.get(i);
			
			flag = dbObj.CheckTimeslotMgmt(date,time,0,temp,userid);
			if(flag == 1)
				break;
		}
	}
	
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
	
