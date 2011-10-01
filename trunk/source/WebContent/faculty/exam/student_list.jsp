<%
	String courseid = request.getParameter("i");
	String facultyid = (String)request.getSession().getAttribute("userid");
	
	VCSDatabaseActivities db_ob = new VCSDatabaseActivities();
	java.util.ArrayList testid = db_ob.getTestID(courseid,facultyid);
	
 %>



<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.forms.Test"%><div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Tests</u></b><br />
					<%
					for(int i = 0;i<testid.size();i++)
					{
						Test form = (Test)testid.get(i);
						String name = form.getTest_name();
						String id = form.getTestid();
					%>
					<a href="#" accesskey="m" onclick = "jah('student_tests.jsp','id1','<%=id %>')"><%=name%></a><br />
					<%} %>
				</p>
			</div>