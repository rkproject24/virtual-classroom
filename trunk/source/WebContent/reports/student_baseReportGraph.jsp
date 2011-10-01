<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.beans.classReport"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreeBarChartGenerator"%>
<%@page import="java.io.OutputStream"%>

<%@page import="com.ignou.vcs.beans.major_studentBase"%><html:html>
<head>
<script>
function resize() {
	window.resizeTo(630,300);
}
</script>
<title>classReport</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body onLoad="javascript:resize()">

<%
	String facId = (String)request.getSession().getAttribute("userId");
	System.out.println("faciddd"+facId);
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	ArrayList seriesMembers = new ArrayList();
	ArrayList categoryMembers = new ArrayList();
	ArrayList data = new ArrayList();
	
	seriesMembers.add("MaxMarks");
	seriesMembers.add("HighestMarks");
	seriesMembers.add("TotalMarks");
	
	for( int i = 0; i < list.size(); i++ ) {
		
		major_studentBase report = (major_studentBase)list.get(i);
		String testName = report.getTest_name();
		categoryMembers.add(testName);
		//double d = Double.parseDouble(Integer.toString(report.getMaxmarks()));
		data.add(Integer.toString(report.getMaxmarks()));
	}
	for( int i = 0; i < list.size(); i++ ) {
		
		major_studentBase report1 = (major_studentBase)list.get(i);
		data.add(Integer.toString(report1.getHighestMarks()));
	}
	for( int i = 0; i < list.size(); i++ ) {
		
		major_studentBase report2 = (major_studentBase)list.get(i);
		data.add(Integer.toString(report2.getMarksObtained()));
	}
	
	JFreeBarChartGenerator chartObject = new JFreeBarChartGenerator();
	
	chartObject.setChartData(seriesMembers,categoryMembers,data);
	
	OutputStream outStream = response.getOutputStream();
	response.setContentType("image/png");
	
	chartObject.createFinalChart("Student's Performance" , "Minor Tests" , "Marks Scored" , outStream);
	
 %>
</body>
</html:html>
