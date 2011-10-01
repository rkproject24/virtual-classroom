
<%
	String userid = request.getParameter("userid");
	System.out.println("USERDI" + userid);
	VCSDatabaseActivities dbObj = new VCSDatabaseActivities();
	java.util.ArrayList list = dbObj.StudentReport(userid);
	System.out.println("ankt" + list.size());
%>	
	
<%@page import="com.ignou.vcs.database.VCSDatabaseActivities"%>
<%@page import="com.ignou.vcs.beans.StudentReport"%><table>
					<tr><th class="top"><u>Test Name</u></th><th class="top" scope="col"><u>Subject</u></th><th class="top" scope="col"><u>Marks</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<list.size();i++)
						{
							StudentReport testBean = (StudentReport)list.get(i);
							String testname = testBean.getTest_name();
							String subject = testBean.getSubjectname();
							int marks = testBean.getMarks();
							
							
							
						%>
							<tr><th scope="row"><%=testname %></th><td><%= subject %></td><td><%= marks %></td></tr>	
						<%
						}	
						%>
				</table>
	