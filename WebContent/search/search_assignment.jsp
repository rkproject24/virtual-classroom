<%@page import="com.ignou.vcs.commons.Utilities"%>

<%@page import="com.ignou.vcs.beans.FileBean"%><script src="${pageContext.request.contextPath}/search/ajax.js"></script>			
				
				<br>

<%
				java.util.ArrayList assignmentList = (java.util.ArrayList)request.getSession().getAttribute("assignmentList");	
				if(!(assignmentList.size() == 0))
				{
 %>
					
					
					<table>
					<tr><th class="top"><u>Title</u></th><th class="top" scope="col"><u>UploadedBy</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<assignmentList.size();i++)
						{
							FileBean filebean = (FileBean)assignmentList.get(i);
							String title = filebean.getTitle();
							String uploadedby = filebean.getUploadedby();
							String description = filebean.getDescription();
							//String filepath  = filebean.getFilepath();
							String filetype = filebean.getFiletype();
							String name = filebean.getName();
							
							String fileName  = filebean.getFilepath();
							String filePath = Utilities.ASSIGNMENT_FILES_UPLOAD_PATH + "//" + fileName; 
							
							Utilities util = new Utilities();
							filePath = util.encodeString(filePath);
							//int fileid = filebean.getFileid();
							String url = "file_description.jsp?desc=" + description + "&fileName=" + fileName + "&filePath=" + filePath + "&fileType=2";
						
						%>
							<tr><th scope="row"><a href="#" onclick="javascript:jah1('<%=url %>','id2')"><%=title %></a></th><td><%= uploadedby %></td></tr>	
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
					
			
			
			