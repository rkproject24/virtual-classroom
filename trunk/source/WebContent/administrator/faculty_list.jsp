<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="com.ignou.vcs.commons.beans.StudentBean"%>
<%@page import="com.ignou.vcs.commons.beans.FacultyBean"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%><html>
<body>
<table>
	<tr><th class="top"><u>Name</u></th><th class="top" scope="col"><u>Qualification</u></th><th class="top" scope="col"><u>Courses</u></th></tr>
	
	<%
		int recordsPerPage = com.ignou.vcs.commons.Utilities.RECORDS_PER_PAGE;
		String pageNoString = request.getParameter("pageNum");
		System.out.println("Page Number:" + pageNoString);
		//String subjectID = request.getParameter("sid");
		String userID = (String)request.getSession().getAttribute("userId");
		//String userID = (String)request.getSession().getAttribute("userID");
		String subjectId = request.getParameter("sid");
		int pageNumber = Integer.parseInt(pageNoString);
		
		CommonsDatabaseActivities dbObject = new CommonsDatabaseActivities();
		java.util.ArrayList allFaculties = (java.util.ArrayList)dbObject.getFaculties(subjectId);
		int facultyCount = allFaculties.size();
		System.out.println("Count of Faculties:" + facultyCount);
		
		int pagesRequired = facultyCount/recordsPerPage;
		int extraPage = facultyCount%recordsPerPage;
		if(extraPage != 0) {
			pagesRequired++;
		}
		System.out.println("Pages Required: " + pagesRequired);
		
		int recordStart = pageNumber * recordsPerPage;
		int recordsEnd = (pageNumber+1) * recordsPerPage; 
		if(recordsEnd > facultyCount) {
			recordsEnd = facultyCount;
		}
		if(pageNumber <= (pagesRequired-1) ) {
			for(int i =recordStart ; i < recordsEnd ; i++) {
			FacultyBean facultyBean = (FacultyBean)allFaculties.get(i);
			String name = facultyBean.getName();
			String qualification = facultyBean.getQualification();
			String courses = facultyBean.getCourseID();
			String emailP = facultyBean.getEmailP();
			String contactP = facultyBean.getContactP();
			String dob = facultyBean.getDob();
			
			
			String link1 = "student_description.jsp?email="+emailP+"&contact="+contactP+"&dob="+dob+"&uid="+facultyBean.getUserID();
			System.out.println("LINK:" + link1);
	%>
		<input type = "hidden" name="links<%=i%>" id="links<%=i%>" value=<%=link1%> >
		
		<tr><th scope="row"><a href="javascript:fetchData('links','<%=i %>','id_box')"><%= name %></a></th><td><%= qualification %></td><td><%= courses %></td></tr>	
	<%		
			}
			
	%>
	</table>	
	<%	
		}
		if(pageNumber != 0) {
			int previousPage = pageNumber - 1;
			String linkPrevious = "student_list.jsp?sid=" + subjectId + "&pageNum=" + previousPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkPrevious %>','id')" class="greenbtn"><span>Prev</span></a></p></div>
	<%		
				
		}
		if(pageNumber < (pagesRequired-1)) {
			int nextPage = pageNumber + 1;
			String linkNext = "student_list.jsp?sid=" + subjectId + "&pageNum=" + nextPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkNext %>','id')" class="bluebtn"><span>Next<span></a></p></div>
	<%
		}
		
	%>
		
	
</body>
</html>