
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities" %>
<%@page import="com.ignou.vcs.commons.beans.UserBean" %>
<%@page import="com.ignou.vcs.commons.Utilities" %>


<TR>
	<TD align="left">CourseID</TD>
	
	<TD><select property="courseID">
<%
	//String userID = "FAC1002";
	String userID = (String)request.getSession().getAttribute("userID");
	CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
	UserBean userBean = (UserBean)dbObject.getUserInfo(userID);
	String courseID = userBean.getCourseID();
	
	Utilities util = new Utilities();
	ArrayList courses = util.getSeparateValue(courseID);
	for (int i=0; i< courses.size(); i++) {
		String cid = (String) courses.get(i);
		String courseName = dbObject.getCourseName(cid);
%>
	<option value="<%=cid %>"><%=courseName %></option>
<%
	}
%>
</select></TD>
</TR>
</html>