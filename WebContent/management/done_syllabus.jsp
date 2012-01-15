
<%@page import="com.ignou.vcs.beans.Syllabus"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><%@page import="java.util.ArrayList"%>
<%@ page import = "com.ignou.vcs.xml.addXML" %>
<%
	String unitno = request.getParameter("unitno");
	String unitname = request.getParameter("unitname");
	String topics = request.getParameter("topics");
	
	String xmlDoc = "";
	String subjectid = (String)request.getSession().getAttribute("subjectid");
	String courseid = (String)request.getSession().getAttribute("courseid");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	String subjectname = dbObj.getSubjectName(subjectid);
	
	String filename = "C:\\" + courseid + "_" + subjectid + ".xml";
	int iunitno = Integer.parseInt(unitno);
	addXML obj = new addXML();
	
	unitname = addXML.unescapeForXML(unitname);
	topics = addXML.unescapeForXML(topics);
	
	Syllabus syllabusbean = new Syllabus();
	syllabusbean.setUnitno(iunitno);
	syllabusbean.setUnitname(unitname);
	syllabusbean.setTopics(topics);
	
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	list.add(syllabusbean);
	
	addXML obj1 = new addXML();
	obj1.syllabusXML(list,filename);
	
	xmlDoc = obj1.readXML(filename);
	
	dbObj.syllabusXML(xmlDoc,courseid,subjectid);
	
%>