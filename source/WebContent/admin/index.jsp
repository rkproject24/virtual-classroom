
<html>
<%@ page import="jChatBox.Util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<jsp:useBean id="SystemLogin" class="jChatBox.Service.SystemLogin" scope="request" />
<%
	
	String jspDisplay = SystemLogin.doLogin(request,session);
	if (jspDisplay != null)
	{
		%><jsp:forward page='<%= jspDisplay %>' /><%
		//response.sendRedirect(jspDisplay);
	}
%>
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
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style2.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script>

<LINK REL=STYLESHEET TYPE="text/css" HREF="styles/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<title>Discussion Login</title>
</head>
<body onLoad="javascript:loadCss()" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">
<%@include file="../header.jsp"%>	
				<div class="left">
					<div class="left_articles">
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
				
				<div class="calendar">
					<p><%=month %><br /><%=day %></p>
				</div>	
				<h2><a href="#"><u>Discussions</u></a></h2>
				<p class="description">Please enter your discussion login and password as mailed to you.</p>
					
<center>


<form method="post" action="index.jsp" name="chat">
  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#FF0000">
  <%
  	String error = SystemLogin.getSysMessage();
  	if (error != null)
  	{
		if (error.equals(Conf.ACCESSDENIED)) out.print("Access Denied : "+request.getRemoteAddr());
  	}
  %>
  </font></b></font><br>
    <br>
  </div>
  <table width="40%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#999999">
            <td bgcolor="#003399">
              <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr bgcolor="#FFFFFF">
                  <td nowrap>
                    <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>
                          </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Login
                          :</font></b></font> </td>
                        <td nowrap>
                          <input type="text" name="name" size="16" class="SystemBox">
                        </td>
                      </tr>
                      <tr>
                        <td nowrap> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">Password
                          :</font></b></font> <font face="Verdana, Arial, Helvetica, sans-serif" size="-2">
                          </font></td>
                        <td nowrap>
                          <input type="password" name="password" size="16" class="SystemBox">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
<center>
    <table border="0" cellspacing="2" cellpadding="1">
      <tr>
        <td align="center">
          <input type="submit" name="SystemLogin" value="Submit" class="SystemButton">
        </td>
        <td align="center">
          <input type="reset" value="Reset" class="SystemButton" name="reset">
        </td>
      </tr>
    </table>
    &nbsp;
  </center>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</div>	
</div>
<%@include file="../footer.jsp" %>
</div>
</body>
</html>
