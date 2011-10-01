
				
<%@page import="com.ignou.vcs.beans.StudentBean"%><br>

<%
				java.util.ArrayList studentList = (java.util.ArrayList)request.getSession().getAttribute("studentList");	
				if(!(studentList.size() == 0))
				{
 %>
				
					
					 <table>
					<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>Course</u></th><th class="top" scope="col"><u>EmailID</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<studentList.size();i++)
						{
							StudentBean student = (StudentBean)studentList.get(i);
							
							String name = student.getName();
							String course = student.getCourseId();
							String email = student.getEmailP();
							String userid = student.getUserID();
							
							System.out.println(userid);
							String url = "student_description.jsp?userid=" + userid;
						%>
							<tr><th scope="row"><a href="#" onclick="javascript:jah1('<%=url %>','id2')"><%=name %></a></th><td><%= course %></td><td><%= email %></td></tr>	
						<%
						}	
						%>
				</table>
				
		<%				
			}
				else{
				 %>
				 <br><br><b>No Matching Results Found.</b>
				<%} %> 					
								
				
				