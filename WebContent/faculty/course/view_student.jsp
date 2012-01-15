<%
	String userid = request.getParameter("q");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	StudentBean stuBean = dbObj.getStudentDetails(userid);
	String name = stuBean.getName();
	
%>	
	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.StudentBean"%><div class="boxtop"></div>
		<div class="box">
		<p><b><u><%=name %></u></b><br />
		
			<b>Date of Birth : </b> <%=stuBean.getDob()%><br>
			<b>Alternatice Email : </b> <%=stuBean.getEmailS() %><br>
			<b>Start Date : </b> <%=stuBean.getStartDate() %><br>
			<b>Contact No : </b> <%=stuBean.getContactP() %><br>
			<b>Address : </b> <%=stuBean.getAddress() %><br><br>
			<%
			String url = "student_report.jsp";
			 %>
			<a href="javascript:jah('<%=url %>','id1','<%=userid %>');" class="greenbtn"><span>View Scores</span></a>  
			
		</p>

		</div>
