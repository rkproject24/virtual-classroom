<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<script type="text/javascript" language="javascript" >
function formValidator()
{
	var searchString = window.document.searchForm.search;
	if(searchString.value.length == 0)
	{
		alert("Enter the search query");
		return false;
	}
	return true;

}
</script>
<%
	String userIDForName = (String) request.getSession().getAttribute("userId");
	System.out.println("UserId: " + userIDForName);
	String userName = "";
	String userLevel = "";
	UserBean userBean = (UserBean)request.getSession().getAttribute("UserBean");
	
	if(userBean==null)
	{
		response.sendRedirect("./NewLogin.jsp");
	}
	
	userName = userBean.getName();
	userLevel = userBean.getLevel();
	System.out.println("UserNAME: " + userName);
	System.out.println("UserLEVEL: " + userLevel);
 %>

<div id="content">
<div id="header">
<%
				if(userIDForName == null) {
			 %> <%@ include file="/theme/right_links/default.jsp"%>
<%
				} else { 
					String link = "/theme/right_links/logged_in.jsp?userName=" + userName;
			%> <jsp:include page="<%= link %>" /> <%
				}
			 %>
<div id="logo"><img
	src="${pageContext.request.contextPath}/theme/images/vcs.jpg"
	height="71" width="200"> <%-- /tpl:put --%></div>

</div>

<div id="tabs">
<%
				if(userLevel.equals("0")) {
			 %> <%@ include file="/theme/main_menu/student_menu.jsp"%>
<%
				} else if (userLevel.equals("1")){ 
			%> <%@ include file="/theme/main_menu/faculty_menu.jsp"%>
<%
				} else if (userLevel.equals("2")){ 
			%> <%@ include file="/theme/main_menu/management_menu.jsp"%>
<%
				} else if (userLevel.equals("3")){ 
			%> <%@ include file="/theme/main_menu/admin_menu.jsp"%>
<%
				} else if (userLevel.equals("")){ 
			%> <%@ include file="/theme/main_menu/default.jsp"%>
<%
				} 
			 %> <%-- tpl:put name="top_menu_middle" --%> <%-- /tpl:put --%>

<div id="search">
<form method="post"
	action="${pageContext.request.contextPath}/search/search.jsp"
	onsubmit="return formValidator()" name="searchForm">
<p><input type="text" name="search" class="search" /> <input
	type="submit" value="Search" class="button" /></p>
</form>
</div>
</div>
