<%@page import="com.ignou.vcs.beans.Syllabus,com.ignou.vcs.xml.addXML"%>
<%
	String userid = (String)request.getSession().getAttribute("userId");
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	FacultyBean fbean = db_obj.getFacultyDetails(userid);
	String subjectid = fbean.getSubjectID();
	
	String courseid = request.getParameter("q");
	java.util.ArrayList syllabus = db_obj.getSyllabus(courseid,subjectid);
	request.getSession().setAttribute("courseid",courseid);
	request.getSession().setAttribute("subjectid",subjectid);
 %>


<%@page import="com.ignou.vcs.beans.Syllabus"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.FacultyBean"%>
<%@page import="com.ignou.vcs.xml.addXML"%><html>
<body>
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

<br>

<a href="#" class="greenbtn" onclick = "jah('view_students.jsp','id1')"><span>View Students</span></a> 
</body>
</html>
