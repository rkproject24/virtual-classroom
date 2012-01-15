<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.beans.minorBean"%>

<%@page import="com.ignou.vcs.chartGenerators.JFreePieChartGenerator"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="com.ignou.vcs.chartGenerators.JFreePieChartGeneratorNew"%>
<html:html>
<head>
<script>
function resize() {
	window.resizeTo(630,300);
}
</script>
<title>displayGraphs</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body onLoad="javascript:resize()">

<%
		ArrayList graphData = (ArrayList) request.getSession().getAttribute("graphData");
		ArrayList chartMembers = new ArrayList();
		ArrayList percentages = new ArrayList();
		String totalMarks = (String)request.getSession().getAttribute("tm");
		System.out.println ("Total Marks:" + totalMarks);
		double tmDouble = (Double.valueOf(totalMarks)).doubleValue();
		String chartName = "sampleChart";
		for (int i = 0; i < graphData.size(); i++) {
		minorBean bean = (minorBean) graphData.get(i);
		String quesString = "Question " + bean.getQuesno();
		chartMembers.add(quesString);
		String marks = bean.getMarks();
		double marksDouble = (Double.valueOf(marks)).doubleValue();
		double perc = (marksDouble / tmDouble) * 100;
		String percString = perc + "";
		System.out.println("Question:" + quesString);
		System.out.println("Percentage:" + percString);
		percentages.add(percString);
	}

	//OutputStream outStream = response.getOutputStream();
	JFreePieChartGeneratorNew chartGenerator = new JFreePieChartGeneratorNew();
	chartGenerator.setChartMembersAndPercentages(chartMembers,
			percentages);
	
	response.setContentType("image/png");
	chartGenerator.generateFinalChart("chart" , "sampleChart");
	String image = Utilities.CHARTS_FILES_TEMP_PATH + "\\sampleChart.jpeg";
	String imageLink = "http://localhost:8080/VCS/displayImage.jsp?fp=" + image + "&tp=jpeg";
	
%>

<img src="<%= imageLink %>" >
</body>
</html:html>
