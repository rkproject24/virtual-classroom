<%@page import="com.ignou.vcs.report.database.ReportDatabaseActivities"%>
<%@page import="com.ignou.vcs.report.beans.*"%>
<%
	String testid = request.getParameter("testid");
	String flag = request.getParameter("flag");
	String userid = (String)request.getSession().getAttribute("userId");
	System.out.println("Studentid: " + userid);
	ReportDatabaseActivities dbObj = new ReportDatabaseActivities();
	java.util.ArrayList list = dbObj.getReport(testid,userid);
	
	ArrayList classReportlist = dbObj.classReport(testid); 
	System.out.println("SIZE" + classReportlist.size());
	for(int i = 0;i<classReportlist.size();i++)
	{
		classReport bean = (classReport)classReportlist.get(i);
		String name = bean.getStudentname();
		System.out.println("Studentname:" + name);
	}
	
	String totalMarks = dbObj.getTotalMarks(userid, testid);
	
	
	
	request.getSession().setAttribute("graphData",list);
	request.getSession().setAttribute("classGraphData",classReportlist);
	getTests testbean = (getTests)dbObj.getTest(testid);
	
	String prereq = testbean.getPrereq();
	String syllabus = testbean.getSyllabus();
	String maxmarks = testbean.getMax_marks();
	String passmarks = testbean.getPass_marks();
	String duration = testbean.getDuration();
	String testType = testbean.getTest_type();
	String linkGraph = "displayGraphs.jsp";
	request.getSession().setAttribute("tm",totalMarks);

%>

	
<%@page import="java.util.ArrayList"%>


<%@page import="com.ignou.vcs.beans.getTests"%><div class="boxtop"></div>
		<div class="box">
		<p><b><u>Test Details</u></b><br />
	
			<%
			if(testType.equals("1"))
			{
			%>
				<b>Pre Requisites : </b> <%=prereq %><br>
				<b>Syllabus : </b> <%=syllabus %><br>
			<%}
			 %>	
				<b>Max Marks : </b> <%=maxmarks %><br>
				<b>Pass Marks : </b> <%=passmarks %><br>
				<b>Duration : </b> <%=duration  + " Mins"%><br><br>
			<%
			
			if(flag.equals("1"))
			{
				
			%>
			
			<a href  = "javascript:jah('<%=linkGraph %>','id1');" class = "bluebtn"><span>Graphical Analysis</span></a>
			<%}
			 %>
			 <a href="javascript:jah('classReport.jsp','id1');" class = "bluebtn"><span>Class Performance</span></a>  
		</p>

		</div>
	