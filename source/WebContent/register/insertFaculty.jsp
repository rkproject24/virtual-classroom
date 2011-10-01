<%@ page import="com.ignou.vcs.registration.code.*,com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*" %>
<% 
	String appointmentId=(String)request.getSession().getAttribute("appointmentId");
	String subjectId=(String)request.getSession().getAttribute("subjectId");
	String userId=(String)request.getSession().getAttribute("userId");
	String courses=request.getParameter("courselist");
	System.out.println("appointmentId in insert page"+appointmentId);
	System.out.println("subjectId in insert page"+subjectId);
	System.out.println("managementId in insert page"+userId);
	System.out.println("courselist"+courses);
	RegistrationDatabaseActivities db = new RegistrationDatabaseActivities();
	CommonsDatabaseActivities db1 = new CommonsDatabaseActivities();
	int level=1;
	db.insertFaculty(appointmentId,subjectId,userId,courses);
	
%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><div id = "insert_response"></div>
<u><b>Faculty successfully recruited!!</b></u>