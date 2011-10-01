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

<%@page import="com.ignou.vcs.commons.Utilities"%><html:html>
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
<%-- tpl:put name="headarea" --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<title>Virtual Classroom System</title><%-- /tpl:put --%>
</head>
<body onLoad="javascript:loadCss()">
<%@include file="../header.jsp" %>								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				<%-- tpl:put name="buttons_blue_green" --%>
					
				<%-- /tpl:put --%>
				</div>
				<% 
						Date date = new Date();
						DateFormat formatterMonth = new SimpleDateFormat("MMM");
						DateFormat formatterDay = new SimpleDateFormat("dd");
						
						String month = formatterMonth.format(date);
						String day = formatterDay.format(date);
						month = month.toUpperCase();
						
						if(day.equals("1") || day.equals("21") || day.equals("31")) {
							day = day + "st";
						} else if(day.equals("2") || day.equals("22")) {
							day = day + "nd";						
						} else if(day.equals("3") || day.equals("23")) {
							day = day + "rd";						
						} else {
							day = day + "th";						
						} 
						
					%>
				<%-- tpl:put name="calendar" --%>
				
				<div class="calendar">
					
					<p><%=month %><br /><%=day %></p>
				</div>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_heading" --%>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
				<%-- /tpl:put --%>
				<%-- tpl:put name="centre_content" --%>
				<table>
					<tr><th class="top"><u>Subject</u></th><th class="top" scope="col"><u>Date of Upload</u></th>
					<th class="top"><u>Description</u></th></tr>
				<%
					CommonsDatabaseActivities dbObj = new CommonsDatabaseActivities();
					java.util.ArrayList list = (java.util.ArrayList)dbObj.getNews();
					
					for(int i =0;i<list.size();i++)
					{
						com.ignou.vcs.commons.beans.NewsBean newsBean = new com.ignou.vcs.commons.beans.NewsBean();
						newsBean = (com.ignou.vcs.commons.beans.NewsBean)list.get(i);
						String subject = newsBean.getSubject();
						int newsId = newsBean.getNewsId();
						String date1 = newsBean.getDate();
						String description = newsBean.getDescription();
						Utilities util =  new Utilities();
						String desc = util.encodeString(description);
						//request.getSession().setAttribute("desc",desc);
						String url = "description.jsp?desc="+desc;
						
						System.out.println("url"+url);
					%>
					<tr><th scope="row"><%=subject %></th><td><%= date1 %></td>
					<td>
					<input type = "hidden" name="url<%=i%>" id="url<%=i%>" value=<%=url %> >
					<a href="javascript:fetchData('url','<%=i %>','id2')" accesskey="m">View Description</a>
					</td>
					</tr>
					<%
					}
					 
				%>
				</table>
					
					
					
	
				<%-- /tpl:put --%>
			</div>
			
			
			<%-- tpl:put name="bottom_box" --%>
			
			
			<%-- /tpl:put --%>
		</div>	
		
		
		<div id="right">
			<%-- tpl:put name="right_boxes" --%>
			<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>News</u></b><br />
					<a href="#" accesskey="m">IIIrd Standard students to undergo 2 more major tests prior to module V. </a><br />
					<a href="#" accesskey="m">Vth Standard Major Test Evaluated. Check your Progress.</a><br />
					<a href="#" accesskey="m">Annual Programming contest to begin from 15th November 2008.</a><br />
					<a href="#" accesskey="m">IOPC (IIT Kanpur) starting 21st November Check http://www.iitk.ac.in for more dtails.</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>Read All</span></a></p></div>
			</div>
			
			<div class="boxtop"></div>
			<div id = "id2">
			<div class="box">
			
				<p>
					<b><u>Collaborate</u></b><br />
					<a href="#" accesskey="m"><span class="key">I</span>nteractive White Boards</a><br />
					<a href="#" accesskey="m"><span class="key">C</span>hat with friends, Faculties</a><br />
					<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
				</p>
				<div class="buttons"><p><a href="#" class="bluebtn"><span>More</span></a></p></div>
			</div>
			</div>
			<%-- /tpl:put --%>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
<%-- /tpl:insert --%>