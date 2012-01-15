		
				<br>

<%
				java.util.ArrayList noticeList = (java.util.ArrayList)request.getSession().getAttribute("noticeList");	
				if(!(noticeList.size() == 0))
				{
 %>
				
					<table>
					<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>Posted Date</u></th><th class="top" scope="col"><u>Posted By</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<noticeList.size();i++)
						{
							com.ignou.vcs.notices.beans.Notice notice = (com.ignou.vcs.notices.beans.Notice)noticeList.get(i);
							String title = notice.getTitle();
							String date1 = notice.getPostingDate();
							String postedBy = notice.getPostedBy();
							
							
							String description = notice.getDescription();
							String url = "notice_description.jsp?desc=" + description;
						%>
							<tr><th scope="row"><a href="javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= date1 %></td><td><%= postedBy %></td></tr>	
						<%
						}	
						%>
				</table>
				
<%				
			}
				else{
				 %>
				 <br><br><b>No Matching Results Found.</b>
				<%} %> 					
								
			
			