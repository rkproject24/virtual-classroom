<%@ page import="com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*;" %>
<html>
<head></head>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script type = "text/javascript">

</script>	
<body>
<div id = "insert_response"></div>
<p><b><u>Courses</u></b><br />
<%
   request.getSession().getAttribute("userId");
   String appointmentId=request.getParameter("appointmentid");
   request.getSession().setAttribute("appointmentId",appointmentId);
   //String userID=request.getParameter("userId");
   String subjectId=request.getParameter("subjectId");
   request.getSession().setAttribute("subjectId",subjectId);
   System.out.println("appointmentid:"+ appointmentId);
   System.out.println("subjectid:"+ subjectId);
   System.out.println("managementid:"+ request.getSession().getAttribute("userId"));
   RegistrationDatabaseActivities dbObj= new RegistrationDatabaseActivities();
   java.util.ArrayList courses= dbObj.getAllCourse();
 %>
<form name="coursesForm" method="post" action="javascript:insertCourse();">
<input type="hidden" name = "courseValues" value = "null">
 <table>
 <tr>
 <td><select name="name" multiple="true" size="4">
 <%
  	for(int i=0;i<courses.size();i++)
  	{
   		CourseBean courseBean=(CourseBean)courses.get(i);
   %>
  <option value="<%=courseBean.getCourseId()%>"><%=courseBean.getName()%></option>
 <%
 }
  %>
</select>
</td>
</tr>
</table>
<div class="button" align="right"><input type="submit" name="submit" value="Assign Courses"></div>
</form>
</body>
</html>

		
