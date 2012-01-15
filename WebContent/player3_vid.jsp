<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>
<head>
<title>player3</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>

<script type='text/javascript' src='${pageContext.request.contextPath}/theme/js/player/swfobject.js'></script>

<%
	String imageLink = request.getParameter("filePath");
 %>
 
  <embed
  src="${pageContext.request.contextPath}/theme/js/player/player.swf"
  width="470"
  height="320"
  bgcolor="#ffffff"
  allowscriptaccess="always"
  allowfullscreen="true"
  flashvars="file=<%= imageLink %>"
/>

<a href="#" class="lbAction" rel="deactivate"><button style="color: black; background-color: #c2d3fc">Done</button></a>


</body>
</html:html>
