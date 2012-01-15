<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.notices.database.NoticesDatabaseActivities"%><html>
<body>
<table>
	<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Posted By</u></th><th class="top" scope="col"><u>Posting Date</u></th></tr>
	
	<%
		int recordsPerPage = com.ignou.vcs.commons.Utilities.RECORDS_PER_PAGE;
		String pageNoString = request.getParameter("pageNum");
		System.out.println("Page Number:" + pageNoString);
		String subjectID = request.getParameter("sid");
		String userID = (String)request.getSession().getAttribute("userId");
		//String userID = (String)request.getSession().getAttribute("userID");
		String courseID = request.getParameter("cid");
		int pageNumber = Integer.parseInt(pageNoString);
		
		NoticesDatabaseActivities dbObject = new NoticesDatabaseActivities();
		java.util.ArrayList allNotices = dbObject.getAllNotices(userID,courseID,subjectID);
		int noticesCount = allNotices.size();
		System.out.println("Count of Notices:" + noticesCount);
		
		int pagesRequired = noticesCount/recordsPerPage;
		int extraPage = noticesCount%recordsPerPage;
		if(extraPage != 0) {
			pagesRequired++;
		}
		System.out.println("Pages Required: " + pagesRequired);
		
		int recordStart = pageNumber * recordsPerPage;
		int recordsEnd = (pageNumber+1) * recordsPerPage; 
		if(recordsEnd > noticesCount) {
			recordsEnd = noticesCount;
		}
		if(pageNumber <= (pagesRequired-1) ) {
			for(int i =recordStart ; i < recordsEnd ; i++) {
			com.ignou.vcs.notices.beans.Notice noticeBean = (com.ignou.vcs.notices.beans.Notice)allNotices.get(i);
			String title = noticeBean.getTitle();
			String postedBy = noticeBean.getPostedBy();
			String postingDate = noticeBean.getPostingDate();
			//String noticeId = noticeBean.getNoticeID();
			String description = noticeBean.getDescription();
			Utilities util = new Utilities();
			String desc = util.encodeString(description);
			String link1 = "notice_description.jsp?desc="+desc;
			System.out.println("LINK:" + link1);
	%>
		<input type = "hidden" name="links<%=i%>" id="links<%=i%>" value=<%=link1%> >
		
		<tr><th scope="row"><a href="javascript:fetchData('links','<%=i %>','id_box')"><%= title %></a></th><td><%= postedBy %></td><td><%= postingDate %></td></tr>	
	<%		
			}
			
	%>
	</table>	
	<%	
		}
		if(pageNumber != 0) {
			int previousPage = pageNumber - 1;
			String linkPrevious = "subject_notices.jsp?cid=" + courseID + "&sid=" + subjectID + "&pageNum=" + previousPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkPrevious %>','id')" class="greenbtn"><span>Prev</span></a></p></div>
	<%		
				
		}
		if(pageNumber < (pagesRequired-1)) {
			int nextPage = pageNumber + 1;
			String linkNext = "subject_notices.jsp?cid=" + courseID + "&sid=" + subjectID + "&pageNum=" + nextPage;
	%>
		<div class="buttons"><p><a href="javascript:jah('<%= linkNext %>','id')" class="bluebtn"><span>Next<span></a></p></div>
	<%
		}
		
	%>
		
	
</body>
</html>