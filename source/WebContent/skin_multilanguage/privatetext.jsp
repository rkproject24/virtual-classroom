<%! XMLPropertyResourceBundle chatroomBundle = new XMLPropertyResourceBundle(); %>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,jChatBox.Chat.Filter.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="UserProcessor" class="jChatBox.Service.UserProcessor" scope="application" />
<%
  	    jChatBox.Chat.ChatroomManager ChatroomManager = null;
	    String chatroomName = "", chatroomSubject = "", chatroomDate = "", to = "all";
		ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
		ChatroomUser cUser = (ChatroomUser) session.getValue(XMLConfig.USERSESSIONID);
		Chatroom chatroom = null;
		if (cUser != null)
		{
			int cID = cUser.getParams().getChatroom();
			try
			{
				chatroom = ChatroomManager.getChatroom(cID);
				chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(chatroom.getParams().getLanguage());
				chatroomName = chatroom.getParams().getName();
				chatroomSubject = chatroom.getParams().getSubject();
				chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("privateboard.date.format"))).format(chatroom.getDate());
			    /* I18N support since Servlets 2.3. */
 				//try
				//{
				//  request.setCharacterEncoding(chatroomBundle.getString("global.encoding"));
				//} catch (Exception e) {}
				to = request.getParameter("to");
				if (to==null) to = "ALL";
       			Vector filters = chatroom.getParams().getFilters();
       			jChatBox.Chat.Filter.Filter filter = null;
       			/** Filter username for non-SYSTEM users */
               	if (!(to).equals(XMLConfig.SYSTEMLOGIN))
				{
					for (int f=0;f<filters.size();f++)
					{
						filter = (jChatBox.Chat.Filter.Filter) filters.elementAt(f);
               			to = filter.process(to);
               		}
                }
				response.setContentType("text/html; charset="+chatroomBundle.getString("global.encoding"));
			} catch (ChatException ce)
			  {
			  	/** Chatroom not found */
				response.sendRedirect(response.encodeRedirectURL(Conf.JSPUSERLOGIN));
			  }
		}
		else
		{
			response.sendRedirect(response.encodeRedirectURL(Conf.JSPUSERLOGIN));
		}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" />
<title><%= chatroomBundle.getString("privateboard.title") %></title>
<script language="JavaScript" type="text/JavaScript"><!--
function ready()
{
	document.chat.msg.focus();
}
function SendMessage()
{
	document.chat.submit();
	document.chat.msg.value = "";
	document.chat.reset();
	document.chat.msg.focus();
}
function chat()
{
	document.chat.todo.value="chat";
	SendMessage();
}
//--></script>
<meta http-equiv="Content-Type" content="text/html; charset=<%= chatroomBundle.getString("global.encoding") %>" />
</head>
<body onload="ready()">
<form action="<%= response.encodeURL("content.jsp") %>" method="get" name="chat" target="content" id="chat" onsubmit='SendMessage();return false;'>
  <table width="100%" >
    <tr>
      <td>
        <table>
          <tr>
            <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("privateboard.message.label") %></td>
            <td nowrap="nowrap" colspan="2">
              <input type="text" name="msg" size="45" maxlength="120" />
              <input type="hidden" name="to" value="<%= to %>" />
            </td>
          </tr>
          <tr>
            <td nowrap="nowrap">&nbsp;</td>
            <td class="b" nowrap="nowrap">
              <input type="hidden" name="todo" value="chat" />
              <a href="javascript:chat()"><%= chatroomBundle.getString("privateboard.send.link") %></a><%= chatroomBundle.getString("privateboard.send.label") %><%= to %></td>
            <td nowrap="nowrap"><a href="javascript:window.close();"><%= chatroomBundle.getString("privateboard.close.label") %></a></td>
          </tr>
          <tr>
            <td nowrap="nowrap">&nbsp;</td>
            <td class="si" nowrap="nowrap" colspan="2"><%= chatroomBundle.getString("privateboard.comment.label") %></td>
          </tr>
        </table>
      </td>
      <td>
        <table class="borderin">
          <tr>
            <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("privateboard.chatroom.label") %><%= chatroomName %></td>
          </tr>
          <tr>
            <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("privateboard.subject.label") %><%= chatroomSubject %></td>
          </tr>
          <tr>
            <td class="xsg" nowrap="nowrap"><%= chatroomBundle.getString("privateboard.date.label") %><%= chatroomDate %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>