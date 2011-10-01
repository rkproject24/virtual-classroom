
<%
	String userName = request.getParameter("userName");
%>


<%@page import="java.util.Date"%><p id="top_info"><br />
<a href="${pageContext.request.contextPath}/home.jsp" accesskey="m"><b>Home</b></a>
<a href="${pageContext.request.contextPath}/changepassword.jsp"
	accesskey="m"><b>Change Password</b></a> <a
	href="${pageContext.request.contextPath}/logout.jsp" accesskey="m"><b>Logout</b></a>
<br />
<% 
			 	String greetUser = "";
				Date dt = new Date();
				int timeHrs = dt.getHours();
				if(timeHrs>=0 && timeHrs<12)
				{
					greetUser = "Good Morning...";
				}else if(timeHrs>=12 && timeHrs<16)
				{
					greetUser = "Good Afternoon...";
				}else if(timeHrs>=16 && timeHrs<20)
				{
					greetUser = "Good Evening...";
				}else if(timeHrs>=20 && timeHrs<24)
				{
					greetUser = "Have a Nice Time...";	
				}
				%> <font color="#008040"><b>Hi <a
	href="${pageContext.request.contextPath}/profile/profile.jsp"><i><u><%= userName %></u></i></a></b>,
<%=greetUser %></font></p>