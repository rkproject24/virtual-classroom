<%! XMLPropertyResourceBundle chatroomBundle = new XMLPropertyResourceBundle(); %>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="jChatBox.Util.*" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<jsp:useBean id="UserLogin" class="jChatBox.Service.UserLogin" scope="page" />

<html>
<head>
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

<%
	jChatBox.Chat.ChatroomManager ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
	String chatroomTotalUsers = "", chatroomMaxUsers = "", chatroomName = "", chatroomSubject = "", chatroomDate = "";
    /* I18N support since Servlets 2.3. */
	//try
	//{
	//  request.setCharacterEncoding(chatroomBundle.getString("global.encoding"));
	//} catch (Exception e) {}
	String chatroomID = request.getParameter("id");
	int ID = -1;
	if ( (chatroomID != null) && (!chatroomID.equals("")) )
	{
		try
		{
			ID = Integer.parseInt(chatroomID);
			Chatroom chatroom = ChatroomManager.getChatroom(ID);
			chatroomName = chatroom.getParams().getName();
			chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(chatroom.getParams().getLanguage());
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("login.date.format"))).format(chatroom.getDate());
		} catch (Exception e)
		  {}
	}
	else
	{
		Vector vChat = ChatroomManager.getChatrooms();
		if (vChat.size() > 0)
		{
			Chatroom chatroom = (Chatroom) vChat.elementAt(0);
			ID = chatroom.getParams().getID();
			chatroomName = chatroom.getParams().getName();
			chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(chatroom.getParams().getLanguage());
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("login.date.format"))).format(chatroom.getDate());
		}
                else
                {
                   chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(XMLConfig.DEFAULTLANGUAGE);
                }
	}
	response.setContentType("text/html; charset="+chatroomBundle.getString("global.encoding"));
	String jspDisplay = UserLogin.doLogin(request, session);
	if (jspDisplay != null)
	{
		//response.sendRedirect(response.encodeRedirectURL(jspDisplay));
		%><jsp:forward page="<%= response.encodeURL(jspDisplay) %>" /><%
	}
%>
<script type="text/javascript">
function ready()
{
	if(self.name == "content") self.parent.location.href=self.location;
	document.chat.name.focus();
}
function enter()
{
	document.chat.submit();
}
function info(id)
{
	if ((id.length > 0) && (id > -1))
	{

		
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<%-- tpl:put name="headarea" --%>
<title>Virtual Classroom System</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>
<%-- /tpl:put --%>
</head>
<body onload="ready()">
<%@include file="../header.jsp" %>
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
<form action="<%= response.encodeURL("login.jsp") %>" method="post" name="chat" id="chat">
  <table width="40%" border="1" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td valign="top">
        <table width="100%">
          <tr>
            <td colspan="2" nowrap="nowrap">
              <table width="100%">
                <tr>
                  <td class="b" nowrap="nowrap">Name
                    <input type="text" name="name" size="40" maxlength="16" value="<%= userName %>"/>
                  </td>
                </tr>
                    <%
                    	if (UserLogin.getSysMessage()==Conf.CHATROOMNOTFOUND) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.chatroomnotfound.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.CLOSED) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.closed.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.NOVACANCIES) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.novacancies.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.NAMENOTAVAILABLE) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.namenotavailable.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.BANNED) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.banned.error")+"</td></tr>");
                    %>
              </table>
            </td>
          </tr>
          
              <tr>
              <td><b><%= chatroomBundle.getString("login.join.label") %></b>
              <select name="chatrooms" onchange="info(this.options[selectedIndex].value);" class="dropdown">
                <option value="-1"><%= chatroomBundle.getString("login.list.label") %></option>
                 <%
                     if (ChatroomManager != null)
                     {
                   	Vector chatrooms = ChatroomManager.getChatrooms();
                   	Chatroom chatroom = null;
                   	String selection = "";
                   	for (int i=0;i<chatrooms.size();i++)
                   	{
                   		chatroom = (Chatroom) chatrooms.elementAt(i);
                   		if (ID == chatroom.getParams().getID()) selection = " selected=\"selected\"";
                   		else selection="";
                   		out.println("<option value=\""+chatroom.getParams().getID()+"\""+selection+">"+chatroom.getParams().getName()+"</option>");
                   	}
                     }
                 %>
              </select>
              </td>
          </tr>
          <tr>
            <td class="b" colspan="2" nowrap="nowrap" align = "center"><a href="javascript:enter()"><%= chatroomBundle.getString("login.join.link") %></a>
              </td>
              </tr>
        </table>
      </td>
      <td align="right">
        <table class="borderin" border="0">
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("login.chatroom.label") %><%= chatroomName %></td>
				</tr>
				<tr>
                  <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("login.subject.label") %><%= chatroomSubject %></td>
                </tr>
				<tr>
				  <td class="xsg" nowrap="nowrap"><%= chatroomBundle.getString("login.open.label") %><%= chatroomDate %></td>
				</tr>
				<tr>
                  <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("login.useramount.label") %><%= chatroomTotalUsers %></td>
                </tr>
				<tr>
                  <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("login.userlimit.label") %><%= chatroomMaxUsers %></td>
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
