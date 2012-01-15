<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<html:html>
<head>
<title>player2</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>

<%
	String file = request.getParameter("file");	
	System.out.println("file:" + file);
%>

<!-- BEGIN GENERIC ALL BROWSER FRIENDLY HTML FOR WINDOWS MEDIA PLAYER -->
<object id="MediaPlayer1" width="180" height="200"
classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95"
codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
standby="Loading Microsoft® Windows® Media Player components..."
type="application/x-oleobject" align="middle">
<param name="FileName" value="">
<param name="ShowStatusBar" value="True">
<param name="DefaultFrame" value="mainFrame">
<param name="autostart" value="false">
<embed type="application/x-mplayer2"
pluginspage = "http://www.microsoft.com/Windows/MediaPlayer/"
src="<%= file %>"
autostart="false"
align="middle"
width="500"
height="300"
defaultframe="rightFrame"
showstatusbar="true">
</embed>
</object>

</body>
</html:html>
