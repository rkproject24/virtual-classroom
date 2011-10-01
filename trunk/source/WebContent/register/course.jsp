<%@ page import="com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*;" %>
<p><b><u>Select Courses on the Right</u></b><br /></p>
<%RegistrationBean regBean = (RegistrationBean)request.getSession().getAttribute("regBean");
//System.out.println("Day Birth:" + request.getParameter("dayBirth"));
	RegistrationDatabaseActivities db = new RegistrationDatabaseActivities();
	java.util.ArrayList course = db.getAllCourse();
	 for(int i=0; i < course.size(); i++)
    {	
		CourseBean courseBean = (CourseBean)course.get(i);
		
		String courseName = courseBean.getName();
		String cId=courseBean.getCourseId();
		String duration=courseBean.getDuration();
		String fees=courseBean.getFees();
		String link = "showSubjects.jsp?cid=" +cId+"&duration="+duration +"&fees="+fees; 
		System.out.println("link:"+link);
%>
<input type = "hidden" name="link<%= i%>" id="link<%= i%>" value=<%= link %>>
<a href="javascript:fetchData('link','<%=i %>','id2')" accesskey="m"><%= courseName %></a><br />
<%
	}
 %>	
