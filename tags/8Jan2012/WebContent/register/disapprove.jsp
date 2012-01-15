<%@ page import="com.ignou.vcs.registration.beans.*,com.ignou.vcs.registration.database.*,com.ignou.vcs.commons.*;" %>
<html>
<head></head>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax_framework.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/ajax.js"></script>
<script type = "text/javascript">

</script>	
<body>
<div id = "insert_response"></div>
Faculty Rejected!!!
<%
   
   String appointmentId=request.getParameter("appointmentid");
   
   System.out.println("appointmentid:"+ appointmentId);
   RegistrationDatabaseActivities dbObj= new RegistrationDatabaseActivities();
   dbObj.deleteFaculty(appointmentId);
 %>

</body>
</html>

		
