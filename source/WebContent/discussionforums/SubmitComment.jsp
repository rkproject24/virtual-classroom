<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.ignou.vcs.forums.ForumDatabaseOperations"%>
<%@page import="com.ignou.vcs.forums.beans.PostsBean"%>
<%@page import="com.ignou.vcs.forums.beans.CommentBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Post</title>
<script type="text/javascript">
function closeMe(postId)
{
	window.opener.document.location.href = "PostDetails.jsp?p="+postId;
	self.close();
}
</script>
</head>
<body>
<center>
<%
	String post = request.getParameter("postId");
	int postId = Integer.parseInt(post);
	String commentDesc = request.getParameter("description");
	String userName = request.getParameter("userName");

	CommentBean cb = new CommentBean();
	cb.setCommentDescription(commentDesc);
	cb.setCommentedBy(userName);
	cb.setPostId(postId);
	
	Boolean isAdded = ForumDatabaseOperations.insertComment(cb);
	
	if(isAdded)
	{
		%>
		<font color="green"> Your comment submitted successfully.</font>
		<br><br><input type="button" value="Close" onclick="closeMe(<%=cb.getPostId() %>)">
		<%
	}else
	{
		out.println("<font color='red'> Error in submitting your post. Please try again.</font>");
	}
	
%>

</center>
</body>
</html>