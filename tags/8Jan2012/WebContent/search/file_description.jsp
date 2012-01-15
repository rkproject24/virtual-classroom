<%
	String description = request.getParameter("desc");
	
 %>

<%@page import="com.ignou.vcs.commons.Utilities"%>
<div class="boxtop"></div>
			<div class="box">
				<p>
					<b><u>Description</u></b><br />
					<%=description %>
					<%
						String fileDownloadLink = null;
						String fileName = request.getParameter("fileName");
						String filePath = request.getParameter("filePath");
						String fileType = request.getParameter("fileType");
						System.out.println("fileType = " + fileType);
						Utilities util = new Utilities();
						filePath = util.decodeString(filePath);
						
						if(fileType.equals("2")) {
							for (int i = 0 ; i < filePath.length() ; i++) {
								if(filePath.charAt(i) == '\\' ) {
									filePath = filePath.replace(filePath.charAt(i), '/');
								}
							}
							fileDownloadLink = "http://localhost:8080/VCS/download.jsp?fileName="+fileName+"&filePath="+filePath;;
						} else {
							fileDownloadLink = filePath + fileName;
						}
						
						
						
					
					 %>
				</p>
				<div class="buttons"><p><a href="<%= fileDownloadLink %>" class="bluebtn"><span>Download</span></a></p></div>
			</div>