<%@ page import="com.ignou.vcs.commons.Utilities.*,com.ignou.vcs.database.*,com.ignou.vcs.beans.*" %>


		
					<%	String testType = request.getParameter("testType");
						request.getSession().setAttribute("testType",testType);
						String userid = (String)request.getSession().getAttribute("userId");
						VCSDatabaseActivities db_obj = new VCSDatabaseActivities();
	
						FacultyBean faculty_bean = db_obj.getFacultyDetails(userid);
						String courseid = faculty_bean.getCourseID();
						String subId = faculty_bean.getSubjectID();
	
						com.ignou.vcs.commons.Utilities pipe = new com.ignou.vcs.commons.Utilities();
	
						java.util.ArrayList course_list = pipe.getSeparateValue(courseid);
						java.util.ArrayList course_name = new java.util.ArrayList();
						for (int i = 0; i < course_list.size(); i++) {
							VCSDatabaseActivities db_obj1 = new VCSDatabaseActivities();
							String courseids = (String) course_list.get(i);
							String courseName = db_obj1.getCourseName(courseids);
							course_name.add(courseName);
						}
						%>
						
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.FacultyBean"%><div class="boxtop"></div>
				<div class="box">
				<p>
				<b><u>Courses</u></b><br />
					<%
						for (int i = 0; i < course_name.size(); i++) {
						String name = (String) course_name.get(i);
						String courseid1 = (String)course_list.get(i);
						String path="http://localhost:8080/VCS/reports/viewTestDetails.jsp?cid="+courseid1+ "&sid="+subId;
						
					 %>
						<input type = "hidden" name="path<%= i%>" id="path<%= i%>" value=<%= path %>>
						<a href="javascript:fetchData('path','<%=i %>','forms')" accesskey="m"><%= name %></a><br />
					<%}
					
					 %>
				</p>
				</div>
	
			 