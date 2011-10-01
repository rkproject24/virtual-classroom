<%
	String userId = (String)request.getSession().getAttribute("userId");
	System.out.println("userid at generate report.jsp"+userId);
	String url = "http://localhost:8080/VCS/student/getReport.jsp?userId="+userId;
	System.out.println("url at generate report.jsp:"+url);
	response.sendRedirect("getReport.jsp?userId="+userId);
%>