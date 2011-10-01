<%
	String userid1 = (String)request.getSession().getAttribute("userId");
	String url = "discussion_faculty.jsp?userid=" + userid1;
	 %>

<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Scheduled By</u></b><br />
		<a href = "javascript:jah2('<%=url %>','id1','Self')">Self</a><br/>
		<a href = "javascript:jah2('<%=url %>','id1','Mgmt')">Management</a><br />
				
		</p>

</div>