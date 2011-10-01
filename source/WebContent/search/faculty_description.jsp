
<%
	String name = request.getParameter("name");
	String qualification = request.getParameter("qualification");
	String email = request.getParameter("email");
	
 %>

<div class="boxtop"></div>
		<div class="box">
		<p><b><u><%=name %></u></b><br />
		<b>Qualification:</b> <%=qualification %> <br>
		
		<b>Email Id: </b> <%=email %>
</p>
</div>

			
		