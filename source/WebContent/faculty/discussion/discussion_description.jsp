<%
	String description = request.getParameter("description"); 
	String title = request.getParameter("title");
	String type = request.getParameter("type");
	request.getSession().setAttribute("title",title); 
	
%>	
<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Description</u></b><br />
					<%=description %>
				</p>
				<%if(type.equals("Mgmt"))
				{ %>
				<div class="buttons"><p><a href="${pageContext.request.contextPath}/skin_multilanguage/login.jsp" class="bluebtn"><span>Join</span></a></p></div>
				<%}
				else
				{ %>
					<div class="buttons"><p><a href="${pageContext.request.contextPath}/admin/index.jsp" class="bluebtn"><span>Join</span></a></p></div>
				<%} %>
			</div>