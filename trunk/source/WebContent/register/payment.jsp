<%@ page import="com.ignou.vcs.registration.beans.*;" %>

<% 
	RegistrationBean regBean = (RegistrationBean)request.getSession().getAttribute("regBean");
	String courseId=(String)request.getSession().getAttribute("cid");
	System.out.println(courseId);
%>
<html>
<head></head>
<body>
<table height="200" width="200" border="2" cellpadding="0"  cellspacing="4">
				<tr>
					<td>Name</td>
					<td><%=regBean.getName()%></td>
				</tr>
				<tr>
					<td>DOB</td>
					<td><%= regBean.getYearBirth() + "-" + regBean.getMonthBirth() +"-" +regBean.getDayBirth()%></td>
				</tr>
				<tr>
					<td>Email-Id(Primary)</td>
					<td><%= regBean.getEmailP()%></td>
				</tr>
				<tr>
					<td>Contact-No(Primary)</td>
					<td><%=regBean.getContactP() %></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><%=regBean.getAddress() %></td>
				</tr>
				<tr>
					<td>CourseId</td>
					<td><%=courseId %></td>
				</tr>
		</table>
<b>Payment options are as follows:</b></br>
<ul>
<li><a href="javascript:jah('master_card.jsp','forms')"><b>Master Card</b></a></li>
<li><a href=""><b>Visa</b></a></li>
<li><a href=""><b>PayPal</b></a></li>
<li><a href=""><b>Draft/Cheque</b></a></li>
</ul>
</body>
</html>
