
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><%@ page import="com.ignou.vcs.commons.*,com.ignou.vcs.pdfreport.*;" %>
<% 
	String userId = (String)request.getSession().getAttribute("userId");
	PdfGenerator pdf = new PdfGenerator();
	try {
	
	pdf.createOutputFile(userId);
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
		CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
	com.ignou.vcs.commons.beans.UserBean userBean = dbObject.getUserInfo(userId);
	
	String userName1 = userBean.getName();
	String fileName = userName1 + "-" + userId + ".pdf";
	String filePath = Utilities.STUDENT_REPORT_UPLOAD_PATH + "\\" + fileName;
	response.sendRedirect("http://localhost:8080/VCS/download.jsp?fileName="+fileName+"&filePath="+filePath);
	}
%>

