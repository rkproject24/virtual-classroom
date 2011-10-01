<%! XMLPropertyResourceBundle chatroomBundle = new XMLPropertyResourceBundle(); %>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="UserProcessor" class="jChatBox.Service.UserProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	String chatroomName = "", chatroomSubject = "", chatroomDate = "";
	String jspDisplay = UserProcessor.execute(request,response,session,application);
	if (jspDisplay != null)
	{
		response.sendRedirect(response.encodeRedirectURL(jspDisplay));
	}
	else
	{ 
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
				chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("board.date.format"))).format(chatroom.getDate());
				response.setContentType("text/html; charset="+chatroomBundle.getString("global.encoding"));
			} catch (ChatException ce)
			  {
			  	/** Chatroom not found */
				response.sendRedirect(response.encodeRedirectURL(Conf.JSPUSERLOGIN));
			  }
		}
	}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" />
<title><%= chatroomBundle.getString("board.title") %></title>
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
  <table class="borderdeco" width="100%">
    <tr>
      <td width="86%">
        <table>
          <tr>
            <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("board.message.label") %></td>
            <td nowrap="nowrap"><input type="text" name="msg" size="45" maxlength="120" />
              <input type="hidden" name="to" value="ALL" />
            </td>
            <td class="b" nowrap="nowrap"><a href="javascript:chat()"><%= chatroomBundle.getString("board.send.link") %></a><%= chatroomBundle.getString("board.send.label") %>
            </td>
          </tr>
          <tr>
            <td nowrap="nowrap">&nbsp;</td>
            <td nowrap="nowrap">
              <input type="hidden" name="todo" value="chat" />
            </td>
            <td nowrap="nowrap"><a href="<%= response.encodeURL("content.jsp?todo=refresh") %>" target="content"><%= chatroomBundle.getString("board.refresh.link") %></a>
              <a href="<%= response.encodeURL("content.jsp?todo=logout") %>" target="_parent"><%= chatroomBundle.getString("board.logout.link") %></a>&nbsp;
            </td>
          </tr>
        </table>
      </td>
      <td width="14%">
        <table class="borderin">
          <tr>
            <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("board.chatroom.label") %><%= chatroomName %></td>
          </tr>
          <tr>
            <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("board.subject.label") %><%= chatroomSubject %></td>
          </tr>
          <tr>
            <td class="xsg" nowrap="nowrap"><%= chatroomBundle.getString("board.date.label") %><%= chatroomDate %></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>