<html>
<%@ page import="jChatBox.Util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,java.util.*" %>
<jsp:useBean id="SystemProcessor" class="jChatBox.Service.ModeratorProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	String jspDisplay = SystemProcessor.execute(request, session, application);
	if (jspDisplay != null)
	{
		response.sendRedirect(jspDisplay);
	}
	else
	{
		ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
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
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css">
<script language="JavaScript">
<!--
function manage(opt)
{
	if (opt != "")
	{
		location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id="+opt;
	}
}
function backup()
{
	location.href="menu.jsp?todo=backup&rand=<%= System.currentTimeMillis() %>";
}
function logout()
{
	location.href="index.jsp?todo=logout&rand=<%= System.currentTimeMillis() %>";
}
//-->
</script>
<title>Discussion</title>
</head>
<body onLoad="javascript:loadCss()" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">
<%@include file="../header.jsp"%>
				<div class="left">
					<div class="left_articles">
			<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
					

<form method="post" action="menu.jsp" name="chat">
  <p>&nbsp;</p>
  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="25%">
        <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"><br>
              <br>
              </font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#990000">Manage 
              chatroom<br>
              </font></b></font> 
              <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                <tr> 
                  <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"> 
                    <select name="chatrooms" onChange="manage(this.options[selectedIndex].value);">
                      <option selected>Select a chatroom</option>
                      <%
                      	if (ChatroomManager != null)
                      	{
                      		Vector chatrooms = ChatroomManager.getChatrooms();
                      		Chatroom chatroom = null;
                      		for (int i=0;i<chatrooms.size();i++)
                      		{
                      			chatroom = (Chatroom) chatrooms.elementAt(i);
                      			out.print("<option value=\""+chatroom.getParams().getID()+"\">"+chatroom.getParams().getName()+"</option>");
                      		}
                      	}
                      %>
                    </select>
                    </font></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="open.jsp"><b>Open 
              a chatroom</b></a></font></td>
          </tr>
          <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="moderators.jsp"><b>Moderators</b></a></font></td>
          </tr>
          <%
          	if(userLevel.equals("3")) {
          	
          
           %>
           <!--  
          <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="javascript:backup()"><b>Backup 
              chatrooms </b></a></font></td>
          </tr>
          -->
          <tr> 
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="xmlconfig.jsp"><b>Manage 
              Discussions @ VCS.</b></a></font></td>
          </tr>
          <%
          	}
           %>
        </table>
      </td>
      <td width="75%" valign="top">
        <table width="98%" border="0" cellspacing="1" cellpadding="0" align="center">
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr bgcolor="#999999">
                  <td bgcolor="#003399">
                    <table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr bgcolor="#FFFFFF">
                        <td nowrap>
                          <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                              <td>
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Welcome to Discussion Board
                                  <br>
                                  </font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>
                                  <%
          							if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMOPENED)) out.print("Chatroom has been opened successfully.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMCLEARED)) out.print("Chatroom content has been cleared successfully.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMCLOSED)) out.print("Chatroom has been closed/removed successfully.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMERROR)) out.print("Cannot execute : System error.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.BACKUPDONE)) out.print("Chatrooms backup done successfully.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.COMMANDNOTALLOWED)) out.print(Conf.COMMANDNOTALLOWED);									
          						  %>
                                  </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                  </font></div>
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
        <div align="center"><br>
          <font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>
          </b></font> </div>
      </td>
    </tr>
  </table>
  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"> </font></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  </form>
  </div>	
			</div>
<%@include file="../footer.jsp" %>
	</div>
</body>
</html>
