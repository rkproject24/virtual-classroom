<%@ page import="com.ignou.vcs.commons.beans.*,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*" %>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><p><b><u>Related Subjects</u></b><br />
<%
   com.ignou.vcs.registration.beans.RegistrationBean regBean = (com.ignou.vcs.registration.beans.RegistrationBean)request.getSession().getAttribute("regBean");
   String courseId=request.getParameter("cid");
   String duration=request.getParameter("duration");
   String fees=request.getParameter("fees");
   CommonsDatabaseActivities dbObj= new CommonsDatabaseActivities();
   java.util.ArrayList subject= dbObj.getSubjects(courseId,false);
 	if(subject.size()>0)
 	{
	  	for(int i=0;i<subject.size();i++)
	  	{
	   		SubjectBean subjectBean=(SubjectBean)subject.get(i);
	   		String subjectName=subjectBean.getSubjectName();
	   		String subjectId=subjectBean.getSubjectId();
	   		String file = subjectBean.getSyllabus();
	  		String link2="showSyllabus.jsp?sid="+subjectId+ "&cid="+courseId+"&duration="+duration +"&fees="+fees+"&fileName="+file;
	   		System.out.println("link1:"+link2);
	   %>
		 <input type = "hidden" name="link2<%=i%>" id="link2<%=i%>" value=<%= link2 %> >
		 <a href="javascript:fetchData('link2','<%=i %>','forms')" accesskey="m"><%= subjectName %></a><br />
		 <%
		 }
 	}else
 	{
 		out.println("<center><font color='red'>No Subjects found.</font></center>");
 	}
	  %>

		
		