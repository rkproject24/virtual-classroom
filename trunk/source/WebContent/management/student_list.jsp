<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="com.ignou.vcs.commons.beans.StudentBean"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>

<%@page import="java.util.Date"%><html>
<body>
<table>
	<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>Course Start Date</u></th><th class="top" scope="col"><u>Course Completion Date</u></th></tr>
	
	<%
		int recordsPerPage = com.ignou.vcs.commons.Utilities.RECORDS_PER_PAGE;
		String pageNoString = request.getParameter("pageNum");
		System.out.println("Page Number:" + pageNoString);
		//String subjectID = request.getParameter("sid");
		String userID = (String)request.getSession().getAttribute("userId");
		//String userID = (String)request.getSession().getAttribute("userID");
		String courseID = request.getParameter("cid");
		int pageNumber = Integer.parseInt(pageNoString);
		
		CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
		java.util.ArrayList allStudents = (java.util.ArrayList)dbObject.getStudents(courseID);
		int studentsCount = allStudents.size();
		System.out.println("Count of Students:" + studentsCount);
		
		int pagesRequired = studentsCount/recordsPerPage;
		int extraPage = studentsCount%recordsPerPage;
		if(extraPage != 0) {
			pagesRequired++;
		}
		System.out.println("Pages Required: " + pagesRequired);
		
		int recordStart = pageNumber * recordsPerPage;
		int recordsEnd = (pageNumber+1) * recordsPerPage; 
		if(recordsEnd > studentsCount) {
			recordsEnd = studentsCount;
		}
		if(pageNumber <= (pagesRequired-1) ) {
			for(int i =recordStart ; i < recordsEnd ; i++) {
			com.ignou.vcs.commons.beans.StudentBean studentBean = (com.ignou.vcs.commons.beans.StudentBean)allStudents.get(i);
			String name = studentBean.getName();
			Date startDate = studentBean.getStartDate();
			Date endDate = studentBean.getEndDate();
			String emailP = studentBean.getEmailP();
			String contactP = studentBean.getContactP();
			Date dob = studentBean.getDob();
			
			
			String links = "student_description.jsp?email="+emailP+"&endDate="+endDate+"&startdate="+startDate+"&contact="+contactP+"&dob="+dob+"&uid="+studentBean.getUserID();
			System.out.println("LINK:" + links);
	%>
		<input type = "hidden" name="links<%=i%>" id="links<%=i%>" value=<%=links%> >
		
		<tr><th scope="row"><a href="javascript:fetchData('links','<%=i %>','student')"><%= name %></a></th><td><%= startDate %></td><td><%= endDate %></td></tr>	
	<%		
			}
			
	%>
	</table>	
	<%	
		}
		if(pageNumber != 0) {
			int previousPage = pageNumber - 1;
			String linkPrevious = "student_list.jsp?cid=" + courseID + "&pageNum=" + previousPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkPrevious %>','id')" class="greenbtn"><span>Prev</span></a></p></div>
	<%		
				
		}
		if(pageNumber < (pagesRequired-1)) {
			int nextPage = pageNumber + 1;
			String linkNext = "student_list.jsp?cid=" + courseID + "&pageNum=" + nextPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkNext %>','id')" class="bluebtn"><span>Next<span></a></p></div>
	<%
		}
		
	%>
		
	
</body>
</html>