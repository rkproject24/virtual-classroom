<%	
	String takenby = request.getParameter("takenby");
	String prereq = request.getParameter("prereq");
	String syllabus = request.getParameter("syllabus");
	String maxmarks = request.getParameter("maxmarks");
	String passmarks = request.getParameter("passmarks");

%>	

<div class="boxtop"></div>
		<div class="box">
		<p><b><u>Test Details</u></b><br />
		<script src="${pageContext.request.contextPath}/student/exam/ajax.js"></script>
			<b>Taken By : </b> <%=takenby %><br>
			<b>Pre Requisites : </b> <%=prereq %><br>
			<b>Syllabus : </b> <%=syllabus %><br>
			<b>Max Marks : </b> <%=maxmarks %><br>
			<b>Pass Marks : </b> <%=passmarks %><br><br>
			
			
		</p>

		</div>