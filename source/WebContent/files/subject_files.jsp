<%@page import="java.util.ArrayList"%>
<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.files.beans.FileBean"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.files.database.FilesDatabaseActivities"%><html>
<body>
<table>
	<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Posted By</u></th><th class="top" scope="col"><u>Posting Date</u></th></tr>
	<%
		int recordsPerPage = Utilities.RECORDS_PER_PAGE;
		String pageNoString = request.getParameter("pageNum");
		System.out.println("Page Number:" + pageNoString);
		String subjectID = request.getParameter("sid");
		String courseID = request.getParameter("cid");
		String fileType = request.getParameter("fileType");
		//String userID = "FAC1002";
		String userID = (String)request.getSession().getAttribute("userId");
		
		CommonsDatabaseActivities obj = new CommonsDatabaseActivities();
		UserBean userBean = (UserBean)obj.getUserInfo(userID);
		
		if(userBean.getLevel().equals("0")) {
			courseID = userBean.getCourseID();
		}	else if(userBean.getLevel().equals("1")) {
			subjectID = userBean.getSubjectID();
		}
		
		int pageNumber = Integer.parseInt(pageNoString);
		
		
		FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
		ArrayList allFiles = (ArrayList) dbObject.getfiles(courseID,userBean.getLevel(),subjectID,fileType,userID);
		
		int filesCount = allFiles.size();
		System.out.println("Count of Files:" + filesCount);
		
		int pagesRequired = filesCount/recordsPerPage;
		int extraPage = filesCount%recordsPerPage;
		if(extraPage != 0) {
			pagesRequired++;
		}
		System.out.println("Pages Required: " + pagesRequired);
		System.out.println("Level:" + userBean.getLevel());
		
		int recordStart = pageNumber * recordsPerPage;
		int recordsEnd = (pageNumber+1) * recordsPerPage; 
		if(recordsEnd > filesCount) {
			recordsEnd = filesCount;
		}
		if(pageNumber <= (pagesRequired-1) || pagesRequired == 0) {
			for(int i =recordStart ; i < recordsEnd ; i++) {
			FileBean fileBean = (FileBean)allFiles.get(i);
			String title = fileBean.getTitle();
			String uploadedBy = fileBean.getUploadedBy();
			String uploadingDate = fileBean.getUploadDate();
			String image = Utilities.LECTURE_IMAGES_PATH + "\\";
			
			String description = fileBean.getDescription();
			Utilities util =  new Utilities();
			description = util.encodeString(description);
			String fileName = fileBean.getFilePath(); 
			String filePath = "";
			String link1 = "";
			if(fileType.equals("0")) {
				filePath = Utilities.GENERAL_FILES_UPLOAD_PATH + "\\" + fileName;
				filePath = util.encodeString(filePath);
				link1 = "file_description.jsp?desc="+description+"&filePath="+filePath+"&fileType="+fileType+"&level="+userBean.getLevel() ;
			} else if(fileType.equals("1")) {
				String topics = fileBean.getTopics();
				String temp = fileBean.getImage();
				
				if(temp == null ) {
					//System.out.println("if");
					image = image + "\\not_available.gif"; 
				} else {
					//System.out.println("else");
					image = image + fileBean.getImage();
				}
				
				
				topics = util.encodeString(topics);
				filePath = "http://localhost:8080/VCS/DATA/lectures/" + fileName;
				filePath = util.encodeString(filePath);
				link1 = "file_description.jsp?desc="+description+"&filePath="+filePath+"&topics="+topics+"&fileType="+fileType+"&level="+userBean.getLevel()+"&image="+image ;
			} else if(fileType.equals("2")) {
				String syllabus = fileBean.getSyllabus();
				syllabus = util.encodeString(syllabus);
				String fileID = fileBean.getFileID();
				String solutionFile = fileBean.getSolutionFile();
				filePath = Utilities.ASSIGNMENT_FILES_UPLOAD_PATH + "\\" + fileName;
				filePath = util.encodeString(filePath);
				link1 = "file_description.jsp?desc="+description+"&filePath="+filePath+"&syllabus="+syllabus+"&solutionFile="+solutionFile+"&fileID="+fileID+"&level="+userBean.getLevel()+"&userId="+userID+"&fileType="+fileType ;
			}
			if(userBean.getLevel().equals("2")) {
				link1 = link1 + "&subjectID=" + fileBean.getSubjectID() ;
			}
			link1 = link1 + "&fileName=" + fileName ; 
			System.out.println("LINK:" + link1);
	%>
		<input type = "hidden" name="links<%=i%>" id="links<%=i%>" value=<%=link1%> >
		
		<tr><th scope="row"><a href="javascript:fetchData('links','<%=i %>','id_box')"><%= title %></a></th><td><%= uploadedBy %></td><td><%= uploadingDate %></td></tr>	
	<%		
			}
			
	%>
	</table>	
	<%	
		}
		if(pageNumber != 0) {
			int previousPage = pageNumber - 1;
			String linkPrevious = "subject_files.jsp?cid=" + courseID + "&sid=" + subjectID + "&pageNum=" + previousPage + "&fileType=" + fileType;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkPrevious %>','id')" class="greenbtn"> <span>Prev</span></a></p></div>
	<%		
				
		}
		if(pageNumber < (pagesRequired-1)) {
			int nextPage = pageNumber + 1;
			String linkNext = "subject_files.jsp?cid=" + courseID + "&sid=" + subjectID + "&pageNum=" + nextPage + "&fileType=" + fileType;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkNext %>','id')" class="bluebtn"><span>Next</span></a></p></div>
	<%
		}
		
	%>
		
</body>
</html>
