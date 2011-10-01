<script src = "${pageContext.request.contextPath}/faculty/discussion/ajax.js"></script>
<%
	
	String userid1 = (String)request.getSession().getAttribute("userId");
	String url = "discussion_mgmt.jsp?userid=" + userid1;
	
 %>
<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Discussion Category</u></b><br />
		<a href = "javascript:jah2('<%=url %>','id1','Courses')">Course Wise</a><br/>
		<a href = "javascript:jah2('<%=url %>','id1','Subjects')">Subject Wise</a><br />
				
		</p>

</div>