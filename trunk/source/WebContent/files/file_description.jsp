<%@page import="com.ignou.vcs.commons.Utilities"%>
<%@page import="com.ignou.vcs.files.beans.SolutionBean"%>

<%@page import="com.ignou.vcs.files.database.FilesDatabaseActivities"%><html>
<body>

<%
	String description = request.getParameter("desc");
	Utilities util = new Utilities();
	String desc = util.decodeString(description);
	String filePath = request.getParameter("filePath");
	String fileType = request.getParameter("fileType");
	String fileName = request.getParameter("fileName");
	filePath = util.decodeString(filePath);
	if(!fileType.equals("1")) {
		for (int i = 0 ; i < filePath.length() ; i++) {
			if(filePath.charAt(i) == '\\' ) {
				filePath = filePath.replace(filePath.charAt(i), '/');
			}
		}
	}
	
	
	String image = request.getParameter("image");
	String imageLink = "";
	if(image !=  null) {
		String type = image.substring(image.length()-3, image.length());
		imageLink = "http://localhost:8080/VCS/displayImage.jsp?fp=" + image + "&tp=" + type;
		System.out.println("Image Link:" + imageLink);
	}
	
	String fileViewLink = null;
	String fileDownloadLink = null;
	if(fileType.equals("1")) {
		fileDownloadLink = filePath;
		
		// Checking the player to load based on fileExtension
	
		int j = 0;
		for(j = 0 ; j < fileName.length() ; j++) {
			if (fileName.charAt(j) == '.') {
				break;
			}
		}
		System.out.println("j:" + j);
		String fileExtension = fileName.substring(j+1,fileName.length());
		//String fileLink = null;
		
		if(fileExtension.equals("flv")) {
			fileViewLink = "http://localhost:8080/VCS/player3.jsp?filePath=" + filePath;
		} else {
			fileViewLink = "http://localhost:8080/VCS/player2.jsp?file=" + filePath;
		}
			
	} else {
		fileDownloadLink = "http://localhost:8080/VCS/download.jsp?fileName="+fileName+"&filePath="+filePath;
	}
	
	
	System.out.println("FileName: " + fileName);
	String topics = request.getParameter("topics");
	if(topics != null) {
		topics = util.decodeString(topics);
	}
	String syllabus = request.getParameter("syllabus");
	if(syllabus != null) {
		syllabus = util.decodeString(syllabus);
	}
	System.out.println("File View Link:" + fileViewLink);
	
	String solutionFile = request.getParameter("solutionFile");
	String fileID = request.getParameter("fileID");
	String level = request.getParameter("level");
	System.out.println("level:" + level);
	String userId = request.getParameter("userId");
	System.out.println("User IDD:" + userId);
	FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
	String solutionFilePath = "";
	String solutionDownloadLink = "";
	if(solutionFile != null) {
		
		for (int i = 0 ; i < solutionFile.length() ; i++) {
			if(solutionFile.charAt(i) == '\\' ) {
				solutionFile = solutionFile.replace(solutionFile.charAt(i), '/');
			}
		}
		solutionFilePath = Utilities.SOLUTION_FILES_UPLOAD_PATH + "//" + solutionFile;
		solutionDownloadLink = "http://localhost:8080/VCS/download.jsp?fileName="+solutionFile+"&filePath="+solutionFilePath;
	}
	
 %>
<div class="boxtop"></div>
<div class="box">
	<p>
		<%
			if(topics != null) {
			if (fileType.equals("1")) {
					%>
					<img src="<%= imageLink %>" class="icon" align="left"> &nbsp;
					<%
				}
		 %>
		<b><u>Topics:</u></b><br />
		&nbsp;<%= topics %>
		<br />
		<%
			}
			if(syllabus != null) {
		 %>
		<b><u>Syllabus:</u></b><br />
		<%= syllabus %>
		<br />
		<%
			}
		 %>
		
		<b><u>Description:</u></b><br />
		<%= desc %>
		<br /> 
		
		<div class="buttons">
			<a href = "<%=fileDownloadLink %>" class="bluebtn"><span>Download</span></a>
			<%
				if (fileType.equals("1")) {
			%>
			<a href="javascript:jah('<%= fileViewLink %>','id')" class="greenbtn"> <span>View</span></a>
			<%
				}				
			 %>
			<%
				if(level.equals("0") && fileType.equals("2")) {
					SolutionBean solutionBean = dbObject.solutionExists(fileID,userId);
					if(solutionBean.isSolutionExists()) {
						String feedback = solutionBean.getFeedback();
						String approved = solutionBean.getApproved();
						if(approved.equals("0")) {
							approved = "Pending for Approval.";
							feedback = "Not Available";
						} else if(approved.equals("1")) {
							approved = "Approved.";
						} else if(approved.equals("2")) { 
							approved = "Rejected.";
						}
						feedback = util.encodeString(feedback);
						String link = "getFeedback.jsp?feedback="+feedback+"&status="+approved;
			%>
			<a href="javascript:jah('<%= link %>','id_box')" class="greenbtn"><span>Feedback</span></a>
			<a href = "<%=solutionDownloadLink %>" class="bluebtn"><span> Faculty Soln </span></a>	
			<%	
					} else {
						String link = "submit_solution.jsp?fileId="+fileID+"&userId="+userId;
			%>
			<a href="javascript:jah('<%= link %>','id_box')" class="greenbtn"><span>My Solution</span></a>
			<a href = "<%=solutionDownloadLink %>" class="bluebtn"><span>Faculty Soln</span></a>	
			<%
					}
				} else if(level.equals("1") && fileType.equals("2")) {
					String link = "getSolutions.jsp?fileId="+fileID+"&userId="+userId+"&pageNum=0";
				
			%>
			<a href="javascript:jah('<%= link %>','id')" class="greenbtn"><span>Student Solns.</span></a>
			<a href = "<%=solutionDownloadLink %>" class="bluebtn"><span>My Soln.</span></a>	
			<%
				} else if(level.equals("2") && fileType.equals("2")) {
					
				%>
				
				<a href = "<%=solutionDownloadLink %>" class="greenbtn"><span> Faculty Solution </span></a>				
				<%
				}
				
			%>	
		</div>

		
	
</div>

</body>
</html>
