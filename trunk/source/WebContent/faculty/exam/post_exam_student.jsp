
<%@page import="java.awt.Window"%>
<%@page import="com.ignou.vcs.forms.Test_paper"%>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%@page import = "java.util.*,javax.servlet.*,javax.naming.*,javax.servlet.http.*,java.sql.*" %>


<%@page import="com.ignou.vcs.beans.getTests"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.FacultyBean"%><script src="${pageContext.request.contextPath}/faculty/exam/js/exam_student_js.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/lightbox.css" media="screen,projection" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/prototype.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/lightbox.js"></script>

<%
	String subjectid = request.getParameter("subjectid");
	String courseid = (String)request.getSession().getAttribute("courseid");
	
	
	ArrayList test_list = new ArrayList();
	VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
	System.out.println(courseid + " " + subjectid);
	test_list = db_obj.getTest(subjectid,courseid);
		String testid;
		String testname = "";
		String testtype = "";
		String prerequisites = "";
		String syllabus = "";
		String takenby = "";
		String maxmarks = "";
		String passmarks = "";
		String duration = "";
		%>
		<table>
		<tr><td>
		<b>Test Name</b>
		</td><td>
		
		<b>Taken By</b>
		</td></tr>
		
		<%
		for(int i = 0;i<test_list.size();i++)
		{
			
			getTests test_obj = (getTests)test_list.get(i);
			testid = test_obj.getTestid();
			testtype = test_obj.getTest_type();
			maxmarks = test_obj.getMax_marks();
			passmarks = test_obj.getPass_marks();
			prerequisites = test_obj.getPrereq();
			syllabus = test_obj.getSyllabus();
			
			duration = test_obj.getDuration();
			
			prerequisites = addXML.unescapeForXML(prerequisites);
			syllabus = addXML.unescapeForXML(syllabus);
			duration = addXML.unescapeForXML(duration);
			System.out.println("Pre requisites :" + duration);
			String testType = "";
			if(testtype.equals("0"))
				testType = "Major";
				else
				testType = "Minor";
			
			takenby = test_obj.getTaken_by();
			
			FacultyBean faculty = new FacultyBean();
			faculty = db_obj.getFacultyDetails(takenby);
			String name = faculty.getName();
			String link = "takeTest_details.jsp?testid=" + testid + "&testtype=" + testType + "&prereq=" + prerequisites + "&syllabus=" + syllabus + "&maxmarks=" + maxmarks + "&passmarks=" + passmarks + "&duration=" + duration;
			%>
			<input type = "hidden" id = "testid" value = <%=testid %>>
			<input type = "hidden" id = "testtype" value = <%=testType %>>
			<input type = "hidden" id = "prereq" value = <%=prerequisites %>>
			<input type = "hidden" id = "syllabus" value = <%=syllabus %>>
			<input type = "hidden" id = "maxmarks" value = <%=maxmarks %>>
			<input type = "hidden" id = "passmarks" value = <%=passmarks %>>
			<input type = "hidden" id = "duration" value = <%=duration %>>
			<tr><td>
			<input type = "hidden" name="link<%=i%>" id="link<%=i%>" value=<%=link %> >
							
			<a href="javascript:test('<%=i %>')" accesskey="m"><%= test_obj.getTest_name() %></a><br />
			</td>
			
			<td>
			<%=name %>
			</td>
			
			
			</tr>
		
<%		}
	
%>	

</table>


