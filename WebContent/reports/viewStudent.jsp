<%@ page import="com.ignou.vcs.beans.*,com.ignou.vcs.database.*" %>
<%
	String facId = (String)request.getSession().getAttribute("userId");
	String subjectId = request.getParameter("sid");
	String courseid = request.getParameter("cid");
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	String testType = (String)request.getSession().getAttribute("testType");
	java.util.ArrayList list1 = dbObj.getStudentlist(courseid);
	request.getSession().setAttribute("studentBean",list1);
	
%>
	<table>
	<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>EmailID</u></th></tr>
					
	 <%
						
						
		for(int j = 0;j<list1.size();j++)
		{
			StudentBean student = (StudentBean)list1.get(j);
					
			String name = student.getName();
			String course = student.getCourseId();
			String email = student.getEmailP();
			String stuId = student.getUserID();
			System.out.println(name);		
			String url1 = "view_student_details.jsp?stuId="+stuId+ "&cid="+course+ "&sid="+subjectId;
	%>
	<input type = "hidden" name="url1<%=j%>" id="url1<%= j%>" value=<%= url1 %>>
						
	<tr><th scope="row"><a href="javascript:fetchData('url1','<%=j%>','id2')" accesskey="m"><%=name %></a></th><td><%= email %></td></tr>
	
	<%
		}	
	%>
	</table>