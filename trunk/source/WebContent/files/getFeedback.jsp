<%@page import="com.ignou.vcs.commons.Utilities"%>
<%
	String feedBack = request.getParameter("feedback");
	Utilities util = new Utilities();
	feedBack = util.decodeString(feedBack);
	String status = request.getParameter("status");
 %>
 <div class="boxtop"></div>
<div class="box">
	<p>
	<b><u>Feedback:</u></b><br />
	<%= feedBack %>
	<br />
	<b><u>Status:</u></b><br />
	<%= status %>
	<br />
	</p>
</div>