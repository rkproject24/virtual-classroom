<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.beans.classReport"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreeBarChartGenerator"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreeBarChartGeneratorNew"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>
<html:html>
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
	ArrayList classData = (ArrayList)request.getSession().getAttribute("classGraphData");
	ArrayList seriesMembers = new ArrayList();
	ArrayList categoryMembers = new ArrayList();
	ArrayList data = new ArrayList();
	
	seriesMembers.add("Marks");
	
	for( int i = 0; i < classData.size(); i++ ) {
		classReport bean = (classReport) classData.get(i);
		String name = bean.getStudentname() + " (" + bean.getUserid() + ")";
		categoryMembers.add(name);
		data.add(bean.getTotalmarks());
	}

	JFreeBarChartGeneratorNew chartObject = new JFreeBarChartGeneratorNew();
	
	chartObject.setChartData(seriesMembers,categoryMembers,data);
	
	//OutputStream outStream = response.getOutputStream();
	response.setContentType("image/png");
	
	chartObject.createFinalChart("Class Performance" , "Students" , "Marks Scored" , "graph");
	String image = Utilities.CHARTS_FILES_TEMP_PATH + "\\graph.jpeg";
	String imageLink = "http://localhost:8080/VCS/displayImage.jsp?fp=" + image + "&tp=jpeg";
	
 %>

<img src="<%= imageLink %>" >
</body>
</html:html>
