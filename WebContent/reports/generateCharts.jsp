<%-- tpl:insert page="/theme/VCSTemplate.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<html:html>
<head>
<script type="text/javascript" language="javascript" >

function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
 	<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
 	
 
 <%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%><title>Virtual Classroom System</title>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.report.beans.minorBean"%>

<%@page import="com.ignou.vcs.chartGenerators.JFreePieChartGenerator"%>
<%@page import="java.io.OutputStream"%>


<%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Performance Report Chart</u></a></h2>
				<p class="description">Analyze your performace.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<%
	ArrayList graphData = (ArrayList) request.getSession().getAttribute("graphData");
	ArrayList chartMembers = new ArrayList();
	ArrayList percentages = new ArrayList();
	String totalMarks = request.getParameter("tm");
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

	OutputStream outStream = response.getOutputStream();
	JFreePieChartGenerator chartGenerator = new JFreePieChartGenerator();
	chartGenerator.setChartMembersAndPercentages(chartMembers,
			percentages);
	
	response.setContentType("image/png");
	chartGenerator.generateFinalChart(outStream , "sampleChart");

	
%>
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>