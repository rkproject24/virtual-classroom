<%@ page import="com.ignou.vcs.registration.beans.*;" %>

<% 
	RegistrationBean regBean = (RegistrationBean)request.getSession().getAttribute("regBean");
	String courseId=(String)request.getSession().getAttribute("cid");
	System.out.println("master_card:"+courseId);
%>
<html>
<head>
<title>master_card</title>
</head>
<body>
<h3><img src="${pageContext.request.contextPath}/theme/images_links/creditcard_mastercard.png" class="thumbnail" alt="thumbnail">Please complete the fields below and click "Process Transaction"</h3>
<form action="javascript:insertPayment()" method="post" name="payment">
<table border="0" height="200" width="250" cellspacing="3" cellpadding="0">
<tr><td>CourseId</td><td><%=(String)request.getSession().getAttribute("cid")%></td></tr>
<tr><td>Amount(Rs.)</td><td>Rs.<%=request.getSession().getAttribute("fees") %></td></tr>
<tr><td>Name on Card</td><td><input type="textbox" name="card_name" value="" id="card_name"></td></tr>
<tr><td>Credit Card#</td><td><input type="textbox" name="card_no" value="" id="card_no">(No spaces or hyphens)</td></tr>
<tr></tr>
<tr><td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<input type="submit" value="submit" name="submit"></td></tr>
</body>
</html>
