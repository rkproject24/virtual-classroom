<%@page import="com.ignou.vcs.beans.Syllabus,com.ignou.vcs.xml.addXML"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="java.util.ArrayList"%>
<%
	String courseid = request.getParameter("courseid");
	String subjectid = request.getParameter("subjectid");

	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	ArrayList syllabus = (ArrayList)dbObj.getSyllabus(courseid,subjectid);
	
%>
	

	<br>
	<%
	for(int i = 0;i<syllabus.size();i++)
	{
		Syllabus bean = (Syllabus)syllabus.get(i);
		String unitname = bean.getUnitname();
		String topics = bean.getTopics();
		unitname = addXML.unescapeForXML1(unitname);
		topics = addXML.unescapeForXML1(topics);
	%>
	<p>
	<b><u>Unit No: </u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= (i + 1) %><br>
	<b><u>Unit Name:</u></b> &nbsp;&nbsp;&nbsp; <%= unitname %><br>
	<b><u>Topics: </u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= topics %><br><br>
	</p>
<%}
 %>
