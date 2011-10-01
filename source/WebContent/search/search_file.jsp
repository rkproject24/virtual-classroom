<%@page import="com.ignou.vcs.beans.FileBean"%><br>

<%
				java.util.ArrayList fileList = (java.util.ArrayList)request.getSession().getAttribute("fileList");	
				if(!(fileList.size() == 0))
				{
 %>

<script src="${pageContext.request.contextPath}/search/ajax.js"></script>
<table>
	<tr>
		<th class="top"><u>Title</u></th>
		<th class="top" scope="col"><u>UploadedBy</u></th>
	</tr>

	<%
						
						
						for(int i = 0;i<fileList.size();i++)
						{
							FileBean filebean = (FileBean)fileList.get(i);
							String title = filebean.getTitle();
							String uploadedby = filebean.getUploadedby();
							String description = filebean.getDescription();
							String filepath  = filebean.getFilepath();
							String filetype = filebean.getFiletype();
							String name = filebean.getName();
							
							int fileid = filebean.getFileid();
							String url = "file_description.jsp?desc=" + description + "&fileid=" + fileid;
						
						%>
	<tr>
		<th scope="row"><a href="#"
			onclick="javascript:jah1('<%=url %>','id2')"><%=title %></a></th>
		<td><%= uploadedby %></td>
	</tr>
	<%
						}	
						%>
</table>
<%				
			}
				else{
				 %>
<br>
<br>
<b>No Matching Results Found.</b>
<%} %>



