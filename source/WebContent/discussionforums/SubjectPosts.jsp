<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.forums.beans.PostsBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.forums.ForumDatabaseOperations"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Posts</title>
<script type="text/javascript">
function replyToThisPost(postId,user)
{
	if(user=="")
	{
		alert("Please login to Comment.");
		return false;
	}
	var param = "NewComment.jsp?p="+postId;

	newwindow=window.open(param,'chld','height=500,width=580,resize=0');
	if (window.focus) {newwindow.focus();}
}

function newPost(sub,user)
{
	if(user=="")
	{
		alert("Please login to post.");
		return false;
	}
	var param = "NewPost.jsp?s="+sub;

	newwindow=window.open(param,'chld','height=500,width=580,resize=0');
	if (window.focus) {newwindow.focus();}
}

function viewComments(postId)
{
	window.location.href = 'PostDetails.jsp?p='+postId; 
}

function showUserPosts(userName)
{
	window.location.href = 'UserPosts.jsp?u='+userName;
}

function readPost(postId)
{
	window.location.href = 'PostDetails.jsp?p='+postId; 
}

function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if (browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href = "${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href = "${pageContext.request.contextPath}/theme/css/menu_ie.css";
	} else {
		stylesheet.href = "${pageContext.request.contextPath}/theme/css/style1.css";
		menusheet.href = "${pageContext.request.contextPath}/theme/css/menu.css";
	}
}

</script>
<link id="pagestyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/style1.css" />
<link id="menustyle" type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/menu.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>

<!-- LightBox css and scripts -->
<%
	String usid = (String) request.getSession().getAttribute("userId");
	if(usid != null) {
 %>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/theme/css/lightbox_vid.css"
	media="screen,projection" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>


<%
 }
 
  %>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<title>Virtual Classroom System</title>
</head>
<body onLoad="javascript:loadCss()">

<%@include file="../header.jsp"%>

<div class="left">
<div class="left_articles">
<div class="buttons"></div>
<%@include file="../DisplayCalendar.jsp"%>
<h2><a href="../index.jsp"><u>Virtual Classroom System</u></a></h2>
<p class="description">Studying the e-way.</p>
<center>
<%
	String sub = request.getParameter("s");
	int subjectId = Integer.parseInt(sub);
	if(subjectId>0)
	{
		ArrayList<PostsBean> allPosts = ForumDatabaseOperations.getPosts(subjectId);
%>
		<%
		if(allPosts.size()>0)
		{
			for(int i=0;i<allPosts.size();i++)
			{
				PostsBean post = allPosts.get(i);
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy hh:mm");
				String postDesc = post.getPostDescription();
				if(postDesc.length()>50)
				{
					postDesc = postDesc.substring(0,49)+"...";
				}
			%>
		<table  width="100%" style="background-color: #e4d2b8">
			<tr><td rowspan="6"><%=i+1 %> </td><td align="left"><b><%=post.getPostTitle() %></b></td></tr>
			<tr height="15"></tr>
			<tr><td colspan="2" align="left"><%=postDesc %></td></tr>
			<tr><td align="left">
				<a href="javaScript: readPost(<%=post.getPostId() %>)">Read</a>&nbsp;&nbsp;&nbsp;
				<a href="javaScript: replyToThisPost(<%=post.getPostId() %>)">Reply</a>&nbsp;&nbsp;&nbsp;<a href="javaScript: viewComments(<%=post.getPostId() %>)">Comments(<%=post.getNoOfComments() %>)</a> </td></tr>
			<tr height="15"></tr>
			<tr><td align="left">by <a href="javaScript: showUserPosts('<%=post.getPostBy() %>')"><%=post.getPostBy() %> </a>at <%=sdf.format(post.getPostedDate()) %></td></tr>
		</table>
		<%
			}
		}else
		{
			out.println("<font color='red'>No posts available.</font>");
		}
	}
%>
<br>
<hr>
<br>
<input type="button" value="New Post" onclick="javaScript: newPost(<%=subjectId %>,'<%=userName %>')">
</center></div></div>
	<div id="right">
			<div class="boxtop"></div>
			<%@include file="Polls.jsp" %>
		</div>	
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html>