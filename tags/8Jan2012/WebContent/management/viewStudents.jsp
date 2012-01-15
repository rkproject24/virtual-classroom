<%
	String courseid = request.getParameter("cid");
	//String subjectid = (String)request.getSession().getAttribute("subjectid");
	
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	
	java.util.ArrayList list = dbObj.getStudentlist(courseid);
	
%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.StudentBean"%><script src = "${pageContext.request.contextPath}/faculty/course/ajax.js"></script>
 <table>
	<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>Course</u></th><th class="top" scope="col"><u>EmailID</u></th></tr>
					
	 <%
						
						
		for(int i = 0;i<list.size();i++)
		{
			StudentBean student = (StudentBean)list.get(i);
					
			String name = student.getName();
			String course = student.getCourseId();
			String email = student.getEmailP();
			String userid = student.getUserID();
			VCSDatabaseActivities dbObj1 = new VCSDatabaseActivities();				
			String coursename = dbObj1.getCourseName(course);
			String url = "view_student.jsp";
	%>
	<tr><th scope="row"><a href="#" onclick = "javascript:jah('<%=url %>','student','<%=userid %>')"><%=name %></a></th><td><%= coursename %></td><td><%= email %></td></tr>	
	<%
		}	
	%>
	</table>