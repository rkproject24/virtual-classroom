<html>
<%@ page import="jChatBox.Util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,jChatBox.Chat.Filter.*,java.util.*" %>
<jsp:useBean id="SystemProcessor" class="jChatBox.Service.ModeratorProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	String jspDisplay = SystemProcessor.execute(request,session,application);
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
<script language="JavaScript"><!--
function validate()
{
	if (document.chatroom.name.value.length != 0)
	{
		if (document.chatroom.subject.value.length != 0)
		{
			document.chatroom.todo.value = "openchatroom";
                        document.chatroom.submit();
		}
		else
		{
			alert("You have to fill in SUBJECT parameter !");
		}
	}
	else
	{
		alert("You have to fill in NAME parameter !");
	}
}
function cancel()
{
	location.href="menu.jsp";
}
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
//--></script>
<title>Open Chatroom</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style2.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css" type="text/css">
</head>
<body onLoad="javascript:loadCss()" bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">
<%@include file="../header.jsp"%>
				<div class="left">
					<div class="left_articles">
<%@include file="../DisplayCalendar.jsp"%>
				<h2><a href="#"><u>Virtual Classroom System</u></a></h2>
				<p class="description">Studying the e-way.</p>
			</div>	
			
<%
	String title = (String)request.getSession().getAttribute("title");
	 %>
	 
