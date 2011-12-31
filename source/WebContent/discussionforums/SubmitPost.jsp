<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.ignou.vcs.forums.ForumDatabaseOperations"%>
<%@page import="com.ignou.vcs.forums.beans.PostsBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Post</title>
<script type="text/javascript">
function closeMe(sub)
{
	window.opener.document.location.href = "SubjectPosts.jsp?s="+sub;
	self.close();
}
</script>
</head>
<body>
<center>
<%
	String sub = request.getParameter("subjectId");
	String postTitle = request.getParameter("postTitle");
	String postDesc = request.getParameter("description");
	String userName = request.getParameter("userName");
	int subjectId = Integer.parseInt(sub);

	PostsBean pb = new PostsBean();
	pb.setPostTitle(postTitle);
	pb.setPostDescription(postDesc);
	pb.setPostBy(userName);
	pb.setSubjectId(subjectId);
	
	Boolean isAdded = ForumDatabaseOperations.insertPost(pb);
	
	if(isAdded)
	{
		%>
		<font color="green"> Your post submitted successfully.</font>
		<br><br><input type="button" value="Close" onclick="closeMe(<%=subjectId %>)">
		<%
	}else
	{
		out.println("<font color='red'> Error in submitting your post. Please try again.</font>");
	}
	
%>

</center>
</body>
</html>