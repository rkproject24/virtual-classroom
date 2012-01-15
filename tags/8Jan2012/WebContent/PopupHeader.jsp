<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String userIDForName = (String) request.getSession().getAttribute("userId");
	System.out.println("UserId: " + userIDForName);
	String userName = "";
	String userLevel = "";
	UserBean userBeanForName = null;
	
	CommonsDatabaseActivities dbObjectForName = new CommonsDatabaseActivities();
	if (userIDForName != null) {
		userBeanForName = (UserBean) dbObjectForName.getUserInfo(userIDForName);
		userName = userBeanForName.getName();
		userLevel = userBeanForName.getLevel();
	}
%>

<div id="header">
	<div id="logo">
		<img src="${pageContext.request.contextPath}/theme/images/vcs.jpg"
			height="71" width="200">
	</div>
</div>
<hr>