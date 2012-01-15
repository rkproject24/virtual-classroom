<%@ page import="com.ignou.vcs.beans.*,com.ignou.vcs.database.*,com.ignou.vcs.report.database.*,com.ignou.vcs.report.beans.*" %>
<%
	String stuId = request.getParameter("stuId");
	String cId = request.getParameter("cid");
	String subjectId = request.getParameter("sid");
	String testType = (String)request.getSession().getAttribute("testType");
	String facId = (String)request.getSession().getAttribute("userId");
	request.getSession().setAttribute("stuId",stuId);
	request.getSession().setAttribute("cid",cId);
	VCSDatabaseActivities dbObj1 = new VCSDatabaseActivities();
	StudentBean stuBean = dbObj1.getStudentDetails(stuId);
	String name = stuBean.getName();
	
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	java.util.ArrayList list = dbObj.getMinorTest(facId,cId,stuId,testType);
	request.getSession().setAttribute("list",list);
	
	
	
%>	
	
<%@page import="com.ignou.vcs.beans.StudentBean"%><div class="boxtop"></div>
		<div class="box">
		<p><b><u><%=name%></u></b><br />
		
			<b>Date of Birth : </b><%=stuBean.getDob()%><br>
			<b>Course Start Date : </b> <%=stuBean.getStartDate()%><br>
			<b>Contact No : </b> <%=stuBean.getContactP()%><br>
			<b>Address : </b> <%=stuBean.getAddress()%><br><br>
			
			<a href="javascript:jah('faculty_studentMajor.jsp','forms')" accesskey="m"  class="greenbtn"><span>View Test Reports</span></a>
			<a href="student_baseReportGraph.jsp" accesskey="m" target="new" class="greenbtn"><span>Graphical Analysis</span></a>
			
			
			
		</p>

		</div>
