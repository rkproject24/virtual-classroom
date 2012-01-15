<%@page import="com.ignou.vcs.profile.beans.profilebean"%>
<%@page import="com.ignou.vcs.profile.database.ProfileDatabaseOperations"%>

<%
	String level = request.getParameter("level");
	profilebean bean = new profilebean();
	
	bean.setEmailp(request.getParameter("emailp"));
	bean.setContactp(request.getParameter("contactp"));
	bean.setAddress(request.getParameter("address"));
	String userid = (String)request.getSession().getAttribute("userId");
	
	ProfileDatabaseOperations dbObj = new ProfileDatabaseOperations();
	
	dbObj.updateProfile(bean,level,userid);
	
	response.sendRedirect("http://localhost:8080/VCS/home.jsp"); 
	
%>