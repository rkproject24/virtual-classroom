<%
	request.getSession().invalidate();
	response.sendRedirect("NewLogin.jsp");
%>