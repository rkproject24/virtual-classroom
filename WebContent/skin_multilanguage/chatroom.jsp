<%@page import="jChatBox.*"%>
<%@page import="java.util.Vector"%>
<html>
<head>
<% if (dMode != Conf.BUFFEREDFRAMED) { %><meta http-equiv="Refresh" content="<%= refreshValue %>;URL=<%= response.encodeURL("content.jsp?todo=refresh") %>" /><%}%>
<link rel="stylesheet" type="text/css" href="styles.css" />
<title><%= chatroomName %></title>
<script language="JavaScript" type="text/JavaScript"><!--
function scrollFrame()
{
<% if (dMode == Conf.BUFFEREDFRAMED) { %>if (document.all) document.body.scrollTop;parent.dbcontent.scrollBy(0,1000);<% } else { %>if (document.all) document.body.scrollTop;parent.content.scrollBy(0,1000);<% } %>
}
function privatemsg(user)
{
 window.open('<%= response.encodeURL("privatetext.jsp?to=") %>'+escape(user)+'','PrivateMessage','resizable=yes,width=600,height=70');
}
//--></script>
<meta http-equiv="Content-Type" content="text/html; charset=<%= chatroomBundle.getString("global.encoding") %>" />
</head>
<body onLoad="javascript:loadCss()">

<center>
<table width="99%" height="100%" border="0" cellspacing="1" cellpadding="0">
<tr>
<td align="center" valign="bottom">
	<%
       /** Display chat content. Top - Bottom */
       StringBuffer sb = new StringBuffer();
	   if (chatroom != null)
	   {
         Vector v = chatroom.getChat(cUser.getName());
         Vector filters = chatroom.getParams().getFilters();
         jChatBox.Chat.Filter.Filter filter = null;
         if (v != null)
         {
            Msg message = null;
            String messageStr = null;
            String fromStr = null;
            int i = v.size() - (chatroom.getParams().getHistory());
            if (i<0) i = 0;
            int lines = 0;
      		sb.append("<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\">\n");
            while ( (i<v.size()) && (lines<chatroom.getParams().getHistory()) )
            {
               message = (Msg) v.elementAt(i);
               messageStr = message.getMsg();
               fromStr = message.getFrom();
               /** Filter From and Msg fields for non-SYSTEM users */
               if (!(message.getFrom()).equals(XMLConfig.SYSTEMLOGIN))
               {
               		for (int f=0;f<filters.size();f++)
               		{
						filter = (jChatBox.Chat.Filter.Filter) filters.elementAt(f);
               			fromStr = filter.process(fromStr);
               			messageStr = filter.process(messageStr);
               		}
               }
               i++;
               lines++;
			   sb.append("<tr>\n");
               // System Administrator message.
               if ( message.getType() == Msg.SYSTEM )
               {
                  sb.append("<td valign=\"top\" class=\"system\">### "+message.getMsg()+"</td>\n");
			   }
               // Join message.
               if ( message.getType() == Msg.JOIN )
               {
                  sb.append("<td valign=\"top\" class=\"join\">*** "+messageStr+chatroomBundle.getString("chatroom.join.label")+"</td>\n");
               }
               // Quit message.
                else if ( message.getType() == Msg.LEFT )
               {
                  sb.append("<td valign=\"top\" class=\"quit\">*** "+messageStr+chatroomBundle.getString("chatroom.quit.label")+"</td>\n");
               }
               // Private message.
               else if ( message.getType() == Msg.PRIVATE )
               {
                  sb.append("<td valign=\"top\" class=\"private\">&lt;"+fromStr+"&gt;&nbsp;"+messageStr+"</td>\n");
               }
               // Message for all users in the chatroom.
               else
               {
                  sb.append("<td valign=\"top\">&lt;"+fromStr+"&gt;&nbsp;"+messageStr+"</td>\n");
               }
               sb.append("</tr>\n");
            }
      		sb.append("</table>\n");
         }
	 	 out.print(new String(sb));
	   }
	%>
  </td>
	<td valign="bottom" align="right">
            <table class="border" cellspacing="0">
              <tr class="head" align="center">
                <td class="sb" nowrap="nowrap"><%= chatroomBundle.getString("chatroom.userlist.label") %><%= chatroomTotalUsers %>/<%= chatroomMaxUsers %></td>
              </tr>
              <tr>
                <td nowrap="nowrap">
				<%
				  /** Display users list. Links to privatemsg could be enabled. Head depends on user Type.*/
				  if (chatroom != null)
				  {
					String priv = null;
					sb = new StringBuffer();
				  	Hashtable table = chatroom.getUsers();
				    Enumeration e = table.keys();
			        String name = null;
			        String username = null;
      				ChatroomUser user = null;
         			Vector filters = chatroom.getParams().getFilters();
         			jChatBox.Chat.Filter.Filter filter = null;
      				while (e.hasMoreElements())
      				{
              			name = (String) e.nextElement();
              			user = (ChatroomUser) table.get(name);
              			username = user.getName();
              			/** Filter username for non-SYSTEM users */
						if (user.getType() != User.SYSTEM)
						{
							for (int f=0;f<filters.size();f++)
							{
								filter = (jChatBox.Chat.Filter.Filter) filters.elementAt(f);
		               			username = filter.process(username);
		               		}
		                }
              			if (chatroom.getParams().getPrivateStatus()==true) priv = "<a class=\"s\" href=\"javascript:privatemsg('"+user.getName()+"')\">"+username+"</a><br />";
						else priv = username+"<br />";
              			if (user.getType() == User.SYSTEM) priv="@"+priv;
              			else if (user.getType() == User.MODERATOR) priv="#"+priv;
              			sb.append(priv);
				  	}
      				
      				out.print(new String(sb));
      			  }
				%>
                </td>
              </tr>
            </table>
      <br />
    </td>
  </tr>
</table>
</center>
<script language="JavaScript" type="text/JavaScript">scrollFrame();</script>
</body>
</html>