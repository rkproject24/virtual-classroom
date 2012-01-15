<%
	String userid = request.getParameter("userid");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	StudentBean stuBean = dbObj.getStudentDetails(userid);
	String name = stuBean.getName();
	
%>	
	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.StudentBean"%><div class="boxtop"></div>
		<div class="box">
		<p><b><u><%=name %></u></b><br />
		<script src="${pageContext.request.contextPath}/search/ajax.js"></script>
			<b>Date of Birth : </b> <%=stuBean.getDob()%><br>
			<b>Alternative Email : </b> <%=stuBean.getEmailS() %><br>
			<b>Start Date : </b> <%=stuBean.getStartDate() %><br>
			<b>Contact No : </b> <%=stuBean.getContactP() %><br>
			<b>Address : </b> <%=stuBean.getAddress() %><br><br>
			<%
			String url = "student_report.jsp?userid=" + userid;
			 %>
			<a href="javascript:jah1('<%=url %>','id1');" class="greenbtn"><span>View Scores</span></a>  
			
		</p>

		</div>
