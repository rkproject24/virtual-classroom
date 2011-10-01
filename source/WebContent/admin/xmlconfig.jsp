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
	String jspDisplay = SystemProcessor.execute(request,session, application);
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
function save()
{
	if ( (document.xmlconfig.systemlogin.value.length > 0) && (document.xmlconfig.systememail.value.length > 0) &&
		 (document.xmlconfig.timeout.value.length > 0) )
	{
		if (document.xmlconfig.update.checked == true)
		{
			if (document.xmlconfig.systempassword.value == document.xmlconfig.checkpassword.value)
			{
				document.xmlconfig.submit();
			}
			else
			{
				alert("Password not confirmed !");
			}
		}
		else
		{
			document.xmlconfig.submit();
		}
	}
	else
	{
		alert("You have to fill in \systemlogin,systememail,timeout\n parameters !");
	}
}
function cancel()
{
	location.href="menu.jsp";
}
//-->
</script>
<title>Discussion</title>
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
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
			</div>	
		<center>		
<form method="post" action="xmlconfig.jsp" name="xmlconfig">
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
            <td class="menulink"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b><a href="open.jsp" class="menulink">Open
              a chatroom</a></b></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td></td>
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
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#FF0000">Manage
              Discussions @ VCS.</font></b></font></td>
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
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#0000FF">
                                  <font face="Arial, Helvetica, sans-serif">-
                                  Discussions(VCS) SYSTEM parameters -</font></font></b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"></font>
                                  <br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>
                                  <%
          							if ((SystemProcessor.getSysMessage(session)).equals(Conf.XMLCONFIGUPDATED)) out.print("System configuration updated. It will be loaded on next login.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMERROR)) out.print("Cannot execute : System error.");
          							else if ((SystemProcessor.getSysMessage(session)).equals(Conf.COMMANDNOTALLOWED)) out.print(Conf.COMMANDNOTALLOWED);
          						  %>
                                  </b></font><br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><br>
                                  </b></font>
                                  <table width="98%" border="0" cellspacing="1" cellpadding="0">
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Backup
                                        File : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="backupfile" value="<%= XMLConfig.BACKUPFILE %>" size="34" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">Backup 
                                        filename of Discussion(VCS)<br>
                                        (e.g. : /home/alice/jchatbox/backup.ser)</font></td>
                                      <td class="SystemBox" valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#666666"><%= XMLConfig.AUTOCONFIG %></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#666666"> 
                                        value is allowed.<br>
                                        It means $WEBAPP_HOME/WEB-INF/conf</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Logs 
                                        folder : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="logfolder" value="<%= XMLConfig.LOGFOLDER %>" size="34" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">Logs 
                                        folder of Discussions (VCS)<br>
                                        (e.g. : /home/alice/jchatbox/logs)</font></td>
                                      <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#666666"><%= XMLConfig.AUTOCONFIG %> 
                                        value is allowed.<br>
                                        It means $WEBAPP_HOME/WEB-INF/conf</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>System
                                        login : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="systemlogin" value="<%= XMLConfig.SYSTEMLOGIN %>" size="20" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">System
                                        login. Default is : system</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>System
                                        email :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="systememail" value="<%= XMLConfig.SYSTEMEMAIL %>" size="30" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">System
                                        email.</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>TimeOut
                                        :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="timeout" value="<%= XMLConfig.TIMEOUT %>" size="30" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">User's
                                        session timeout in seconds.</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>USERSESSIONID
                                        :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="usersessionid" value="<%= XMLConfig.USERSESSIONID %>" size="30" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">User
                                        HttpSession ID. DO NOT CHANGE !</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>TRANSCRIPT
                                        :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="transcriptimpl" value="<%= XMLConfig.TRANSCRIPT %>" size="30" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">Transcript
                                        implementation : Full qualified class
                                        name.</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Default
                                        chatrooms language :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="defaultlanguage" class="SystemBox">
                                        <%
                                           Hashtable languages = XMLConfig.LANGUAGES;
                                           String defaultStr = XMLConfig.DEFAULTLANGUAGE;
                                           String defaultLanguage = "";
                                           if (languages != null)
                                           {
                                              Enumeration e = languages.keys();
                                              while (e.hasMoreElements())
                                              {
                                              	String language = (String) e.nextElement();
                                              	if (language.equals(defaultStr)) defaultLanguage = " selected";
                                              	else defaultLanguage = "";
                                              	%><option value="<%= language %>"<%= defaultLanguage %>><%= language %></option><%
                                              }
                                           }
                                        %>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">Default
                                        language.</font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>License
                                        file :</b> </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="license" value="<%= XMLConfig.LICENSE %>" size="30" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#AA0000"><b>
                                        <%
                                      	String reg = XMLConfig.readRegistration();
                                      	if ( (reg != null) && (reg.equals("freefornoncommercial")) )
                                      	{ %>
                                        This chat Service is free for non-commercial sites.
                                        <%}
                                        else if ((reg != null) && (!reg.equals("")) )
                                        {%>
                                        This chat Service is registered to : <%= XMLConfig.REGISTRATION %>
                                        <%}
                                        else
                                        {%>
                                        INVALID chat Service license file !
                                        <%}
                                      %>
                                        </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                  </table>
                                  <br>
                                  <table width="98%%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                      <td width="50%"> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        </font>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="checkbox" name="update" value="yes">
                                              </font></td>
                                            <td nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <font color="#FF0000"><b>&nbsp;Update
                                              SYSTEM password ?</b></font></font></td>
                                          </tr>
                                        </table>
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        </font></td>
                                      <td width="50%"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"></font></td>
                                    </tr>
                                    <tr>
                                      <td width="50%" bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>New
                                        password :</b> </font></td>
                                      <td width="50%" bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="password" name="systempassword" size="20" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td width="50%" bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Confirm
                                        password : </b></font></td>
                                      <td width="50%" bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="password" name="checkpassword" size="20" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td width="50%"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#AA0000">Default is : password. CHANGE IT !</font></td>
                                      <td width="50%"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#333333">You
                                        have to select the checkbox above if you
                                        want to update the SYSTEM password. This
                                        password is stored as its MD5 hash value
                                        (i.e. encrypted in config file).</font></td>
                                    </tr>
                                  </table>
                                  <br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                  </font>
                                  <table border="0" cellspacing="3" cellpadding="1">
                                    <tr>
                                      <td width="51"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Save" value="Save" onClick="save()" class="SystemButton">
                                        </font></td>
                                      <td width="76"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Cancel" value="Cancel" onClick="cancel()" class="SystemButton">
                                        <input type="hidden" name="todo" value="updatesystem">
                                        </font></td>
                                    </tr>
                                  </table>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                  &nbsp; </font> </div>
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
  </center>
  </div>
<%@include file="../footer.jsp" %>
	</div>
</body>
</html>
