<%@ page import="com.ignou.vcs.commons.Utilities,com.ignou.vcs.commons.database.*,com.ignou.vcs.commons.beans.*;" %>

<html>
<body>
<%
	String description = request.getParameter("desc");
	Utilities util = new Utilities();
	String decodedDesc = util.decodeString(description);
	System.out.println("description"+ decodedDesc);
	
%>
<div class="box">
	<b><u>Description</u></b>
	<p><%=decodedDesc%> </p>
</div>

</body>
</html>
