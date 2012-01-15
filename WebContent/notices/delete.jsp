<%@page import="com.ignou.vcs.notices.database.NoticesDatabaseActivities"%>
<%

	String[] noticeValues = request.getParameterValues("notice");
	NoticesDatabaseActivities dbObj = new NoticesDatabaseActivities();
	
	for(int i = 0 ;i<noticeValues.length;i++)
	{
		String noticeid = noticeValues[i];
		dbObj.deleteNotice(noticeid);	
	}
	response.sendRedirect("http://localhost:8080/VCS/home.jsp");
%>	  