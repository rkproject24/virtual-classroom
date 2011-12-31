<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Comment</title>
<script type="text/javascript">

function validatePost()
{
	var desc;
	desc = document.fm.description.value;

	 if(desc.length<1)
	{
		alert("Please enter description.");
		return false;
	}
	return true;
}

</script>
</head>
<body>
<center>
<%
	String userName = (String) request.getSession().getAttribute("userId");
	String postId = request.getParameter("p");

%>
<h2>New Post</h2><br><br>
<form action="SubmitComment.jsp" method="post" name="fm" onsubmit="return validatePost()">
<input type="hidden" name="userName" value="<%=userName %>">
<input type="hidden" name="postId" value="<%=postId %>">
<table>
<tr><td>User Name</td><td width="50"></td><td><%=userName %></td></tr>
<tr><td>Description</td><td></td> 
<td><textarea rows="8" cols="30" name="description"></textarea></td>
</tr>
<tr><td></td> <td width="50"></td>
<td> <input type="submit" value="Submit"> 
&nbsp;&nbsp;<input type="reset" value="Clear"> </td>
</tr>
</table>
</form>
</center>
</body>
</html>