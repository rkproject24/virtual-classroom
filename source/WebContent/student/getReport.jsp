<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="com.ignou.vcs.commons.beans.StudentBean"%><html:html>
<head>
<script type="text/javascript" language="javascript">
function loadCss() {
	var browser = navigator.appName.toLowerCase();
	// document.write(browser);
	var stylesheet = document.getElementById("pagestyle");
	var menusheet = document.getElementById("menustyle");
	if(browser.indexOf("microsoft internet explorer") != -1) {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style_ie.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu_ie.css";
	}
	else {
		stylesheet.href="${pageContext.request.contextPath}/theme/css/style3.css";
		menusheet.href="${pageContext.request.contextPath}/theme/css/menu.css";		
	}
}
</script> 
<link id="pagestyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/style3.css">
<link id="menustyle" type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/theme/css/menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/theme/js/transmenu_Packed.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer"><title>Virtual Classroom System</title></head>
<body onload="javascript:loadCss()">
<%@include file="../header.jsp" %>
								
		
		<div class="left">
			<div class="left_articles">
				<div class="buttons">
				</div>
				<%@include file="../DisplayCalendar.jsp" %>
				<h2><a href="#"><u>Final Progress Report</u></a></h2>
				<p class="description">This is the final progress report of student.</p>
				
			<body>
				<% 	float total = 0;
					int totalMax = 0;
					String userId = (String)request.getParameter("userId");
					request.getSession().setAttribute("userId",userId);
					com.ignou.vcs.commons.Utilities obj = new com.ignou.vcs.commons.Utilities();
					String currentDate = obj.getCurrentDateInDB2Format();
					System.out.println("current date"+ currentDate);
					CommonsDatabaseActivities dbObj = new CommonsDatabaseActivities();
					StudentBean bean = (StudentBean)dbObj.getStudentDetails(userId);
					String studentName = bean.getName();
					//String duration = bean.getDuration();
					String fatherName = bean.getFatherName();
					String Email = bean.getEmailP();
					String StartDate = bean.getStartDate();
					String courseId = bean.getCourseId();
					System.out.println("courseId"+ courseId);
					String courseName = (String)dbObj.getCourseName(courseId);
					System.out.println("courseName at get report.jsp"+courseName);
					java.util.ArrayList list = (java.util.ArrayList)dbObj.getReport(courseId,userId);
					%>
					<br />
						<table border="1" width = "800px" cellpadding = "5" cellspacing="0" align="centre">
						<tr>
						<td width="3" colspan="2" ><font size="2"><b><u><i>NAME:</i></u></b></font>&nbsp;&nbsp;&nbsp;<font size="2"><%= studentName%></font></td>
					
						<td width="3" colspan="2" ><font size="2"><b><u><i>COURSE START DATE:</i></u></b></font>&nbsp;&nbsp;<font size="2"><%= StartDate%> - <%= currentDate%> </font></td>
						</tr>
						<tr>
						<td width="3" colspan="5" ><font size="2"><b><u><i>COURSE NAME:</i></u></b></font>&nbsp;&nbsp;&nbsp;<font size="2"><%= courseName %></font></td>
						</tr>
						<tr>
						<td width="3" colspan="5" ><font size="2"><b><u><i>FATHER'S NAME:</i></u></b></font>&nbsp;&nbsp;&nbsp;<font size="2"><%= fatherName%></font></td>
						</tr>	
						<tr>
						<td width="3" colspan="5" ><font size="2"><b><u><i>EMAIL ID:</i></u></b></font>&nbsp;&nbsp;&nbsp;<font size="2"><%= Email%></font></td>
						</tr>
						</table>
						<br/>
						
						<table border="1" width = "800px" cellpadding = "5" cellspacing="0">
						<tr><th class="top"><font size="2"><b><u>Subject Name</u></b></font></th><th class="top" scope="col"><font size="2"><b><u>Max Marks</u></b></font></th>
						<th class="top"><font size="2"><b><u>Highest in Class</u></b></font></th><th class="top"><font size="2"><b><u>Marks Scored</u></b></font></th></tr>
					<%
						int limit = 0;
						limit = list.size();
						
					for(int i=0;i<list.size();i++)
					{
						com.ignou.vcs.commons.beans.generateReport report = (com.ignou.vcs.commons.beans.generateReport)list.get(i);
						String temp = report.getTotalMarks();
						totalMax = totalMax + report.getMaxMarks();
						//System.out.println("totalMax"+ totalMax);
						if(temp.equals(""))
							{
								temp = "0";
							}
							
						 total = total + (Integer.parseInt(temp));
						//if(report.getTestId()== 0)
						//{
						//	response.sendRedirect("http://localhost:8080/VCS/student/underProgress.jsp");
						//}
						//else{
						%>
						<tr>
						<th scope="row"><b><font size="2"><%= report.getSubjectName()%></font></b></th> <td><font size="2"><%= report.getMaxMarks() %></font></td>
						<td><font size="2"><%= report.getHighestMarks() %></font></td>
						<td><font size="2"><%= report.getTotalMarks() %></font></td>
						
						</tr>
						
						<%
					//		}
						}
							float per = ((total*100)/totalMax);
						%>
						</table>
						<br />
						<table border="1" width = "800px" cellpadding = "5" cellspacing="0">
						<tr>
						<td width="570px"></td>
						<td><b><u><i><font size="2">GRAND TOTAL:</font></i></u></b>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><%=total %></font></td>
						</tr>
						<tr>
						<td width="570px"></td>
						<td><b><u><i><font size="2">PERCENTAGE MARKS:</font></i></u></b>&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><%= per %></font></td>
						</tr>
						
						
				</table>
				<br/>
				
				<a href = "http://localhost:8080/VCS/student/generatePdf.jsp" class = "greenbtn" align="centre"><span><u>Downlaod as PDF</u></span></a>
				
		</body></div>
			
			
			</div>	
		
		
			
		<%@include file="../footer.jsp" %>
	</div>
</body>
</html:html>
