
				
				
				
<%@page import="com.ignou.vcs.beans.getTests"%><br>
<%
				java.util.ArrayList testList = (java.util.ArrayList)request.getSession().getAttribute("testList");	
				if(!(testList.size() == 0))
				{
 %>
					
					<table>
					<tr><th class="top"><u>Test Name</u></th><th class="top" scope="col"><u>Course</u></th><th class="top" scope="col"><u>Subject</u></th></tr>
					
					<%
						
						
						for(int i = 0;i<testList.size();i++)
						{
							getTests testBean = (getTests)testList.get(i);
							String testname = testBean.getTest_name();
							String takenby = testBean.getTaken_by();
							String testid = testBean.getTestid();
							String subject = testBean.getSubjectid();
							String course = testBean.getCourseid();
							String prereq = testBean.getPrereq();
							String syllabus = testBean.getSyllabus();
							String maxmarks = testBean.getMax_marks();
							String passmarks = testBean.getPass_marks();
							
							String url = "test_description.jsp?takenby=" + takenby + "&prereq=" + prereq + "&syllabus=" + syllabus + "&maxmarks=" + maxmarks + "&passmarks=" + passmarks ;
						%>
							<tr><th scope="row"><a href="#" onclick="javascript:jah1('<%=url %>','id2')"><%=testname %></a></th><td><%= course %></td><td><%= subject %></td></tr>	
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
									
				
