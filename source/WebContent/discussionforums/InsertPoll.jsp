<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Virtual classroom system - Forums</title>
<script type="text/javascript">
	function loadCss() {
		var browser = navigator.appName.toLowerCase();
		// document.write(browser);
		var stylesheet = document.getElementById("pagestyle");
		var menusheet = document.getElementById("menustyle");
		if (browser.indexOf("microsoft internet explorer") != -1) {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style_ie.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu_ie.css";
		} else {
			stylesheet.href = "${pageContext.request.contextPath}/theme/css/style1.css";
			menusheet.href = "${pageContext.request.contextPath}/theme/css/menu.css";
		}
	}

</script>
<link id="pagestyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css"
	media="screen,projection" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>


<%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../header.jsp"%>

<div class="left">
<div class="left_articles">
<div class="buttons"></div>
<%@include file="../DisplayCalendar.jsp"%>
<h2><a href="../index.jsp"><u>Virtual Classroom System</u></a></h2>
<p class="description">Studying the e-way.</p>
<center>
<html:form action="/InsertPoll">
			<b><u><font style='font-family: "Times New Roman"; font-weight: bold'>Please enter poll details.</font></u></b>
			<br /><br />
			<TABLE>
				<TBODY>
					<TR>
<html:hidden property="userName" value="<%=userName %>"/>
						<TD style='font-family: "Times New Roman"; font-weight: bold'>Poll Question</TD>
						<TD><html:text property="pollQuestion"></html:text></TD>
					</TR>
					<TR>
						<TD style='font-family: "Times New Roman"; font-weight: bold'>Email</TD>
						<TD><html:text property="pollOptions"></html:text></TD>
					</TR>
					<TR>
						<td></td>
						<TD align="center"><html:submit property="Submit" value="Submit"></html:submit>
						<a href="#" class="lbAction" rel="deactivate"><button>Cancel</button></a>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		
		</html:form>
	</p>
	<html:errors></html:errors>
</div>

</center>
</div>
</div>
<div id="right">
<div class="boxtop"></div>
<%@include file="Polls.jsp"%>

<div class="boxtop"></div>
<div class="box">
<p><b><u>Collaborate</u></b><br />
<a href="#" accesskey="m"><span class="key">I</span>nteractive White
Boards</a><br />
<a href="#" accesskey="m"><span class="key">C</span>hat with
friends, Faculties</a><br />
<a href="#" accesskey="m"><span class="key">V</span>oice Mailboxes</a><br />
</p>
<div class="buttons">
<p><a href="#" class="bluebtn"><span>More</span></a></p>
</div>
</div>
</div>
<%@include file="../footer.jsp"%>
</div>

</body>
</html>