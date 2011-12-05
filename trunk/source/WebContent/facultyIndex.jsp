<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>


<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="org.w3c.dom.Document"%><html:html>
<head>
<script type="text/javascript" language="javascript">
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
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style3.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style3.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="header.jsp" %>								
		<%!
			private static String getTagValue(String sTag, Element eElement) 
			{
				NodeList nlList = eElement.getElementsByTagName(sTag).item(0).getChildNodes();
			 
			        Node nValue = (Node) nlList.item(0);
			 
				return nValue.getNodeValue();
		    }
		%>
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<center><h3><i>Faculties Description</i></h3></center>
				<%
				DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			  	DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			  	Document doc = docBuilder.parse("http://localhost:8080/VCS/DATA/faculties/faculties.xml");
			  	NodeList faculties = doc.getElementsByTagName("faculty");
			  	
			  	for (int temp = 0; temp < faculties.getLength(); temp++) 
			  	{
			  		 
					   Node nNode = faculties.item(temp);
					   if (nNode.getNodeType() == Node.ELEMENT_NODE) 
					   {
					      Element eElement = (Element) nNode;
					      out.println("<table>");
					      out.println("<tr><td><b>Faculty ID</b></td> <td> " + getTagValue("id", eElement)+"</td></tr>");
					      out.println("<tr><td><b>Faculty Name</b> </td> <td> " + getTagValue("firstName", eElement)+", "+getTagValue("lastName", eElement)+"</td></tr>");
					      out.println("<tr><td><b>Designation</b> </td> <td>"+ getTagValue("designation", eElement)+"</td></tr>");
					      out.println("<tr><td><b>Department</b></td> <td> "+ getTagValue("department", eElement)+"</td></tr>");
					      out.println("<tr><td><b>Qualification</b></td> <td> "+ getTagValue("qualification", eElement)+"</td></tr>");
					      out.println("<tr><td><b>About</b></td> <td><p align='justify'> "+ getTagValue("description", eElement)+"</p></td></tr>");
					      out.println("</table><br>");
					   }
			  	}
				
				%>
				</div>
			</div>	
			
			<div id="right">
				<br><br><br>
				<div class="boxtop"></div>
				<%@include file="latest_news.jsp" %>
			</div>	

		
		
			<%@include file="footer.jsp" %>
</body>
</html:html>
