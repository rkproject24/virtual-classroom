<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>
<html>
<head>
<title>solution_description</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<div class="boxtop"></div>
<div class="box">
	<p>
	<%
		String fileName = request.getParameter("fileName");
		String approved = request.getParameter("approved");
		String filePath = "";
		if(fileName != null) {
			filePath = Utilities.STUDENT_SOLUTION_FILES_UPLOAD_PATH + "//" + fileName;
		}
		String fileDownloadLink = "http://localhost:8080/VCS/download.jsp?fileName="+fileName+"&filePath="+filePath;
		if(approved.equals("1")) {
			String feedback = request.getParameter("feedback");
			if(feedback != null) {
			Utilities util = new Utilities();
			feedback = util.decodeString(feedback);
			approved = "Accepted";
	%>
	<b><u>Your Feedback:</u></b>
	<%= feedback %><br />	
	<b><u>Status:</u></b>
	<%= approved %>	
	<%		
			}
		 } else if(approved.equals("2")) {
			String feedback = request.getParameter("feedback");
			if(feedback != null) {
			System.out.println("Its Here!!");
			Utilities util = new Utilities();
			feedback = util.decodeString(feedback);
			approved = "Rejected";
	%>
	<b><u>Your Feedback:</u></b>
	<%= feedback %>	<br />
	<b><u>Status:</u></b>
	<%= approved %>	
	<%
			}
		}else if(approved.equals("0")) {
			String solutionId = request.getParameter("solutionId");
	%>
	<form action="javascript:insertFeedback();" name="feedbackForm">
	<input type="hidden" name="solutionId" id="solutionId" value="<%= solutionId %>">
	<table>
		<tr>
			<td width = "30"><b>FeedBack:</b></td>
			<td><textarea rows="5" cols="20" name="feedback" id="feedback" value=""></textarea> </td>
		</tr>
		<tr>
			<td width = "30"><b>Status:</b></td>
			<td><select name="status" id="status">
				<option value = "1">Accept</option>
				<option value = "2">Reject</option>
				</select></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit"></td>
			<td></td>
		</tr>	 
	</table>
	</form>	
	<%
		}
	%>
	
	<div class="buttons">
			<a href = "<%=fileDownloadLink %>" class="bluebtn"><span>Download File</span></a>
	</div>

</div>
</body>
</html>
