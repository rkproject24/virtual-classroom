<%
	String description = request.getParameter("description"); %>

<div class="boxtop"></div>
<div class="box">
	<p>
		<b><u>Description</u></b><br />
		<%=description %>
	</p>
	<div class="buttons"><p><a class = "bluebtn" href="${pageContext.request.contextPath}/skin_multilanguage/login.jsp"><span>Join</span></a></p></div>
</div>