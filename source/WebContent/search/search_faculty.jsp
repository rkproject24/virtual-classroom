<%@page import="com.ignou.vcs.beans.FacultyBean"%>
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%><br>

<%
				java.util.ArrayList facultyList = (java.util.ArrayList)request.getSession().getAttribute("facultyList");	
				if(!(facultyList.size() == 0))
				{
 %>
		
				
				
				
				
					<table>
					<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>Subject</u></th><th class="top" scope="col"><u>Courses</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<facultyList.size();i++)
						{
							FacultyBean facultybean = (FacultyBean)facultyList.get(i);
							
							String name = facultybean.getName();
							String subject = facultybean.getSubjectID();
							String qualification = facultybean.getQualification();
							String courseid = facultybean.getCourseID();
							String email = facultybean.getEmailP();
							String url = "faculty_description.jsp?qualification=" + qualification + "&email=" + email + "&name=" + name;
							com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
							java.util.ArrayList courseList = obj.getSeparateValue(courseid);
							
						%>
							<tr><th scope="row"><a href="#" onclick="javascript:jah1('<%=url %>','id2')"><%=name %></a></th><td><%= subject %></td><td><%
							for(int j=0;j<courseList.size();j++)
							{
								VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
								String coursename = dbObj.getCourseName((String)courseList.get(j));
								
							%>	
							 <%=coursename %>
							 <%}
							  %>
							 </td></tr>	
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
							
				