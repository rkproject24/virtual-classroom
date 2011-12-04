<html>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,jChatBox.Chat.Filter.*,java.util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<jsp:useBean id="SystemProcessor" class="jChatBox.Service.ModeratorProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	jChatBox.Chat.Monitor Monitor = null;
	String ID = "";
	Chatroom aChatroom = null;
	int id = -1;
	String jspDisplay = SystemProcessor.execute(request,session, application);
	if (jspDisplay != null)
	{
		response.sendRedirect(jspDisplay);
	}
	else
	{
		ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
		Monitor = jChatBox.Chat.Monitor.getInstance();
		ID = request.getParameter("id");
		if ( (ID != null) && (!ID.equals("")) )
		{
			id = Integer.parseInt(ID);
			aChatroom = ChatroomManager.getChatroom(id);

			/** Manager Users and Blacklist "windows" */
			String sub = request.getParameter("sub");
			if ( (sub != null) && (!sub.equals("")) )
			{
				if (sub.equals("viewusers")) session.putValue("winusers","open");
				else if (sub.equals("closeusers")) session.putValue("winusers","close");
				else if (sub.equals("viewblacklist")) session.putValue("winblacklist","open");
				else if (sub.equals("closeblacklist")) session.putValue("winblacklist","close");
			}
		}
		else
		{
			ID = (String) session.getValue("ID");
			if (ID == null) ID="";
		}
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
<script language="JavaScript">
<!--
function viewusers()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=viewusers";
}
function closeusers()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=closeusers";
}
function viewblacklist()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=viewblacklist";
}
function closeblacklist()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=closeblacklist";
}
function update()
{
	if (document.chatroom.subject.value.length > 0)
	{
		document.chatroom.todo.value="updatechatroom";
		document.chatroom.submit();
	}
	else
	{
		alert("You have to fill in SUBJECT field !");
	}
}
function close()
{
	location.href="menu.jsp?todo=closechatroom&id=<%= ID %>&rand=<%= System.currentTimeMillis() %>";
}
function clear()
{
	location.href="menu.jsp?todo=clearchatroom&id=<%= ID %>&rand=<%= System.currentTimeMillis() %>";
}
function generate()
{
	if (document.chatroom.filename.value.length > 0)
	{
		document.chatroom.todo.value="generatetranscript";
		document.chatroom.submit();
	}
	else
	{
		alert("You have to fill in FILENAME field !");
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
function manage(opt)
{
	if (opt != "")
	{
		location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id="+opt;
	}
}
function ban(name)
{
	document.chatroom.username.value=name;
	document.chatroom.todo.value="ban";
	document.chatroom.submit();
}
function kickoff(name)
{
	document.chatroom.username.value=name;
	document.chatroom.todo.value="kickoff";
	document.chatroom.submit();
}
function remove(ip)
{
	document.chatroom.ip.value=ip;
	document.chatroom.todo.value="remove";
	document.chatroom.submit();
}
function clearblacklist()
{
	document.chatroom.todo.value="clear";
	document.chatroom.submit();
}
function join()
{
	document.chatroom.todo.value="join";
	document.chatroom.submit();
}
//-->
</script>
<title>Chatroom Manager</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">
<%
	String userIDForName = (String) request.getSession().getAttribute("userId");
	System.out.println("UserId: " + userIDForName);
	String userName = "";
	String userLevel = "";
	CommonsDatabaseActivities dbObjectForName = new CommonsDatabaseActivities();
	if (userIDForName != null ) {
		
		UserBean userBeanForName = (UserBean)dbObjectForName.getUserInfo(userIDForName) ;
		userName = userBeanForName.getName();
		userLevel = userBeanForName.getLevel();
		System.out.println("UserNAME: " + userName);
		System.out.println("UserLEVEL: " + userLevel);
	}
 %>
<div id = "content">
	<div id = "header">
		<%
				if(userIDForName == null) {
			 %>
				<%@ include file="/theme/right_links/default.jsp" %>
			<%
				} else { 
					String link = "/theme/right_links/logged_in.jsp?userName=" + userName;
			%>
				<jsp:include page="<%= link %>" />
			<%
				}
			 %>
	<div id = "logo">
		<img src="${pageContext.request.contextPath}/theme/images/vcs.jpg" height="71" width="190">
	</div>
	</div>
	<div id="tabs">
			
			<%
				if(userLevel.equals("0")) {
			 %>
				<%@ include file="/theme/main_menu/student_menu.jsp" %>
			<%
				} else if (userLevel.equals("1")){ 
			%>
				<%@ include file="/theme/main_menu/faculty_menu.jsp" %>
			<%
				} else if (userLevel.equals("2")){ 
			%>
				<%@ include file="/theme/main_menu/management_menu.jsp" %>
			<%
				} else if (userLevel.equals("3")){ 
			%>
				<%@ include file="/theme/main_menu/admin_menu.jsp" %>
			<%
				} else if (userLevel == null){ 
			%>
				<%@ include file="/theme/main_menu/default.jsp" %>
			<%
				} 
			 %>
			
			<div id="search">
				<form method="post" action="${pageContext.request.contextPath}/search/search.jsp">
				<p>
					<input type="text" name="search" class="search" /> 
					<input type="submit" value="Search" class="button" />
				</p>
				</form>
			</div>
		</div>
				<div class="left">
					<div class="left_articles">
			<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
					
<center>

	
<form method="post" action="chatroom.jsp" name="chatroom">
  <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><br>
    </font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>
    <%
 		if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMUPDATED)) out.print("Chatroom has been updated successfully.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMTRANSCRIPTED)) out.print("Chatroom has been transcripted successfully.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("Chatroom's subject missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMIDMISSING)) out.print("System error : Chatroom's id missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNOTFOUND)) out.print("System error : Chatroom not found.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMERROR)) out.print("Cannot execute : System error.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.USERNAMEMISSING)) out.print("Username missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.NAMENOTFOUND)) out.print("Username not found.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.KICKEDOFF)) out.print("User has been kicked off this chatroom.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.BANNED)) out.print("User has been banned of this chatroom.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMBLACKLISTCLEARED)) out.print("Blacklist cleared.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.IPREMOVED)) out.print("IP removed from blacklist.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CANNOTKICKOFFORBAN)) out.print("Cannot kick off or ban SYSTEM user.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.NAMENOTAVAILABLE)) out.print("Name already in use for this charoom.");
 		else if ( ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMUSERJOINED)) || ((SystemProcessor.getSysMessage(session)).equals(Conf.MODERATORUSERJOINED)))
 		{
 			if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMUSERJOINED)) out.print("SYSTEM user has joined this chatroom.");
			else out.print("MODERATOR user has joined this chatroom.");
 			out.print(" Click <a href=\"../skin_multilanguage/room.jsp\" target=\"_blank\" class=\"bluelink\">here</a> to enter this chatroom.<br>");
 		}
 		else out.print(SystemProcessor.getSysMessage(session));
    %>
    </b></font></p>
  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="25%" valign="top">
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
                      <option>Select a chatroom</option>
                      <%
                      	if (ChatroomManager != null)
                      	{
                      		Vector chatrooms = ChatroomManager.getChatrooms();
                      		Chatroom chatroom = null;
                      		String Selection = "";
                      		for (int i=0;i<chatrooms.size();i++)
                      		{
                      			chatroom = (Chatroom) chatrooms.elementAt(i);
                      			if (chatroom.getParams().getID() == id) Selection=" selected";
                      			else Selection = "";
                      			out.print("<option value=\""+chatroom.getParams().getID()+"\""+Selection+">"+chatroom.getParams().getName()+"</option>");
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
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="javascript:backup()"><b>Backup
              chatrooms </b></a></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="xmlconfig.jsp"><b>Manage
              Discussions @ VCS.</b></a></font></td>
          </tr>
          <%
          	}
           %>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="javascript:logout()"><b>Logout</b></a></font></td>
          </tr>
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
                                <div align="center">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                    <tr>
                                      <td bgcolor="#FFFFCC"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099"><a href="javascript:clear()" class="tablink">Clear</a>&nbsp;</font>|<font color="#000099">&nbsp;</font></b></font><a href="javascript:close()" class="tablink">Close</a><font color="#000099">&nbsp;</font>|<font color="#000099">&nbsp;</font><a href="javascript:join()" class="tablink">Join</a><font color="#000099">&nbsp;</font></b></font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <hr size="1" width="100%">
                                      </td>
                                    </tr>
                                  </table>
                                  <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2"><b><font color="#000099" size="-1">&nbsp;Info</font></b></font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Name
                                        : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <% if (aChatroom != null) out.print(aChatroom.getParams().getName()); %>
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>History
                                        : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="history" class="SystemBox">
                                          <%
                                          	if (aChatroom != null)
                                          	{
                                          		int[] historyList = {20,30,35,40,45,50,55,60,70,80,90,100,120,150};
                                          		int history = aChatroom.getParams().getHistory();
                                          		String hStr = null;
                                          		String Selected = null;
                                          		for (int h=0;h<historyList.length;h++)
                                          		{
                                          		   hStr = ""+historyList[h];
                                          		   if (historyList[h]==history) Selected = " selected";
                                          		   else Selected = "";
                                          		   %>
                                          <option value="<%= hStr %>"<%= Selected %>><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= hStr %></font></option>
                                          <%}
                                          	}
                                          %>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Subject
                                        :</b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="subject" size="16" class="SystemBox" value="<% if (aChatroom != null) out.print(aChatroom.getParams().getSubject()); %>">
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Refresh
                                        limit : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshlimit" class="SystemBox">
                                          <%
										  if (aChatroom != null)
										  {
                                          	int[] refreshList = {3,5,8,10,12,15,18,20,25,30,40,50};
                                          	int refresh = aChatroom.getParams().getRefreshLimit();
                                          	String rStr = null;
                                          	String Select = null;
                                          	for (int r=0;r<refreshList.length;r++)
                                          	{
                                          	   rStr = ""+refreshList[r];
                                          	   if (refreshList[r]==refresh) Select = " selected";
                                          	   else Select = "";
                                          	   %>
                                          <option value="<%= rStr %>"<%= Select %>><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= rStr %>
                                          seconds</font></option>
                                          <%}
                                          }
                                         %>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Max.
                                        users :</b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <% if (aChatroom != null) out.print(aChatroom.getParams().getMaxUsers()); %>
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Refresh
                                        model : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshmodel" class="SystemBox">
                                          <%
										  if (aChatroom != null)
										  {
                                          	int[] refreshModel = {1,2,3};
                                          	String[] refreshModelList = {"Time-Constant","Action-Tracker","Room-Load"};
                                          	int refresh = aChatroom.getParams().getRefreshModel();
                                          	String rStr = null;
                                          	String Select = null;
                                          	for (int r=0;r<refreshModel.length;r++)
                                          	{
                                          	   rStr = refreshModelList[r];
                                          	   if (refreshModel[r]==refresh) Select = " selected";
                                          	   else Select = "";
                                          	   %>
                                          <option value="<%= refreshModel[r] %>"<%= Select %>><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= rStr %></font></option>
                                          <%}
                                          }
                                         %>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Display
                                        mode : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <%
                                         	if (aChatroom != null)
                                         	{
                                         		if (aChatroom.getParams().getDisplayMode() == Conf.NONFRAMED) out.print("Non Framed (JSP)");
                                         		else if (aChatroom.getParams().getDisplayMode() == Conf.FRAMED) out.print("Framed (JSP)");
                                         		else if (aChatroom.getParams().getDisplayMode() == Conf.BUFFEREDFRAMED) out.print("Buffered-Framed (JSP)");
                                         		else if (aChatroom.getParams().getDisplayMode() == Conf.APPLET) out.print("Applet");
                                         		else if (aChatroom.getParams().getDisplayMode() == Conf.FLASH) out.print("Flash");
                                         	}
                                         %>
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Private
                                        messages : </b></font></td>
                                      <td>
                                        <table width="80%" border="0" cellspacing="1" cellpadding="0">
                                          <tr>
                                            <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="radio" name="private" value="yes" <% if ( (aChatroom != null) && (aChatroom.getParams().getPrivateStatus() == true) ) out.print("checked"); %>>
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Yes</font></td>
                                            <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="radio" name="private" value="no" <% if ( (aChatroom != null) && (aChatroom.getParams().getPrivateStatus() == false) ) out.print("checked"); %>>
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">No</font></td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td align="center">&nbsp;</td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Moderators
                                        : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Language
                                        :</b></font></td>
                                      <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="language" class="SystemBox">
                                          <%
                                           Hashtable languages = XMLConfig.LANGUAGES;
                                           String defaultLanguage = "";
                                           if ((languages != null) && (aChatroom != null))
                                           {
                                              String defaultStr = aChatroom.getParams().getLanguage();
                                              Enumeration e = languages.keys();
                                              while (e.hasMoreElements())
                                              {
                                              	String language = (String) e.nextElement();
                                              	if (language.equals(defaultStr)) defaultLanguage = " selected";
                                              	else defaultLanguage = "";
                                              	%>
                                          <option value="<%= language %>"<%= defaultLanguage %>><%= language %></option>
                                          <%
                                              }
                                           }
                                        %>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Update" value="Update" class="SystemButton" onClick="update()">
                                        </font></td>
                                      <td valign="top">
                                        <table border="0" cellspacing="0" cellpadding="1">
                                          <tr>
                                            <td align="left"> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <select name="moderatorlist" size="3" multiple class="SystemBox">
                                                <% if ( (XMLConfig.MODERATORS != null) && (!XMLConfig.MODERATORS.isEmpty()) )
													  {
                                                        %>
                                                <option value="">- Select moderator(s)
                                                -</option>
                                                <%
														Enumeration e = XMLConfig.MODERATORS.keys();
														Vector mods = aChatroom.getParams().getModerators();
														String allowedmod = null;
														while (e.hasMoreElements())
														{
															String name = (String) e.nextElement();
															String sel = "";
															for (int ms=0;ms<mods.size();ms++)
															{
																allowedmod = (String) mods.elementAt(ms);
																if (name.equals(allowedmod))
																{
																	sel = "selected";
																	break;
																}
															}
															%>
                                                <option <%= sel %> value="<%= name %>"><%= name %></option>
                                                <%
														}
													  }
													  else
													  {
                                                        %>
                                                <option value="">- No moderator
                                                available -</option>
                                                <%
													  }
													%>
                                              </select>
                                              </font></td>
                                          </tr>
                                        </table>
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"></font></td>
                                      <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Filters
                                        : </b></font></td>
                                      <td valign="top">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <%
											if (aChatroom != null)
											{
												Vector vFilters = aChatroom.getParams().getFilters();
												Vector vFiltersList = XMLConfig.FILTERS;
												jChatBox.Chat.Filter.Filter myFilter = null, aFilter = null;
												String Check = "";
												for (int f=0;f<vFiltersList.size();f++)
												{
													aFilter = (jChatBox.Chat.Filter.Filter) vFiltersList.elementAt(f);
													for (int m=0;m<vFilters.size();m++)
													{
														myFilter = (jChatBox.Chat.Filter.Filter) vFilters.elementAt(m);
														if ((myFilter.getID()).equals(aFilter.getID()))
														{
															Check=" checked";
															break;
														}
														else Check="";
													}
													%>
                                          <tr>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="checkbox" name="<%= aFilter.getID() %>" value="ok"<%= Check %>>
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= aFilter.getName() %></font></td>
                                          </tr>
                                          <%
												}
											}
										%>
                                        </table>
                                      </td>
                                    </tr>
                                  </table>
                                  <br>
                                  <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">&nbsp;Transcript
                                        </font></b><font color="#333333"> <font size="-2">
                                        (This text file will be saved in your
                                        logs folder)</font></font><b><font color="#000099">
                                        </font></b></font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>&nbsp;Filename
                                        : </b>
                                        <input type="text" name="filename" value="chatroomtranscript.txt" size="30" class="SystemBox">
                                        <input type="button" name="Generate" value="Generate" class="SystemButton" onClick="generate()">
                                        <input type="hidden" name="todo">
                                        <input type="hidden" name="id" value="<%= ID %>">
                                        <input type="hidden" name="username">
                                        <input type="hidden" name="ip">
                                        <input type="hidden" name="rand" value="<%= System.currentTimeMillis() %>">
                                        </font></td>
                                    </tr>
                                  </table>
                                  <br>
                                  <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                      <%
                                      	if ( (session.getValue("winusers") != null) && ((session.getValue("winusers")).equals("open")) )
                                      	{%>
                                    		<tr>

                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font size="-1">&nbsp;</font></font></b></font><font size="-1"><a href="javascript:closeusers()"><img src="images/x.gif" border="0" alt="Manage users" align="absmiddle"></a>&nbsp;<a href="javascript:closeusers()" class="bluelink">Users</a>&nbsp;(<% if (aChatroom != null) out.print(aChatroom.getTotalUsers()); %>/<% if (aChatroom != null) out.print(aChatroom.getParams().getMaxUsers()); %>)
                                        - </font></font></b><font size="-2" color="#000099"><font size="-1"><a href="javascript:viewusers()" class="bluelink">refresh</a></font></font></font></td>
                                    		</tr>
                                    		<tr>

                                      <td bgcolor="#EEEEEE">
                                        <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                          <tr bgcolor="#FFFFFF" align="center">
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>&nbsp;Name&nbsp;</b></font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>IP</b></font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>User
                                              Agent</b></font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Action</b></font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><font size="-2" color="#666666">last
                                              access</font></font></td>
                                          </tr>
                                          <%
                                          	Hashtable table = new Hashtable();
                                          	if (Monitor != null) table = Monitor.getTable();
      										Enumeration e = table.keys();
      										ChatroomUser cUser = null;
      										HttpSession cSession = null;
      										int cID = -1;
							       			Vector filters = aChatroom.getParams().getFilters();
							       			jChatBox.Chat.Filter.Filter filter = null;
							       			String username = null;
      										while (e.hasMoreElements())
      										{
												cUser = (ChatroomUser) e.nextElement();
												cSession = (HttpSession) table.get(cUser);
												if (cUser.getParams().getChatroom() == 	id)
												{
													username = cUser.getName();
									       			/** Filter username for non-SYSTEM users */
													if (cUser.getType() != User.SYSTEM)
													{
														for (int f=0;f<filters.size();f++)
														{
															filter = (jChatBox.Chat.Filter.Filter) filters.elementAt(f);
									               			username = filter.process(username);
									               		}
									                }
													%>
                                          <tr align="center">
                                            <td bgcolor="#FFFFFF" nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;<%= username %>&nbsp;</font></td>
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;<%= cUser.getIP() %>&nbsp;</font></td>
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;<%= cUser.getParams().getAgent() %>&nbsp;</font></td>
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;<a href="javascript:kickoff('<%= cUser.getName() %>')" class="menulink">kickoff</a>&nbsp;&nbsp;<a href="javascript:ban('<%= cUser.getName() %>')" class="menulink">ban</a>&nbsp;</font></td>
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#666666">(<%= (System.currentTimeMillis()-cSession.getLastAccessedTime())/1000 %>/<%= cSession.getMaxInactiveInterval() %>)</font></td>
                                          </tr>
                                          <%
                                          		}
                                          	}
                                          %>
                                        </table>
                                      </td>
                                      		</tr>
                                      <%}
                                      	else
                                      	{%>
                                    		<tr>

                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font size="-1">&nbsp;</font></font></b></font><font size="-2" color="#000099"><font size="-1"><a href="javascript:viewusers()"><img src="images/arrowdown.gif" border="0" alt="Manage users" align="absmiddle"></a>&nbsp;<a href="javascript:viewusers()" class="bluelink">Users</a></font></font></b></font></td>
                                    		</tr>
                                    		<tr>
                                      		  <td>&nbsp;

                                      		  </td>
                                      		</tr>
                                      	<%}
                                      %>
                                  </table>
                                  <br>
                                  <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                      <%
                                      	if ( (session.getValue("winblacklist") != null) && ((session.getValue("winblacklist")).equals("open")) )
                                      	{%>
                                    		<tr>

                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font size="-1">&nbsp;</font></font></b></font><font size="-1"><a href="javascript:closeblacklist()"><img src="images/x.gif" border="0" alt="Manage blacklist" align="absmiddle"></a>&nbsp;<a href="javascript:closeblacklist()" class="bluelink">Blacklist</a>&nbsp;(<% if (aChatroom != null) out.print(aChatroom.getBlacklist().getSize()); %>)
                                        - </font></font></b><font size="-2" color="#000099"><font size="-1"><a href="javascript:clearblacklist()" class="bluelink">clear</a></font></font></font></td>
                                    		</tr>
                                    		<tr>
                                      		  <td>
                                        <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                          <tr bgcolor="#FFFFFF" align="center">
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>IP</b></font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Action</b></font></td>
                                          </tr>
                                          <%
                                          	if (aChatroom != null)
                                          	{
                                          		Vector vList = aChatroom.getBlacklist().getList();
      											for (int l=0;l<vList.size();l++)
      											{
													%>
                                          <tr align="center">
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;<%= (String) vList.elementAt(l) %>&nbsp;</font></td>
                                            <td bgcolor="#FFFFFF"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2"><a href="javascript:remove('<%= (String) vList.elementAt(l) %>')" class="menulink">remove</a></font></td>
                                          </tr>
                                          <%
                                          		}
                                          	}
                                          %>
                                        </table>
                                      </td>
                                      		</tr>
                                      <%}
                                      	else
                                      	{%>
                                    		<tr>

                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099"><font size="-1">&nbsp;</font></font></b></font><font size="-2" color="#000099"><font size="-1"><a href="javascript:viewblacklist()"><img src="images/arrowdown.gif" border="0" alt="Manage blacklist" align="absmiddle"></a>&nbsp;<a href="javascript:viewblacklist()" class="bluelink">Blacklist</a></font></font></b></font></td>
                                    		</tr>
                                    		<tr>
                                      		  <td>&nbsp;
                                      		  </td>
                                      		</tr>
                                      	<%}
                                      %>
                                  </table>
                                </div>
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
      </td>
    </tr>
  </table>
  </form>
  </div>	
</div>
<%@include file="../footer.jsp" %>
	</div>
</body>
</html>
