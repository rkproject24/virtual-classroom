<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 


<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.courseBean"%>
<%@page import="com.ignou.vcs.beans.SubjectBean"%><html:html>


<%
	String faculty_type = request.getParameter("i");
	System.out.println(faculty_type);
%>	
<html:form action = "schedule"  name = "scheduleForm" type = "com.ignou.vcs.forms.Schedule" onsubmit="return getSelectValues1()">
				
			<input type="hidden" name = "courseValues" id = "courseValues" value = "null">
			<input type="hidden" name = "subjectValues" id = "subjectValues" value = "null">
				<table border="0">
					<tbody>
						<tr>
							<%
							if(faculty_type.equals("course"))
							{
							%>
							<td><b>*Course:</b></td>
							<td><html:select property="course1" multiple="true" size = "3" onchange = "return getSelectValues()">
								<%
									VCSDatabaseActivities db_ob = new VCSDatabaseActivities();	
									java.util.ArrayList course_list = db_ob.getAllCourses();
								
									for (int i = 0; i < course_list.size(); i++) {
										courseBean course = (courseBean)course_list.get(i);
										
										String name = course.getCoursename();
										int courseid = course.getCourseid();
										String courseID = Integer.toString(courseid);
										System.out.println("courseid" + courseid);
										
								%>
									<html:option value="<%=courseID %>"><%=name%></html:option>
								<%
								}
								%>
							</html:select></td>
							<%}
							else
							{
							%>
							<td><b>*Subject:</b></td>
							<td><html:select property="subject" multiple = "true" size = "3" onchange = "return getSelectValues()">
								<%
										VCSDatabaseActivities db_ob1 = new VCSDatabaseActivities();	
										java.util.ArrayList subject_list = db_ob1.getAllSubjects();
										
										
										
										
										for (int i = 0; i < subject_list.size(); i++) {
										
											SubjectBean subjectBean = (SubjectBean)subject_list.get(i);
											String name = subjectBean.getSubjectName();
											String id = subjectBean.getSubjectId();
											System.out.println(name + " " + id);
											
										%>
										<html:option value="<%=id%>"><%=name%></html:option>
								<%
								}
								%>
							</html:select></td>
								
							<%
							}
							 %>
						</tr>
						<tr>
							<td><b>*Date:</b></td>
							<td><html:text property="date"></html:text>
								<a href = "#"  onclick = "displayCalendar(document.scheduleForm.date,'yyyy-mm-dd',this)"><span><b>Calendar</b></span></a>
							</td>
						
						</tr>
						<tr>
							<td><b>*Time Slot:</b></td>
							<td><html:select property="time">

							<html:option value="00:00AM-01:00AM">00:00AM-01:00AM</html:option>
							<html:option value="01:00AM-02:00AM">01:00AM-02:00AM</html:option>
							<html:option value="02:00AM-03:00AM">02:00AM-03:00AM</html:option>
							<html:option value="03:00AM-04:00AM">03:00AM-04:00AM</html:option>
							<html:option value="04:00AM-05:00AM">04:00AM-05:00AM</html:option>
							<html:option value="05:00AM-06:00AM">05:00AM-06:00AM</html:option>
							<html:option value="06:00AM-07:00AM">06:00AM-07:00AM</html:option>
							<html:option value="07:00AM-08:00AM">07:00AM-08:00AM</html:option>
							<html:option value="08:00AM-09:00AM">08:00AM-09:00AM</html:option>
							<html:option value="09:00AM-10:00AM">09:00AM-10:00AM</html:option>
							<html:option value="10:00AM-11:00AM">10:00AM-11:00AM</html:option>
							<html:option value="11:00AM-12:00PM">11:00AM-12:00PM</html:option>
							<html:option value="12:00PM-01:00PM">12:00PM-01:00PM</html:option>
							<html:option value="01:00PM-02:00PM">01:00PM-02:00PM</html:option>
							<html:option value="02:00PM-03:00PM">02:00PM-03:00PM</html:option>
							<html:option value="03:00PM-04:00PM">03:00PM-04:00PM</html:option>
							<html:option value="04:00PM-05:00PM">04:00PM-05:00PM</html:option>
							<html:option value="05:00PM-06:00PM">05:00PM-06:00PM</html:option>
							<html:option value="06:00PM-07:00PM">06:00PM-07:00PM</html:option>
							<html:option value="07:00PM-08:00PM">07:00PM-08:00PM</html:option>
							<html:option value="08:00PM-09:00PM">08:00PM-09:00PM</html:option>
							<html:option value="09:00PM-10:00PM">09:00PM-10:00PM</html:option>
							<html:option value="10:00PM-11:00PM">10:00PM-11:00PM</html:option>
							<html:option value="11:00PM-00:00AM">11:00PM-00:00AM</html:option>
						</html:select>
						<a href = "javascript:insert_mgmt()"><b>Check Availability</b></a>
						<div id = "timeslot"></div>
						</td>
						</tr>
						<tr>
							<td><b>*Title:</b></td>
							<td><html:text property="title"></html:text></td>
						</tr>
						<tr>
							<td><b>*Description:</b></td>
							<td><html:textarea property="description"></html:textarea></td>
						</tr>
						</tbody>
					</table><br>
					<center>
						<html:submit property="submit" value="Submit"></html:submit>
					</center>		
						
			</html:form>
</html:html>