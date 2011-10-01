
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.evaluation"%>
<%@page import="com.ignou.vcs.beans.StudentBean"%><script src = "${pageContext.request.contextPath}/faculty/exam/js/ajax.js"></script>
<%
		String testid = request.getParameter("i");
		
		VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
		java.util.ArrayList student = db_obj.getStu(testid);
		
		
					
%>
			
			<table>
		            <tr><th class="top"><u>Student ID</u></th><th class="top" scope="col"><u>Student Name</u></th><th class="top" scope="col"><u>Evaluated</u></tr>
		            <%
		            for(int i = 0;i<student.size();i++)
		            {
		            	String evaluated_flag = "";
		            	evaluation evaluated = (evaluation)student.get(i);
		             	int flag = evaluated.getEvaluated();
		             	if(flag == 0)
		             	{
		             		evaluated_flag = "Not Evaluated";
		             	}
		             	else
		             		evaluated_flag = "Evaluated";
		             	String stu_id = (String)evaluated.getStudentid();
		             	String quesno = "0";
		             	request.getSession().setAttribute("quesno",quesno);
		             	StudentBean stuBean = db_obj.getStudentDetails(stu_id);
		             	String name = stuBean.getName();	 
		             	if(flag == 0){
		             	String url = "student_soln.jsp?testid=" + testid + "&studentid=" + stu_id; 
		             %>
		           <tr><td><a href = "javascript:jah1('<%=url %>','id1')"><%=stu_id %></a></td><td><%=name %></td><td><%=evaluated_flag%></td></tr>
					
					<%}
					else
					{
					
					%>
					<tr><td><%=stu_id %></td><td><%=name %></td><td><%=evaluated_flag%></td></tr>
					 <%}
					 }
					  %>
          		</table>