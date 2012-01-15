<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.ignou.vcs.files.database.FilesDatabaseActivities"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.files.beans.SolutionBean"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>

<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><html>
<head>
<title>getSolutions</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<table>
	<tr><th class="top"><u>Submitted By</u></th><th class="top" scope="col"><u>Submission Date</u></th><th class="top" scope="col"><u>Status</u></th></tr>
	
<%
	UserBean userBean = (UserBean)request.getSession().getAttribute("UserBean");
	
	if(userBean==null)
	{
		response.sendRedirect("./NewLogin.jsp");
	}
	int recordsPerPage = com.ignou.vcs.commons.Utilities.RECORDS_PER_PAGE;
	String pageNoString = request.getParameter("pageNum");
	System.out.println("Page Number:" + pageNoString);
	String fileId = request.getParameter("fileId");
	String userID = request.getParameter("userId");
	
	FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
	ArrayList allSolutions = (ArrayList) dbObject.getStudentSolutions(fileId);
	
	int pageNumber = Integer.parseInt(pageNoString);
	
	int solutionsCount = allSolutions.size();
		System.out.println("Count of Solutions:" + solutionsCount);
		
		int pagesRequired = solutionsCount/recordsPerPage;
		int extraPage = solutionsCount%recordsPerPage;
		if(extraPage != 0) {
			pagesRequired++;
		}
		System.out.println("Pages Required: " + pagesRequired);
		
		int recordStart = pageNumber * recordsPerPage;
		int recordsEnd = (pageNumber+1) * recordsPerPage; 
		if(recordsEnd > solutionsCount) {
			recordsEnd = solutionsCount;
		}
		
		if(pageNumber <= (pagesRequired-1) || pagesRequired == 0 ) {
			for(int i =recordStart ; i < recordsEnd ; i++) {
			SolutionBean solutionBean = (SolutionBean)allSolutions.get(i);
			String studentUserId = solutionBean.getUserID();
			String studentName = userBean.getName();
			String approved = solutionBean.getApproved();
			String feedback = solutionBean.getFeedback();
			String solutionFileName = solutionBean.getAnswerFile();
			String submitDate = solutionBean.getSubmitDate();
			System.out.println("APPROVED:" + approved);
			String link1 = "solution_description.jsp?fileName="+solutionFileName+"&approved="+solutionBean.getApproved();
			if(approved.equals("0")) {
				approved = "Pending";
				link1 = link1 + "&solutionId="+solutionBean.getSolutionID();
			} else if(approved.equals("1")) {
				approved="Accepted";
				Utilities util = new Utilities();
				util.encodeString(feedback);
				link1 = link1 + "&feedback="+feedback;
			} else if(approved.equals("2")) {
				approved="Rejected";
				Utilities util = new Utilities();
				util.encodeString(feedback);
				link1 = link1 + "&feedback="+feedback;
			}
			System.out.println("LINK:" + link1);
		%>
		<input type = "hidden" name="links<%=i%>" id="links<%=i%>" value=<%=link1%> >
		
		<tr><th scope="row"><%= studentName %></th><td><%= submitDate %></td><td><a href="javascript:fetchData('links','<%=i %>','id_box')"><%= approved %></a></td></tr>	
	<%		
			}
			
	%>
	</table>	
	<%	
		}
		if(pageNumber != 0) {
			int previousPage = pageNumber - 1;
			String linkPrevious = "getSolutions.jsp?fileId="+fileId+"&userId="+userID+"&pageNum=" + previousPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkPrevious %>','id')" class="greenbtn"> Prev</a></p></div>
	<%		
				
		}
		if(pageNumber < (pagesRequired-1)) {
			int nextPage = pageNumber + 1;
			String linkNext = "getSolutions.jsp?fileId="+fileId+"&userId="+userID+"&pageNum=" + nextPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkNext %>','id')" class="bluebtn">Next</a></p></div>
	<%
		}
		
	%>
		

</body>
</html>
