<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Post</title>
<script type="text/javascript">

function validatePost()
{
	var pstTitle, desc;
	pstTitle = document.fm.postTitle.value;
	desc = document.fm.description.value;

	if(pstTitle.length<1)
	{
		alert("Please enter title.");
		return false;
	}else if(desc.length<1)
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
	String subjectId = request.getParameter("s");

%>
<h2>New Post</h2><br><br>
<form action="SubmitPost.jsp" method="post" name="fm" onsubmit="return validatePost()">
<input type="hidden" name="subjectId" value="<%=subjectId %>">
<input type="hidden" name="userName" value="<%=userName %>">
<table>
<tr><td>User Name</td><td width="50"></td><td><%=userName %></td></tr>
<tr><td>Title</td><td width="50"></td><td width="300"><input type="text" name="postTitle" width="500"></td></tr>
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