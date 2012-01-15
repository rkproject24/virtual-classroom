<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%><html:html>
<head>
<title>student_description</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>

<%
	String uid = request.getParameter("uid");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String dob = request.getParameter("dob");
	String url = "block_user.jsp?uid="+uid;
	String userID = (String)request.getSession().getAttribute("userId");
	UserBean userBean = (UserBean)request.getSession().getAttribute("UserBean");
	
	if(userBean==null)
	{
		response.sendRedirect("./NewLogin.jsp");
	}
	
	String level = userBean.getLevel();
	System.out.println("Level:" + level);
 %>

<div class="boxtop"></div>
	<div class="box">
	<p>
		<b><u>Email ID :</u></b> <%= email %><br />
		<b><u>Contact Number :</u></b> <%= contact %><br />
		<b><u>Date Of Birth :</u></b> <%= dob %><br />
		<%
		if(level.equals("3")) {
		 %>
		<div class="buttons">
	<a href="javascript:jah('<%= url %>','id_box')" class="bluebtn"><span>Block User</span></a> 			
	</div>
		<%
			}
		 %>
	</div>
	


</body>
</html:html>
