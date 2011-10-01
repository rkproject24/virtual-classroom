<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>

<%@page import="java.util.ArrayList"%>

<%@page import="com.ignou.vcs.commons.beans.UserBean"%>
<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.commons.database.CommonsDatabaseActivities"%>
<%@page import="com.ignou.vcs.files.database.FilesDatabaseActivities"%>

<%@page import="com.ignou.vcs.files.beans.FileBean"%><html:html>
<head>
<title>top_box</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>


<b style="text-align: center"><u>New Lectures</u></b><br>
<table cellspacing = "2" border = "0" align="center" cellpadding="0" padding="2">
<%
	String userId = (String) request.getSession().getAttribute("userId");
	CommonsDatabaseActivities dbObj = new CommonsDatabaseActivities();
	
	UserBean userBean = (UserBean)dbObj.getUserInfo(userId);
	
	String title= "";
	String subjectName = "";
	String topics = "";
	String uploadedBy = "";
	String image = Utilities.LECTURE_IMAGES_PATH;
	String filePath = "http://localhost:8080/VCS/DATA/lectures/" ;
		
	FilesDatabaseActivities dbObject = new FilesDatabaseActivities();
	ArrayList allFiles = dbObject.getLectures(userBean.getCourseID(), userBean.getLevel(), userBean.getSubjectID(), userId);
	System.out.println("Size:" + allFiles.size());
	for(int i = 0; i < 3 ; i++) {
		FileBean fileBean = (FileBean)allFiles.get(i);
		
		title = fileBean.getTitle();
		String level = userBean.getLevel();
		
		if(level.equals("1")) {
			subjectName = dbObj.getCourseName(fileBean.getCourseID());
		} else {
			subjectName = subjectName + dbObj.getSubjectName(fileBean.getSubjectID());
		}
		
		//System.out.println("SUB NAME:" + subjectName);
		topics = topics + fileBean.getTopics();
		uploadedBy = uploadedBy + fileBean.getUploadedBy();
		//System.out.println("IMAGE:" + image);
		
		filePath = filePath + fileBean.getFilePath();
		
		String lectureFileName = fileBean.getFilePath();
		String temp = fileBean.getImage();
				
		if(temp == null ) {
			//System.out.println("if");
			image = image + "\\not_available.gif"; 
		} else {
			//System.out.println("else");
			image = image + "\\" + fileBean.getImage();
		}
		
		System.out.println("IMAGE:" + image);
		
		String type = image.substring(image.length()-3, image.length());
		
		String imageLink = "displayImage.jsp?fp=" + image + "&tp=" + type;
		
		// Checking the player to load based on fileExtension
		int j = 0;
		for(j = 0 ; j < lectureFileName.length() ; j++) {
			if (lectureFileName.charAt(j) == '.') {
				break;
			}
		}
		System.out.println("j:" + j);
		String fileExtension = lectureFileName.substring(j+1,lectureFileName.length());
		String fileLink = null;
		
		if(fileExtension.equals("flv")) {
			fileLink = "http://localhost:8080/VCS/player3.jsp?filePath=" + filePath;
		} else {
			fileLink = "http://localhost:8080/VCS/player2.jsp?file=" + filePath;
		}
		
		
		System.out.print("fileLink:" + fileLink);
		
		%>
			<tr height="50">
				<td width="70px"> <a href="javascript:jah('<%= fileLink %>','id')"><img src="<%= imageLink %>" class="icon" align="left"></a></td>
				<td width="10px"></td>
				<td align="left" width="180px">
					<u><b><a href="javascript:jah('<%= fileLink %>','id')"><%= title %></b> (<%= subjectName %></u>)</a><br />
					<%= topics %><br />
					-- <b><%= uploadedBy %></b>
				</td>
			</tr>
		<%
		title= "";
		subjectName = "";
		topics = "";
		uploadedBy = "";
		image = Utilities.LECTURE_IMAGES_PATH;
		filePath = "http://localhost:8080/VCS/DATA/lectures/";
	}
 %>
</table>

</body>
</html:html>