<form method="post" action="menu.jsp" name="chatroom">
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
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
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
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>Open
              a chatroom</b></font></td>
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
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#0000FF">
                                  <font face="Arial, Helvetica, sans-serif">-
                                  Setup parameters to open a chatroom -</font></font></b></font><br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b><font size="-2">
                                  <%
                                	if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNAMEMISSING)) out.print("Chatroom's name missing !");
                                  	else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("Chatroom's subject missing !");
                                  %>
                                  </font></b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-2"><b>
                                  </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><br>
                                  <br>
                                  </b></font>
                                  <table width="65%" border="0" cellspacing="1" cellpadding="0">
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099">Basic
                                        parameters :</font></b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Name
                                        : <% if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNAMEMISSING)) out.print("<font color=#ff0000>*</font>"); %></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="name" size="16" class="SystemBox" value = "<%=title%>">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Subject
                                        : <% if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("<font color=#ff0000>*</font>"); %></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="subject" size="16" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Max.
                                        users : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="maxusers" class="SystemBox">
                                          <option value="5">5</option>
                                          <option value="10">10</option>
                                          <option value="15">15</option>
                                          <option value="20" selected>20</option>
                                          <option value="25">25</option>
                                          <option value="30">30</option>
                                          <option value="35">35</option>
                                          <option value="40">40</option>
                                          <option value="45">45</option>
                                          <option value="50">50</option>
                                          <option value="55">55</option>
                                          <option value="60">60</option>
                                          <option value="65">65</option>
                                          <option value="70">70</option>
                                          <option value="75">75</option>
                                          <option value="80">80</option>
                                          <option value="85">85</option>
                                          <option value="90">90</option>
                                          <option value="95">95</option>
                                          <option value="100">100</option>
                                          <option value="150">150</option>
                                          <option value="200">200</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Display
                                        mode : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="mode" class="SystemBox">
                                          <option value="framed">Framed (JSP)</option>
                                          <option value="bufferedframed" selected>Buffered-Framed
                                          (JSP)</option>
                                          <option value="applet">Applet</option>
                                          <option value="flash">Flash</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                  </table>
                                  <hr noshade width="65%" size="1">
                                  <!-- 
                                  <table width="65%" border="0" cellspacing="1" cellpadding="0">
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099">Advanced
                                        parameters :</font></b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">History
                                        : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="history" class="SystemBox">
                                          <option value="20">20</option>
                                          <option value="30">30</option>
                                          <option value="35" selected>35</option>
                                          <option value="40">40</option>
                                          <option value="45">45</option>
                                          <option value="50">50</option>
                                          <option value="55">55</option>
                                          <option value="60">60</option>
                                          <option value="70">70</option>
                                          <option value="80">80</option>
                                          <option value="90">90</option>
                                          <option value="100">100</option>
                                          <option value="120">120</option>
                                          <option value="150">150</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Refresh
                                        limit : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshlimit" class="SystemBox">
                                          <option value="3">3 seconds</option>
                                          <option value="5">5 seconds</option>
                                          <option value="8">8 seconds</option>
                                          <option value="10">10 seconds</option>
                                          <option value="12" selected>12 seconds</option>
                                          <option value="15">15 seconds</option>
                                          <option value="18">18 seconds</option>
                                          <option value="20">20 seconds</option>
                                          <option value="25">25 seconds</option>
                                          <option value="30">30 seconds</option>
                                          <option value="40">40 seconds</option>
                                          <option value="50">50 seconds</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Refresh
                                        model : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshmodel" class="SystemBox">
                                          <option value="1"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Time-Constant</font></option>
                                          <option value="2" selected><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Action-Tracker</font></option>
                                          <option value="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Room-Load</font></option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Private
                                        messages : </font></td>
                                      <td>
                                        <table width="60%" border="0" cellspacing="1" cellpadding="0">
                                          <tr>
                                            <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="radio" name="private" value="yes" checked>
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Yes</font></td>
                                            <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="radio" name="private" value="no">
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">No</font></td>
                                          </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Language
                                        : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="language" class="SystemBox">
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
                                      <td valign="top"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Filters
                                        : </font></td>
                                      <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <%
												Vector vFiltersList = XMLConfig.FILTERS;
												jChatBox.Chat.Filter.Filter aFilter = null;
												String Check = " checked";
												for (int f=0;f<vFiltersList.size();f++)
												{
													aFilter = (jChatBox.Chat.Filter.Filter) vFiltersList.elementAt(f);
													%>
                                          <tr>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                              <input type="checkbox" name="<%= aFilter.getID() %>" value="ok"<%= Check %>>
                                              </font></td>
                                            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= aFilter.getName() %></font></td>
                                          </tr>
                                          <%
												}
										%>
                                        </table>
                                      </td>
                                    </tr>
                                  </table>
                                   -->
                                  <hr noshade width="65%" size="1">
                                  <table border="0" cellspacing="1" cellpadding="1" width="65%">
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099">Moderators
                                        :</font></b></font></td>
                                      <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">Multiple
                                        moderator selection is allowed.</font></td>
                                    </tr>
                                    <tr>
                                      <td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        </font></td>
                                      <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="moderatorlist" size="3" multiple class="SystemBox">
                                          <% if ( (XMLConfig.MODERATORS != null) && (!XMLConfig.MODERATORS.isEmpty()) )
													  {
                                                        %>
                                          <option value="">- Select moderator(s) -</option>
                                          <%
														ChatroomUser cUser = (ChatroomUser) session.getValue(XMLConfig.USERSESSIONID);
														String preselection = null;
														if ((cUser != null) && (cUser.getType()==User.MODERATOR)) preselection = cUser.getName();
														Enumeration e = XMLConfig.MODERATORS.keys();
														while (e.hasMoreElements())
														{
															String name = (String) e.nextElement();
															if ((preselection != null) && (preselection.equals(name)))
															{
															%><option selected value="<%= name %>"><%= name %></option><%
															}
															else
															{
															%><option value="<%= name %>"><%= name %></option><%
															}
														}
													  }
													  else
													  {
                                                        %>
                                          <option value="">- No moderator available -</option>
                                          <%
													  }
													%>
                                        </select>
                                        </font></td>
                                    </tr>
                                  </table>
                                  <br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                  </font>
                                  <table border="0" cellspacing="2" cellpadding="1">
                                    <tr>
                                      <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Button" value="Open" onClick="validate()" class="SystemButton">
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Cancel" value="Cancel" onClick="cancel()" class="SystemButton">
                                        <input type="hidden" name="todo" value="openchatroom">
                                        </font></td>
                                    </tr>
                                  </table>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                  &nbsp;</font></div>
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
  
<%@include file="../footer.jsp" %>
	</div>
</body>
</html>
