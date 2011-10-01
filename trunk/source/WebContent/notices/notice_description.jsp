<%

String description = request.getParameter("desc");
System.out.println("Description:" + description);
Utilities util = new Utilities();
String desc = util.decodeString(description);
%>

<%@page import="com.ignou.vcs.commons.Utilities"%>
<div class="boxtop"></div>
<div class="box">
	<p>
		<b><u>Description</u></b><br /><br />
		<%= desc %>
		
		<br /> 
	</p>
</div>