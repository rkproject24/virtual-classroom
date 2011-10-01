<%@page import = "java.util.*" %>
<%@page import="com.ignou.vcs.xml.addXML"%>
<%
	
	ArrayList list = (ArrayList)request.getSession().getAttribute("list");
	for(int i = 0;i < list.size();i++)
	{
		Test_paper test_paper = (Test_paper)list.get(i);
		
		int quesno = test_paper.getQuesno();
		String ques = test_paper.getQues();
		String marks = test_paper.getQuesmarks();
		addXML obj = new addXML();
		ques = obj.unescapeForXML1(ques);
	%>
	

<%@page import="com.ignou.vcs.forms.Test_paper"%><b>Ques No:</b>
	<%=
		quesno
	 %>	
	 <br>
	 <b>Marks:</b>
	 <%=
	 	marks
	  %>
	  <br>
	  <b>Question:</b>
	  <%=
	  	ques
	   %>
	   <br><br>
	   <%
	}	
%>	